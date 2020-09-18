library(datasets)
library(shiny)

shinyUI(fluidPage(
  titlePanel("Tooth Length of Guinea Pigs"),
  sidebarLayout(
    sidebarPanel(
      selectInput("Supp", "Select supplement type:",
                  choices = c("VC", "OJ")),
      selectInput("Dose", "Select dosage amount:",
                  choices = c(0.5, 1.0, 2.0))
    ),mainPanel(
    tabsetPanel(type = "tabs",
                tabPanel("Summary", verbatimTextOutput("modelSummary")),
                tabPanel("Plot 1", plotOutput("modelPlot1")),
                tabPanel("Plot 2", plotOutput("modelPlot2")),
                tabPanel("Predict", 
                         h4("Prediction of Tooth Length Based on Supplement Type and Dosage Amount"), 
                         textOutput("modelPred")))
  )
  )
))