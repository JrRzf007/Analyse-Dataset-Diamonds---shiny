library(tidyverse)
library(ggplot2)
library(scales)
library(RColorBrewer)
library(corrplot)
library(xgboost)
library(randomForest)


generate_plot <- function(data, choice) {
  data <- data %>% 
    mutate(color_group = factor(get(choice)))
  
  ggplot(data, aes(x = price, y = get(choice), color = color_group)) +
    geom_jitter(alpha = 0.7, size = 1.5) + 
    scale_x_continuous(labels = scales::dollar) +
    labs(title = paste("Price vs", choice),
         x = "",
         y = "") +
    theme_minimal() +
    theme(legend.position = "bottom")
}

# Fonction pour générer la matrice de corrélation
generate_correlation_matrix <- function(data, numeric_vars) {
  cor_matrix <- cor(data[, numeric_vars])
  return(cor_matrix)
}

# Fonction pour générer la heatmap avec la librairie corrplot
generate_correlation_plot <- function(cor_matrix) {
  corrplot(cor_matrix, type = "upper", order = "hclust", col = brewer.pal(n = 8, name = "RdBu"))
}

# Fonction pour générer le graphique boxplot des valeurs aberrantes
aberrante <- function(data, choice) {
  ggplot(data, aes(x = get(choice))) +
    geom_boxplot(fill = "lightblue", color = "black") +
    labs(x = choice) +
    theme_minimal()
}

# Fonction pour générer le graphique d'histogramme de la distribution des variables
dist_plot <- function(data, choice) {
  ggplot(data, aes(x = get(choice))) +
    geom_histogram(aes(y = ..density..), fill = "lightblue", color = "black", bins = 30) +
    geom_density(color = "red", size = 0.5) +
    labs(x = choice) +
    theme_minimal()
}


#Fonction choix méthode
mt_ch <- function(data,ch){
  m <- c("Régression Linéaire", "XGBoost", "Random Forest")
  
  if(ch == m[1]){
    model <- lm(price ~ ., data = data)
    y_pred <- predict(model)
    y_price <- data$price
    df <- data.frame(Prédictions = y_pred, Réelles = y_price)
  }
  if(ch == m[2]){
    y_actual <- data$price
    x_features <- data[, c("carat", "table", "x", "y")]
    X <- as.matrix(x_features)
    y <- as.matrix(y_actual)
    xgb_model <- xgboost(data = X, label = y, nrounds = 390)
    y_pred <- predict(xgb_model, X)
    y_price <- data$price
    df <- data.frame(Prédictions = y_pred, Réelles = y_price)
  }
  if(ch == m[3]){
    y_actual <- diamonds$price
    x_features <- diamonds[, c("carat", "table", "x", "y")]
    X <- as.matrix(x_features)
    y <- as.vector(y_actual)
    rf_model <- randomForest(x = X, y = y, ntree = 10)
    y_pred <- predict(rf_model, X)
    y_price <- data$price
    df <- data.frame(Prédictions = y_pred, Réelles = y_price)
  }
  df
}



