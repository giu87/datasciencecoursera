library(shiny)

shinyUI(fluidPage(

  titlePanel("Father - mother heights"),

  sidebarLayout(
    sidebarPanel(
      sliderInput("father",
                  "Father height:",
                  min = 50,
                  max = 80,
                  value = 60),
      sliderInput("mother",
                  "Mother height:",
                  min = 50,
                  max = 80,
                  value = 55)
    ),
  
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("heightPlot")
    )
  )
))
