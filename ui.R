library(shiny)
shinyUI(fluidPage(
  titlePanel("cumulative probability F of Standard Normal random variable Z"),
  sidebarLayout(
    sidebarPanel(
            radioButtons("direction", "type of calculation:",
                         c("Calculate F from z!" = "forward",
                           "Calculate z from F!" = "back"
                         )),
            textOutput("inputType")
    ),
    mainPanel(
            conditionalPanel(
                    sliderInput("sliderZ", "value of Standard Normal random variable Z:",
                                -3.5, 3.5, value = 0),
                    condition = "input.direction == 'forward'",
                    plotOutput("plot2"),
                    h3("cumulative probability F:"),
                    h2(textOutput("textF"))
            ),
            conditionalPanel(
                    sliderInput("sliderF", "cumulative probability F:",
                                0,1, value = 0.5),
                    condition = "input.direction == 'back'",
                    plotOutput("plot3"),
                    h3(paste("value z of Standard Normal random variable Z:"),
                    h2(textOutput("textZ"))
        )    ),
    )
    )
))