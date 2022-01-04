# Load the shiny package
library(shiny)
# Define UI for the shiny application here
shinyUI(fluidPage(
  # fluid pages scale their components in realtime to fill all available browser width.
  # Header Panel : Create a header panel containing an application title.
  headerPanel(title = "Football Connect"),
  # SidebarLayout():It creates a layout with a sidebar and main area. 
  sidebarLayout(
    # Sidebar panel
    sidebarPanel(
      h4("Enter the names of the players"),
      
      textInput("Player1", "Enter the name of Player 1", "Lionel Messi"),
      textInput("Player2", "Enter the name of Player 2", "Cristiano Ronaldo")
      
    ),
    # Main Panel
    mainPanel(
      h4("Result"),
      
      verbatimTextOutput("footballerpath")
      
      
      
      
    )
  )
)
)


rsconnect::setAccountInfo(name='playerconnections',
                          token='C5F9F93EAD9F653EBAAFCDF246BD013B',
                          secret='rgAne76XPZ7qcpTss3EOiomGVqX4gnPs61mhhf73')

rsconnect::deployApp()Y