library(shiny)
library(rCharts)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  # Expression that generates a histogram. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should be automatically
  #     re-executed when inputs change
  #  2) Its output type is a plot
  #  3) liner regression to predict rating
  
  output$mytable1 = renderDataTable({
    colName <- NULL
    if (input$cRating == 1) colName <- "rating"
    if (input$cComplaint == 1) colName <- c(colName, "complaints")
    if (input$cPrivilges == 1) colName <- c(colName, "privileges")
    if (input$cLearning == 1) colName <- c(colName, "learning")
    if (input$cRaises == 1) colName <- c(colName, "raises")
    if (input$cCritical == 1) colName <- c(colName, "critical")
    if (input$cAdvance == 1) colName <- c(colName, "advance")
    
    df <- attitude[which(attitude$rating <= input$rating[2] &  attitude$rating >= input$rating[1]), ]
    df[colName]
  })
  
  output$distPlot <- renderChart2({
    dt <- attitude[which(attitude$rating <= input$rating[2] &  attitude$rating >= input$rating[1]), ]
    p1 <- nPlot(rating ~ complaints, data = dt, type = 'scatterChart')
    
    p1$xAxis(axisLabel = 'Complaints')
    p1$yAxis(axisLabel = 'Rating')
    p1$chart(tooltipContent = "#! function(key, x, y){return 'Complaints: ' + x + '  Rating: ' + y  } !#")
    p1
  })
})