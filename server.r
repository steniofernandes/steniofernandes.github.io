# Coursera - DDP - Stenio Fernandes
# Feb 2016 - 13:12
x <- rnorm(5000, mean = runif(1, -10, 10), sd = runif(1, 0.5, 5))
library(shiny)
shinyServer(
  function(input, output) {
    output$newHist <- renderPlot(
      {
        # Generate a Random Normal PDF with the input parameters from UI 
        x2 <- rnorm(5000, mean = input$meanvalue, sd = input$sdvalue)
        hist(x, breaks = 100, xlab='Random Sample- Normal PDF', col='lightblue',main='Histogram', probability = TRUE)
        lines(density(x2), lty="dotted", col="red", lwd=2)
              } #end code inside renderplot
  ) #end cal to renderplot
  } # server function call
) #end shinyserver