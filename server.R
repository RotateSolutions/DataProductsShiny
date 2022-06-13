library(shiny)
shinyServer(function(input, output) {
  output$plot2 <- renderPlot({
   sliderZ <- input$sliderZ[1]
   mean <- 0
   sd <- 1
   x <- seq(-3.50,3.50,length=1000)*sd + mean
   y <- dnorm(x)
   plot(x, y, type="l", xlab="Z", ylab="density")
   polygon(c(x[x>=sliderZ], max(x), sliderZ), c(y[x>=sliderZ], 0, 0), col=rgb(0.9,0,0))
   polygon(c(x[x<=sliderZ], sliderZ, min(x)), c(y[x<=sliderZ], 0, 0), col=rgb(0,0.7,0))
  })
  output$plot3 <- renderPlot({
          sliderZ <- input$sliderZ[1]
          calculatedZ <- qnorm(input$sliderF[1])
          mean <- 0
          sd <- 1
          x <- seq(-3.50,3.50,length=1000)*sd + mean
          y <- dnorm(x)
          plot(x, y, type="l", xlab="Z", ylab="density")
          polygon(c(x[x>=calculatedZ], max(x), calculatedZ), c(y[x>=calculatedZ], 0, 0), col=rgb(0.9,0,0))
          polygon(c(x[x<=calculatedZ], calculatedZ, min(x)), c(y[x<=calculatedZ], 0, 0), col=rgb(0,0.7,0))
  })
  output$textF <- renderText(pnorm(input$sliderZ[1],0,1))
  output$textZ <- renderText(qnorm(input$sliderF[1],0,1))
 })