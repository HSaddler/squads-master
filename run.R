library(shiny)
port <- Sys.getenv('PORT')
shiny::runApp(
  appDir = "C:/Users/henri/Downloads/squads-master/",
  host = '0.0.0.0',
  port = as.numeric(port)
)
