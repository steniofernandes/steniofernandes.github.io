---
title       : First Shiny App - HistApp
subtitle    : Coursera Course - Developing Data Products
author      : Stenio Fernandes, Professor
job         : CIn/UFPE
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [bootstrap, quiz, shiny, interactive]            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## About the Shiny App - HistApp

This very simple app does the following:

1. It randomly generates 5000 samples from a Normal Distribution
2. The paremeters of the distribution are unknown to the user
3. It plots a Histogram from the Sample Data
4. It plots requests the input of the user to find the best curve that fits the Histogram
5. It reacts to user input by drawing the density lines over the histogram

--- .class #id 

## HistApp (Cont.)

Details of the Implementation

1. Input parameters at UI are: mean, sd, and number of bins for the histogram
2.  Basically, the user will try to guess the correct parameters that generate the histogram
3. User will adjust the input values as the density lines are redrawn on top of the histogram plot
4. The code fixes the number of random samples to 5000
5. The mean parameter for the Normal distribution is between -10 and 10
6. The standard deviation parameter for the Normal distribution is between 0.5 and 5
7. User's choice will be limited within the above range

--- .class #id 

## ui.R code

1. Simple ui.R code


```r
library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Guess the parameters for a Normal PDF for best fit"), 
  sidebarPanel(
    sliderInput('nbreaks', 'Number of Breaks in the Histogram', 10, min = 10, max = 100, step = 10),
    numericInput('meanvalue', 'Sample Mean', 0, min = -10, max = 10, step = 0.5),
    numericInput('sdvalue', 'Sample Standard Deviation', 1, min = 0.5, max = 5, step = 0.5)
              ),
  mainPanel(
    h3('Plot'),
    plotOutput('newHist')
  )
))
```

<!--html_preserve--><div class="container-fluid">
<div class="row">
<div class="col-sm-12">
<h1>Guess the parameters for a Normal PDF for best fit</h1>
</div>
</div>
<div class="row">
<div class="col-sm-4">
<form class="well">
<div class="form-group shiny-input-container">
<label class="control-label" for="nbreaks">Number of Breaks in the Histogram</label>
<input class="js-range-slider" id="nbreaks" data-min="10" data-max="100" data-from="10" data-step="10" data-grid="true" data-grid-num="9" data-grid-snap="false" data-prettify-separator="," data-keyboard="true" data-keyboard-step="11.1111111111111" data-drag-interval="true" data-data-type="number"/>
</div>
<div class="form-group shiny-input-container">
<label for="meanvalue">Sample Mean</label>
<input id="meanvalue" type="number" class="form-control" value="0" min="-10" max="10" step="0.5"/>
</div>
<div class="form-group shiny-input-container">
<label for="sdvalue">Sample Standard Deviation</label>
<input id="sdvalue" type="number" class="form-control" value="1" min="0.5" max="5" step="0.5"/>
</div>
</form>
</div>
<div class="col-sm-8">
<h3>Plot</h3>
<div id="newHist" class="shiny-plot-output" style="width: 100% ; height: 400px"></div>
</div>
</div>
</div><!--/html_preserve-->

--- .class #id 

## server.R code
1. Simple server.R code

```r
 x <- rnorm(5000, mean = runif(1, -10, 10), sd = runif(1, 0.5, 5))
 library(shiny)
 shinyServer(
  function(input, output) {
    output$newHist <- renderPlot(
      {
        # Generate a Random Normal PDF with the input parameters from UI 
        x2 <- rnorm(5000, mean = input$meanvalue, sd = input$sdvalue)
        hist(x, breaks = input$nbreaks, xlab='Random Sample- Normal PDF', col='lightblue', 
             main='Histogram', probability = TRUE)
        lines(density(x2), lty="dotted", col="red", lwd=2)
              } #end code inside renderplot
  ) #end cal to renderplot
  } # server function call
) #end shinyserver
```

--- .class #id 

## ShinyApps.io deployment

1. Anyone can run the app at: 
https://steniofernandes.shinyapps.io/DDP_HistApp/

--- .class #id 
