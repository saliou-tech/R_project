#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$distPlot <- renderPlot({

        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white')

    })
    output$graphique1 <- renderPlot({plot(1:50)})
    output$graphique2 <- renderPlot({plot(50:1)})
    output$progressBox <- renderInfoBox({
        infoBox(
            "Progress", paste0(25 + input$count, "%"), icon = icon("list"),
            color = "purple"
        )
    })
    output$approvalBox <- renderInfoBox({
        infoBox(
            "Approval", "80%", icon = icon("thumbs-up", lib = "glyphicon"),
            color = "yellow"
        )
    })
    
    # Same as above, but with fill=TRUE
    output$progressBox2 <- renderInfoBox({
        infoBox(
            "Progress", paste0(25 + input$count, "%"), icon = icon("list"),
            color = "purple", fill = TRUE
        )
    })
    output$approvalBox2 <- renderInfoBox({
        infoBox(
            "Approval", "80%", icon = icon("thumbs-up", lib = "glyphicon"),
            color = "yellow", fill = TRUE
        )
    })
  


})
