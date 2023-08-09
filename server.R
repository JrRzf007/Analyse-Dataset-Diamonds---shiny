#serveur
server <- function(input, output) {
  # Lire le fichier Excel lorsqu'un fichier est chargé
  BD <- reactive({
    req(input$file)
    infile <- input$file
    if (is.null(infile)) {
      return(NULL)
    }
    read_excel(infile$datapath)
  })
  
  # Afficher la table de données
  output$bd <- renderDataTable({
    BD()
  })
  
  # Afficher le graphique ggplot en fonction du choix de l'utilisateur
  output$quali <- renderPlot({
    data_filtered <- BD()
    choice <- input$categorielle
    if (!is.null(data_filtered) && choice %in% c("cut", "color", "clarity")) {
      plot <- generate_plot(data_filtered, choice)
      print(plot)
    }
  })
  
  output$aberr <- renderPlot({
    data_filtered <- BD()
    choice <- input$val_aber
    if (!is.null(data_filtered) && choice %in% c("carat", "depth", "table", "price", "x", "y", "z")) {
      plot <- aberrante(data_filtered, choice)
      print(plot)
    }
  })
  
  # Afficher le graphique d'histogramme de la distribution en fonction du choix de l'utilisateur
  output$dist <- renderPlot({
    data_filtered <- BD()
    choice <- input$val_dist
    if (!is.null(data_filtered) && choice %in% c("carat", "depth", "table", "price", "x", "y", "z")) {
      plot <- dist_plot(data_filtered, choice)
      print(plot)
    }
  })
  
  # Générer la matrice de corrélation en fonction des variables numériques sélectionnées
  output$quanti <- renderPlot({
    data_filtered <- BD()
    selected_vars <- input$num
    if (!is.null(data_filtered) && length(selected_vars) > 0) {
      cor_matrix <- generate_correlation_matrix(data_filtered, selected_vars)
      correlation_plot <- generate_correlation_plot(cor_matrix)
      print(correlation_plot)
    }
  })
  
  
  # Render linear regression plot
  output$rl <- renderPlot({
    data <- BD()
    if (is.null(data)) {
      return(NULL)
    }
    
    model <- lm(price ~ ., data = data)
    y_pred <- predict(model)
    
    y_price <- data$price
    
    r_squared <- cor(y_pred, y_price)^2
    output$r2 <- renderPrint({
      r_squared
    })
    
    ggplot(data, aes(x = y_pred, y = y_price, color = clarity)) +
      geom_point() +
      labs(x = "Prix prédits", y = "Prix réels",title = "Comparaison prédictions et réalité selon la clarté") +
      theme_minimal()
  })
  
  
  #xgboost
  output$xg <- renderPlot({
    data <- BD()
    if (is.null(data)) {
      return(NULL)
    }
    
    y_actual <- data$price
    x_features <- data[, c("carat", "table", "x", "y")]
    
    X <- as.matrix(x_features)
    y <- as.matrix(y_actual)
    
    xgb_model <- xgboost(data = X, label = y, nrounds = 390)
    
    y_pred_xgboost <- predict(xgb_model, X)
    
    y_price <- data$price
    
    r_squared <- cor(y_pred_xgboost, y_price)^2
    output$rq <- renderPrint({
      r_squared
    })
    
    
    ggplot(data, aes(x = y_pred_xgboost, y = y_price, color = clarity)) +
      geom_point() +
      labs(x = "Prix prédits", y = "Prix réels", title = "Comparaison prédictions et réalité selon la clarté") +
      theme_minimal()
  })
  
  #Random Forest
  output$rf <- renderPlot({
    data <- BD()
    if (is.null(data)) {
      return(NULL)
    }
    
    y_actual <- diamonds$price
    x_features <- diamonds[, c("carat", "table", "x", "y")]
    
    # randomForest ne prends en paramètres que des vecteur,matrices,..
    X <- as.matrix(x_features)
    y <- as.vector(y_actual)
    
    # Entraîner le modèle Random Forest
    rf_model <- randomForest(x = X, y = y, ntree = 10)
    
    # Prédiction des valeurs de prix (y_pred) en utilisant le modèle Random Forest
    y_pred_rf <- predict(rf_model, X)
    
    y_price <- data$price
    
    r_squared <- cor(y_pred_rf, y_price)^2
    output$rt <- renderPrint({
      r_squared
    })
    
    
    ggplot(data, aes(x = y_pred_rf, y = y_price, color = clarity)) +
      geom_point() +
      labs(x = "Prix prédits", y = "Prix réels", title = "Comparaison prédictions et réalité selon la clarté") +
      theme_minimal()
  })
  
  # Gérer la sélection de la méthode de prédiction et afficher les prédictions
  output$dh <- renderDataTable({
    selected_method <- input$tpred
    if (!is.null(selected_method)) {
      predictions <- mt_ch(BD(), selected_method)
      predictions
    }
  })
  
  # Télécharger les prédictions au format Excel
  output$méth <- downloadHandler(
    filename = function() {
      paste("Predictions_", input$tpred, ".xlsx", sep = "")
    },
    content = function(file) {
      selected_method <- input$tpred
      if (!is.null(selected_method)) {
        predictions <- mt_ch(BD(), selected_method)
        write.xlsx(predictions, file, row.names = FALSE)
      }
    }
  )
  
  
  #ACP
  output$ca <- renderPlot({
    diamonds_cust <- diamonds %>% 
      mutate(color = as.integer(color), cut = as.integer(cut), clarity = as.integer(clarity))
    set.seed(220015)
    intrain <- sample(nrow(diamonds_cust), nrow(diamonds_cust)*0.004)
    diamonds_subset <- diamonds_cust[intrain,]
    diamonds_scaled <- scale(diamonds_subset)
    pca_result <- PCA(diamonds_scaled, scale.unit = FALSE)
    
    output$crt <- renderPlot({
      fviz_eig(pca_result, addlabels = TRUE)
    })
    
    output$ctb <- renderPlot({
      fviz_contrib(pca_result, choice = "var", axes = 1:2)
    })
    
  })
  
  #Kmeans
  output$km <- renderPlot({
    diamonds_cust <- diamonds %>% 
      mutate(color = as.numeric(color), cut = as.numeric(cut), clarity = as.numeric(clarity))
    set.seed(220015)
    intrain <- sample(nrow(diamonds_cust), nrow(diamonds_cust)*0.004) #on prend 0.4% des données aléatoirement
    diamonds_subset <- diamonds_cust[intrain,]
    diamonds_scaled <- scale(diamonds_subset)
    pca_diamonds <- PCA(diamonds_scaled, scale.unit=F)
    fviz_nbclust(diamonds_scaled, kmeans, method = "wss")
    diamonds_cluster <- kmeans(diamonds_scaled, centers = 3)
    diamonds_subset$cluster <- diamonds_cluster$cluster
    
    fviz_cluster(diamonds_cluster, data = diamonds_scaled) +
      labs(title = "Clusters des Diamants")
    
  })
  
  #resultat
  output$cf <- renderTable({
    diamonds_cust <- diamonds %>% 
      mutate(color = as.integer(color), cut = as.integer(cut), clarity = as.integer(clarity))
    set.seed(220015)
    intrain <- sample(nrow(diamonds_cust), nrow(diamonds_cust)*0.004)
    diamonds_subset <- diamonds_cust[intrain,]
    dim(diamonds_subset)
    diamonds_scaled <- scale(diamonds_subset)
    pca_diamonds <- PCA(diamonds_scaled, scale.unit=F)
    fviz_nbclust(diamonds_scaled, kmeans, method = "wss")
    diamonds_cluster <- kmeans(diamonds_scaled, centers = 3)
    diamonds_subset$cluster <- diamonds_cluster$cluster
    fviz_cluster(diamonds_cluster, data = diamonds_scaled)
    
    results <- diamonds_subset %>% 
      group_by(cluster) %>% 
      summarise_all(mean)
  })
  
}
