llibrary(shiny)
library(rCharts)
require(markdown)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
 
   
  #  1) It is "reactive" and therefore should be automatically
  #     re-executed when inputs change
  #  2) Its output type is a plot
  
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
    colName <- NULL
    if (input$cRating == 1) colName <- "rating"
    if (input$cComplaint == 1) colName <- c(colName, "complaints")
    if (input$cPrivilges == 1) colName <- c(colName, "privileges")
    if (input$cLearning == 1) colName <- c(colName, "learning")
    if (input$cRaises == 1) colName <- c(colName, "raises")
    if (input$cCritical == 1) colName <- c(colName, "critical")
    if (input$cAdvance == 1) colName <- c(colName, "advance")
    df <- attitude[which(attitude$rating <= input$rating[2] &  attitude$rating >= input$rating[1]), ]
    df <- df[colName]
    
    d1 <- as.matrix(df)  #add id column
    d1 <- melt(d1)
    names(d1)[1:2] <- c("id", "type")
    x1 <- xPlot(value ~ type, group = "id", data = d1, type = "line-dotted")
    x1
   })
})