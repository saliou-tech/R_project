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
        dateInput("date3", "Date:", value = "202°-03-01", format = "mm/dd/yy"),
        
        # Custom CSS to hide the default logout panel
        tags$head(tags$style(HTML('.shiny-server-account { display: none; }'),    tags$hr(),
                             
)),
        
        # The dynamically-generated user panel
        uiOutput("userpanel")
    ),
    dashboardBody(
        tabItems(
            tabItem(tabName = "dashboard",
                    h2("Dashboard tab content")
            ),
            
            tabItem(tabName = "widgets",
                    h2("Widgets tab content")
            )
        ),
        tags$br(),
        
       
        fluidRow(
            # A static infoBox
            infoBox("New Orders", 10 * 2, icon = icon("credit-card")),
            # Dynamic infoBoxes
            infoBoxOutput("progressBox"),
            infoBoxOutput("approvalBox")
        ),
        
        # infoBoxes with fill=TRUE
        fluidRow(
            infoBox("New Orders", 10 * 2, icon = icon("credit-card"), fill = TRUE),
            infoBoxOutput("progressBox2"),
            infoBoxOutput("approvalBox2")
        ),
        
        fluidRow(
            # Clicking this will increment the progress amount
            box(width = 4, actionButton("count", "Increment progress"))
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
