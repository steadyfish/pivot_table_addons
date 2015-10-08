# app.R
library(shiny)
library(rpivotTable)

d_in = data.frame(grp_var1 = rep(letters[1:5], times = 6),
                  grp_var2 = rep(letters[6:8], times = 10),
                  grp_var3 = rep(letters[9:10], times = 15),
                  metric1 = sample.int(n = 100, size = 30),
                  metric2 = sample.int(n = 100, size = 30),
                  metric3 = sample.int(n = 100, size = 30))

server = function(input, output) {
  output$test <- rpivotTable::renderRpivotTable({
    rpivotTable(data = d_in, 
                rows = "grp_var1", 
                cols = "grp_var2", 
                val = "metric1",
                aggregatorName = "Sum",
                rendererName = "Table")
  })
}
 
ui =  fluidPage(
  rpivotTableOutput("test")
) 


shinyApp(ui = ui, server = server, options = list(height = '3000px', width = '100%'))
