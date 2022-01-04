library(shiny)

shinyServer(
  function(input, output) {
    output$footballerpath <- renderPrint({
      (shortest_paths(g, from = input$Player1, to = input$Player2, output = "vpath")$vpath)
      
    })
    
  }
)