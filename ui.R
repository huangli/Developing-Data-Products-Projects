llibrary(shiny)
require(markdown)
library(rCharts)

shinyUI(
  
  navbarPage("Employee attitude survey", 
             # multi-page user-interface that includes a navigation bar.
             tabPanel("Explore the Data",
                      sidebarPanel(
                        sliderInput("rating",
                                    "Employee rating filter:",
                                    min = 1,
                                    max = 100,
                                    value = c(10,50)),
                        h4("Column Filter"),
                        checkboxInput("cRating", "Rating", value = TRUE, width = 100),
                        checkboxInput("cComplaint", "Complaints", value = TRUE, width = 100),
                        checkboxInput("cPrivilges", "Privilges", value = TRUE, width = 100),
                        checkboxInput("cLearning", "Learning", value = TRUE, width = 100),
                        checkboxInput("cRaises", "Raises", value = TRUE, width = 100),
                        checkboxInput("cCritical", "Critical", value = TRUE, width = 100),
                        checkboxInput("cAdvance", "Advance", value = TRUE, width = 100)
                      ),
                      # mytable1: dataset 
                      # distPlot: line chart 
                      mainPanel(
                        tabsetPanel(
                          tabPanel(p(icon("table"), "Dataset"),
                                   dataTableOutput("mytable1")),
                          tabPanel(p(icon("search"), "Visualize the Data"),
                                   showOutput("distPlot","xcharts"))
                        ) 
                      )
             ),
             tabPanel("About",
                      mainPanel(
                        includeMarkdown("about.md")
                      )
             ) # end of "About" tab panel
  )
)
