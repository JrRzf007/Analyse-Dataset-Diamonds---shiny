#créer votre propre thème
customTheme <- shinyDashboardThemeDIY(
  
  ### Font général
  appFontFamily = "Helvetica",      # police général
  appFontColor = "rgb(0,0,0)",
  primaryFontColor = "rgb(20,20,100)",    # texte principal
  infoFontColor = "rgb(20,100,20)",     
  successFontColor = "rgb(50,140,110)",
  warningFontColor = "rgb(50,50,50)", 
  dangerFontColor = "red" 
  ,bodyBackColor = "#C6C6C6"        
  
  ### Entête
  ,logoBackColor = "rgba(20,200,220,0.35)"  # Changer la couleur de fond du logo
  ,headerButtonBackColor = cssGradientThreeColors(
    direction = "down"                          
    ,colorStart = "rgb(40,120,130)"        
    ,colorMiddle = "rgb(25,120,130)"     
    ,colorEnd = "rgb(25,120,130)"    
    ,colorStartPos = 0              
    ,colorMiddlePos = 50         
    ,colorEndPos = 100  
  )
  ,headerButtonIconColor = cssGradientThreeColors(
    direction = "down"
    ,colorStart = "rgb(40,120,130)"
    ,colorMiddle = "rgb(25,120,130)"
    ,colorEnd = "rgb(25,120,130)"
    ,colorStartPos = 0    
    ,colorMiddlePos = 50   
    ,colorEndPos = 85 
  ) 
  ,headerButtonBackColorHover = "rgb(190,200,210)"
  ,headerButtonIconColorHover = "rgb(0,0,0)"           
  
  ,headerBackColor = cssGradientThreeColors(
    direction = "right"                     
    ,colorStart = "rgba(20,215,190,0.75)"         
    ,colorMiddle = "rgba(20,215,190,0.75)"      
    ,colorEnd = "rgba(20,215,190,0.75)"          
    ,colorStartPos = 0                           
    ,colorMiddlePos = 30                         
    ,colorEndPos = 100                          
  )
  ,headerBoxShadowColor = "rgba(20,200,210,0.35)"  
  ,headerBoxShadowSize = "2px 3px 2px"   
  
  ### Barre verticale
  ,sidebarBackColor = cssGradientThreeColors(    
    direction = "down"
    ,colorStart = "rgb(25,120,130)" 
    ,colorMiddle = "rgb(25,120,145)"  
    ,colorEnd = "rgb(25,120,145)"    
    ,colorStartPos = 0        
    ,colorMiddlePos = 50    
    ,colorEndPos = 100  
  )
  ,sidebarPadding = 0  
  
  ,sidebarMenuBackColor = "transparent"      
  ,sidebarMenuPadding = 0                    
  ,sidebarMenuBorderRadius = 0        
  
  ,sidebarShadowRadius = 0        
  ,sidebarShadowColor = "#777777"            
  
  ,sidebarUserTextColor = "rgb(255,255,255)"  
  
  ,sidebarSearchBackColor = "rgb(25,100,130)"    
  ,sidebarSearchIconColor = "rgb(20,80,110)"     
  ,sidebarSearchBorderColor = "rgb(25,120,130)"  
  
  ,sidebarTabTextColor = "rgb(255,255,255)"      
  ,sidebarTabTextSize = 14                     
  ,sidebarTabBorderStyle = "none none solid none"  
  ,sidebarTabBorderColor = "rgb(25,90,130)"   
  ,sidebarTabBorderWidth = 1        
  
  ,sidebarTabBackColorSelected = cssGradientThreeColors(
    direction = "right"     
    ,colorStart = "rgba(20,200,235,0.75)"   
    ,colorMiddle = "rgba(20,200,235,0.75)"
    ,colorEnd = "rgba(0,255,213,0.75)" 
    ,colorStartPos = 0     
    ,colorMiddlePos = 30    
    ,colorEndPos = 100
  )
  ,sidebarTabTextColorSelected = "rgb(0,0,0)"     
  ,sidebarTabRadiusSelected = 0
  
  ,sidebarTabBackColorHover = cssGradientThreeColors( 
    direction = "right"   
    ,colorStart = "rgba(44,200,235,0.0.75)" 
    ,colorMiddle = "rgba(44,200,235,0.75)"
    ,colorEnd = "rgba(0,255,213,0.75)" 
    ,colorStartPos = 0      
    ,colorMiddlePos = 30   
    ,colorEndPos = 100 
  )
  ,sidebarTabTextColorHover = "rgb(60,60,80)"   
  ,sidebarTabBorderStyleHover = "none none solid none" 
  ,sidebarTabBorderColorHover = "rgb(65,120,160)"      
  ,sidebarTabBorderWidthHover = 1                  
  ,sidebarTabRadiusHover = 0  

    ### Box
  ,boxBackColor = "rgb(0,0,0)"                
  ,boxBorderRadius = 4
  ,boxShadowSize = "0px 1px 1px"
  ,boxShadowColor = "#F8F8F8"     
  ,boxTitleSize = 12                   
  ,boxDefaultColor = "#C6C6C6"        
  ,boxPrimaryColor = "#C6C6C6"    
  ,boxInfoColor = "#C6C6C6"         
  ,boxSuccessColor = "rgba(0,90,155,1)" 
  ,boxWarningColor = "rgb(250,120,60)"  
  ,boxDangerColor = "rgb(255,60,60)"   
  
  ,tabBoxTabColor = "rgb(255,255,255)" 
  ,tabBoxTabTextSize = 12           
  ,tabBoxTabTextColor = "rgb(0,0,0)"   
  ,tabBoxTabTextColorSelected = "rgb(0,0,0)"  
  ,tabBoxBackColor = "rgb(255,255,255)" 
  ,tabBoxHighlightColor = "#C6C6C6" 
  ,tabBoxBorderRadius = 5   
  
  ### Entrées
  ,buttonBackColor = "#F8F8F8"          
  ,buttonTextColor = "rgb(0,0,0)"      
  ,buttonBorderColor = "rgb(200,200,200)" 
  ,buttonBorderRadius = 5       
  
  ,buttonBackColorHover = "rgb(25,120,130)" 
  ,buttonTextColorHover = "#F8F8F8"     
  ,buttonBorderColorHover = "rgb(200,200,200)" 
  
  ,textboxBackColor = "rgb(255,255,255)"   
  ,textboxBorderColor = "rgb(200,200,200)"
  ,textboxBorderRadius = 5          
  ,textboxBackColorSelect = "rgb(25,100,130)"  
  ,textboxBorderColorSelect = "rgb(200,200,200)" 
  
  ### tables
  ,tableBackColor = "rgb(255,255,255)"     
  ,tableBorderColor = "rgb(240,240,240)" 
  ,tableBorderTopSize = 1       
  ,tableBorderRowSize = 1  
  
)


ui <- dashboardPage(skin="blue",
                    
                    dashboardHeader(title=shinyDashboardLogo(
                      theme = "blue_gradient",
                      boldText = "Analyse BD Diamonds"
                    ),
                    tags$li(a(href = 'https://github.com/JrRzf007/Analyse-Dataset-Diamonds---shiny/blob/main/lisez%20moi.pdf',
                              icon("fas fa-book-reader"),
                              title = "Guide"),
                            class = "dropdown"),
                    tags$li(a(href = 'https://github.com/JrRzf007/Analyse-Dataset-Diamonds---shiny',
                              tags$img(src = 'https://cdn.pixabay.com/photo/2021/09/11/12/17/github-6615451_960_720.png',
                                       title = "JuniorRzf", height = "40px",width="40px"),
                              style = "padding-top:10px; padding-bottom:10px;"),
                            class = "dropdown")),
                    
                    dashboardSidebar(
                      sidebarMenu(
                        menuItem("A propos", tabName = "about", icon = icon("book")),
                        menuItem("Aperçu", tabName = "pic", icon = icon("eye")),
                        menuItem("Dataset",tabName = "bd", icon = icon("table")),
                        menuItem("Predictions des prix", tabName = "md", icon = icon("check")),
                        menuItem("Clustering", tabName = "ct", icon = icon("code-branch"))
                      )
                    ),
                    
                    dashboardBody(
                      
                      customTheme,

                      tabItems(
                        tabItem(tabName = "pic",
                                fluidRow(
                                  column(width = 12,div(style = "height:3px"),
                                         tabsetPanel(
                                           tabPanel("Poids",
                                                    h4(p(HTML("</br>Le poids est exprimé en carats, 1 carat = 0.2 grammes. 
                                                              Les diamants de grande envergure sont de plus en plus rare ce qui font que leurs valeurs
                                                              soient plus élevées que ceux de petites tailles.</br>
                                                              </br>Mais pour estimer le prix d'un diamant il n'y a pas que sa taille qui compte ; cela est
                                                              mis en évidence dans cette base de données où les diamants même de petites tailles ont une
                                                              grande valeur. Ceci est dû à la rareté de la couleur ou d'autres caractéristiques.</br>"))),
                                                    div(
                                                      style = "text-align: center;",
                                                      h4(tags$b("Observation Carat")),
                                                      tags$img(src = "https://www.carat.ch/media/full/cache/C/A/CARAT_20_IMAGES_ARTICLES_DIAMANTS_CARAT.jpg",
                                                               height = 500, width = 800)
                                                    )
                                                    
                                           ),
                                           tabPanel("Couleur",
                                                    h4(p(HTML("</br>La couleur d'un diamant évolue du pur éclat de blanc (D) à un jaune éclat (Z).Dans notre
                                                    cas, la couleur varie de D à J ; D étant la meilleure couleur et J la pire ici.</br>"))),
                                                    div(
                                                      style = "text-align: center;",
                                                      h4(tags$b("Couleur")),
                                                      tags$img(src = "https://bijouterielanglois.com/pub/media/wysiwyg/Guide/Couleur_diamant/Couleurs_Diamants.jpg",
                                                               height = 300, width = 1000)
                                                    )
                                                    
                                           ),
                                           tabPanel("Clarté",
                                                    h4(p(HTML("</br>La clarté fait référence à la présence et à la visibilité des inclusions (imperfections internes)
                                                              et des défauts de surface dans un diamant.Un diamant avec une clarté plus élevée (IF, VVS, VS) aura 
                                                              généralement moins d'inclusions et sera considéré comme plus précieux. Les 
                                                              diamants avec des grades de clarté inférieurs (SI, I) peuvent présenter 
                                                              des inclusions visibles à l'œil nu, ce qui peut affecter leur éclat et leur beauté.</br>"))),
                                                    div(
                                                      style = "text-align: center;",
                                                      h4(tags$b("Pureté ou Clarté")),
                                                      tags$img(src = "https://bijouterielanglois.com/pub/media/wysiwyg/Guide/Clarte/Purete_Diamants.jpg",
                                                               height = 300, width = 1000)
                                                    )
                                                    
                                           ),
                                           tabPanel("Coupe",
                                                    h4(p(HTML("</br>La qualité de la coupe d'un diamant est un facteur essentiel qui influence son éclat, 
                                                    sa brillance et sa beauté globale. Une coupe bien réalisée permet à la lumière de se refléter et de se 
                                                              disperser de manière optimale à travers le diamant, ce qui lui confère un éclat éblouissant et
                                                              une apparence attrayante.</br>"))),
                                                    div(
                                                      style = "text-align: center;",
                                                      h4(tags$b("Coupe")),
                                                      tags$img(src = "https://www.vuillermoz.fr/uploads/cms/encyclopedie-des-pierres/diamond-cut.jpg",
                                                               height = 300, width = 1000)
                                                    )
                                                    
                                           ))))
                                ),
                        tabItem(tabName = "about",
                                
                                h2(strong("BD Diamonds "), align="center",style="color:#000000"),
                                h4(p(HTML("</br>La base de donnée 'Diamonds' disponible dans la librairie ggplot2
             de R contient 53940 lignes et 10 colonnes. Voici quelques informations sur chaque
             colonnes : </br>
             <ul>
               <li>Carat : le poids (0.2-5.01)</li>
               <li>Cut : la qualité de la coupe (Fair-Good-Very Good-Premium-Ideal)</li>
               <li>Color : la couleur (J-I-H-G-F-E-D)</li>
               <li>Clarity : la clarté (I1-SI2-SI1-VS2-VS1-VVS2-VVS1-IF)</li>
               <li>Depth : la profondeur (43-79)</li>
               <li>Table : la table (43-95)</li>
               <li>Price : le prix (326-18823$)</li>
               <li>x et y : la longueur (0-10.74 mm) et la largueur (0-58.9 mm)</li>
             </ul>
           ")), style = "font-family: 'Arial', serif;font-weight: 200; font-size: 200; margin-top: 100px;line-height: 1.5")
                        ),
                        tabItem(tabName = "bd",
                                fluidRow(
                                  column(width = 12,div(style = "height:3px"),
                                         tabsetPanel(
                                           tabPanel("BD Importée",
                                                    fileInput("file", "Import dataset diamonds"),
                                                    dataTableOutput("bd")
                                                    
                                           ),
                                           tabPanel("Catégorielle vs Prix",
                                                    column(width = 12, pickerInput("categorielle",
                                                                                  "Variables catégorielles",
                                                                                  choices = c(
                                                                                    "cut",
                                                                                    "color",
                                                                                    "clarity"
                                                                                  ),
                                                                                  selected = "cut"
                                                    ),
                                                    plotOutput("quali")
                                                    )),
                                           tabPanel("Valeurs aberrantes",
                                                    column(width = 12, pickerInput("val_aber",
                                                                                   "Choisissez une variable",
                                                                                   choices = c(
                                                                                     "carat",
                                                                                     "depth",
                                                                                     "table",
                                                                                     "price",
                                                                                     "x",
                                                                                     "y",
                                                                                     "z"
                                                                                   ),
                                                                                   selected = "price"
                                                    ),
                                                    plotOutput("aberr")
                                                    )),
                                           tabPanel("Distribution",
                                                    column(width = 12, pickerInput("val_dist",
                                                                                   "Choisissez une variable",
                                                                                   choices = c(
                                                                                     "carat",
                                                                                     "depth",
                                                                                     "table",
                                                                                     "price",
                                                                                     "x",
                                                                                     "y",
                                                                                     "z"
                                                                                   ),
                                                                                   selected = "price"
                                                    ),
                                                    plotOutput("dist")
                                                    )),
                                           tabPanel("Matrice de correlation",
                                                    column(width = 12, selectizeInput("num",
                                                                                   "Variables numériques",
                                                                                   choices = c(
                                                                                     "carat",
                                                                                     "depth",
                                                                                     "table",
                                                                                     "price",
                                                                                     "x",
                                                                                     "y",
                                                                                     "z"
                                                                                   ),
                                                                                   selected = "carat",
                                                                                   multiple = TRUE
                                                    ),
                                                    plotOutput("quanti")
                                                    )))))
                                ),
                        tabItem(tabName = "md",
                                fluidRow(
                                  column(width = 12,div(style = "height:3px"),
                                         tabsetPanel(
                                           tabPanel("Régression Linéaire",
                                                    column(width = 12,
                                                           verbatimTextOutput("r2"),
                                                           plotOutput("rl")
                                                    )),
                                           tabPanel("XGBoost",
                                                    column(width = 12,
                                                           verbatimTextOutput("rq"),
                                                           plotOutput("xg"))
                                                    ),
                                           tabPanel("Random Forest",
                                                    column(width=12,
                                                           verbatimTextOutput("rt"),
                                                          plotOutput("rf"))
                                                    ),
                                           tabPanel("Telecharger les prédictions",
                                                    column(width = 2,
                                                           pickerInput("tpred",
                                                                       "Méthodes utilisées",
                                                                       choices = c("Régression Linéaire",
                                                                                   "XGBoost",
                                                                                   "Random Forest"),selected = "XGBoost"),
                                                           downloadButton("méth", "Réels vs Prédictions")
                                                    ),
                                                    column(width = 10, dataTableOutput("dh"))
                                                           )
                                           
                                         )))
                                ),
                        tabItem(tabName = "ct",
                                fluidRow(
                                  column(width = 12,div(style = "height:3px"),
                                         tabsetPanel(
                                           tabPanel("Réduction dimension (ACP)",
                                                    column(width = 12,
                                                           plotOutput("ca")),
                                                    column(width = 12,
                                                           plotOutput("crt")),
                                                    column(width = 12,
                                                           plotOutput("ctb"))
                                           ),
                                           tabPanel("KMeans",
                                                    column(width = 12,
                                                           plotOutput("km")
                                                    )),
                                           
                                           tabPanel("Resultats",
                                                    column(width = 12, tableOutput("cf"))
                                           )
                                           
                                         )))
                        )
                        
                        
     )
  )                    
)
