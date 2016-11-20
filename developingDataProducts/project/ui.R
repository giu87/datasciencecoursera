library(shiny)

shinyUI(fluidPage(

  titlePanel("Father - mother heights"),

  sidebarLayout(
    sidebarPanel(
      sliderInput("father",
                  "Father height:",
                  min = 140,
                  max = 200,
                  value = 170),
      sliderInput("mother",
                  "Mother height:",
                  min = 140,
                  max = 200,
                  value = 160)
    ),
  
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("heightPlot")
    )
  )
))
