# Coursera - DDP - Stenio Fernandes
# Feb 2016 - 13:12

library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Best fit for a Normal Distribution"),
  sidebarPanel(
    numericInput('meanvalue', 'Sample Mean', 0, min = -10, max = 10, step = 0.5),
    numericInput('sdvalue', 'Sample Standard Deviation', 1, min = 0.5, max = 5, step = 0.5)
              ),
  mainPanel(
    h3("This is a histogram of 5000 random samples from a Normal Distribution"),
    h4("Your task is to guess its mean and standard deviation"),
    h4("As you change the input parameters:"),
    h5("1. The density will be recalculated"),
    h5("2. New line curve will appear in the panel"),
    h4("When you feel that you reached the best fit, you have the approximated mean and sd"),
    plotOutput('newHist')
  )
))