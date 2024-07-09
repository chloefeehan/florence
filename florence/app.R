
# Load in libraries
library(shiny)
library(tidyverse)
library(here)
library(readxl)
library(leaflet)

# Load in Data

florence <- read_excel(here("data", "florence_data.xlsx"))


server <- function(input, output, session) {
  output$mymap <- renderLeaflet({
    leaflet() |>
      addTiles() |>
      setView(lng = 11.2558, lat = 43.7696, zoom = 15)
  })
}

ui <- fluidPage(
  titlePanel("Florence"),
  sidebarLayout(
    sidebarPanel(
      # Add any UI elements you need here
    ),
    mainPanel(
      leafletOutput("mymap")
    )
  )
)

shinyApp(ui, server)
    
