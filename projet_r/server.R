#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(readxl)
library(readr)
library(tidyverse)

data_covid=read_excel("BaseCovidSN.xlsx")

data_covid

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
    
    
    # Same as above, but with fill=TRUE
  
   
    
  output$dt_covid<- renderDataTable({
    #data_covid=copy_to(data_covid)
   head(data_covid) 
    
  })
  
  output$valuebox_total_cases <- renderValueBox({

    valueBox(
      format(sum(data_covid$`Cas positifs`), nsmall=1, big.mark=","),
      "Total confirmed cases",
      icon = icon("ambulance"),
      color = "orange"
    )

  })
  
  output$valuebox_total_deaths <- renderValueBox({
    
    valueBox(
      format(sum(data_covid$Deces), nsmall=1, big.mark=","),
      "Total confirmed deaths",
      icon = icon("skull"),
      color = "red"
    )
    
  })
  output$valuebox_death_rate <- renderValueBox({
    
    valueBox(
      paste0(round(sum(data_covid$Deces)/sum(data_covid$`Cas positifs`), digits = 4)*100, "%"),
      "Death rate",
      icon = icon("exclamation-triangle"),
      color = "maroon"
    )
    
  })
  
  output$valuebox_total_active <- renderValueBox({
    cas_en_traitemment=sum(data_covid$`Cas positifs`)-(sum(data_covid$Deces)+sum(data_covid$`Cas gueris`))
    
    valueBox(
      format(cas_en_traitemment, nsmall=1, big.mark=","),
      "Total confirmed active cases",
      icon = icon("hospital-alt"),
      color = "yellow"
    )
    
  })
  
  
  output$valuebox_total_recov <- renderValueBox({

    valueBox(
      format(sum(data_covid$`Cas gueris`), nsmall=1, big.mark=","),
      "Total confirmed recovered cases",
      icon = icon("star-of-life"),
      color = "green"
    )
  })
  
  output$valuebox_num_tests_pop <- renderValueBox({
    valueBox(
      format(sum(data_covid$`Cas testes`), nsmall=1, big.mark=","),
      "Number of tests per  million population",
      icon = icon("vials"),
      color = "olive"
    )
  })
  output$valuebox_positivetests_rate <- renderValueBox({
    
    valueBox(
      paste0((sum(data_covid$`Cas positifs`)/sum(data_covid$`Cas testes`))*100,2,"%"),
      
      "Positive tests rate",
      icon = icon("vial"),
      color = "maroon"
    )
    
  })
  output$value <- renderPrint({ input$dates })
  
  
  


})
