#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)
library(DT)
library(shinycssloaders)

# Define UI for application that draws a histogram




dbHeader <- dashboardHeader(title="Senegal covid19 cases evolution")



dbHeader$children[[2]]$children <-  tags$a(
                                           tags$img(src='logo.png',height='40',width='190'),
                                           tags$hr())




ui <- dashboardPage(skin='blue',
    
    dbHeader,
    dashboardSidebar(
        tags$br(),
        tags$br(),
        sidebarMenu(
            menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
            menuItem("Widgets", icon = icon("th"), tabName = "widgets",
                     badgeLabel = "new", badgeColor = "green")
        ),
    
        #tags$h3("veuilllez choisir la periode d'etude"),
        dateRangeInput("dates", label = h4("veuillez choisir l'interalle de temps d'etude")),
        
        tags$hr(),
        fluidRow(column(12, verbatimTextOutput("value"))) ,       
        # Custom CSS to hide the default logout panel
        tags$head(tags$style(HTML('.shiny-server-account { display: none; }'),    tags$hr(),
                             
)),
        
        # The dynamically-generated user panel
        uiOutput("userpanel")
    ),
    dashboardBody(
     tabItems(
         tabItem(tabName = "dashboard",
                  
            ),
            
            tabItem(tabName = "widgets",
                   
            )
        ),
       
        fluidRow(
            column(width = 12,
                   
                   box(title = span(icon("table"), " Donness covid19 du ministere de la sante du senegal"),
                       footer = "jeu de donnees provenant du ministere de la sante indiquant les nombres de cas positifs,contacts communautaires ,déces liés au coronavirus .",
                       status = "info",
                       solidHeader = F,
                       collapsible = TRUE, width = 12, collapsed = F,
                       
                       DTOutput("dt_covid")
                   ),
                   tags$br(),
                   fluidRow(
                       box(title = span(icon("table"), " Statistics"),
                           solidHeader = F, status = "warning",
                           collapsible = TRUE, width = 12,
                         valueBoxOutput("valuebox_total_cases") %>% withSpinner(color = "#5bc0de"),
                           valueBoxOutput("valuebox_total_deaths") %>% withSpinner(color = "#5bc0de"),
                          valueBoxOutput("valuebox_death_rate") %>% withSpinner(color = "#5bc0de"),
                           valueBoxOutput("valuebox_total_active") %>% withSpinner(color = "#5bc0de"),
                           valueBoxOutput("valuebox_total_recov") %>% withSpinner(color = "#5bc0de"),
                          valueBoxOutput("valuebox_positivetests_rate") %>% withSpinner(color = "#5bc0de"),
                          valueBoxOutput("valuebox_num_tests_pop") %>% withSpinner(color = "#5bc0de")
                         # valueBoxOutput("valuebox_active_per_mil") %>% withSpinner(color = "#5bc0de"),
                         
                       )
                   ),
                   
                   
                   
                   
                   
                   )
        ),
       
       
        tags$br(),
        fluidRow(    column(width = 6, plotOutput(outputId = "graphique1"), 
        ),   
        column(width = 6, plotOutput(outputId = "graphique2"), ) 
        ),
        
        tags$head(
            tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
        ),
        fluidRow(  
                 column(width = 6, "espace pour le premier courbe"),
              
                 column(width = 6, "espace pour le deuxieme courbe")           ),
        tags$hr(),
        tags$hr(),
       
        
))
