
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({
    
    # generate bins based on input$bins from ui.R
    x    <- faithful[, 2] 
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'white')
    
  })
  
})

library(shiny)
library(rpivotTable)

data <- data.frame(var1 = c("mod1", "mod2"), value = c(1, 2))
d_in = readRDS("../shiny_apps/1d_trends/data/app_data.rds")
shinyApp(
  ui =  fluidPage(
    rpivotTableOutput("test")
  ), 
  
  server = function(input, output) {
    output$test <- rpivotTable::renderRpivotTable({
      rpivotTable(data = d_in[[1]])
    })
    
  }
)