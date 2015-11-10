library(shiny)
library(rCharts)
require(markdown)

# Define UI for application that draws a histogram
shinyUI(
  
  navbarPage("Employee attitude survey", 
             # multi-page user-interface that includes a navigation bar.
             tabPanel("Explore the Data",
                      sidebarPanel(
                        sliderInput("rating",
                                    "Employee rating:",
                                    min = 1,
                                    max = 100,
                                    value = c(10,50))
                      ),
                      # Show a plot of the generated distribution  
                      # mytable1: dataset 
                      # distPlot: scatter chart 
                      mainPanel(
                        tabsetPanel(
                          tabPanel(p(icon("table"), "Dataset"),
                                   dataTableOutput("mytable1")),
                          tabPanel(p(icon("search"), "Visualize the Data"),
                                   showOutput("distPlot","nvd3"))
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