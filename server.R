library(shiny)
library(datasets)
library(tidyverse)
library(plotly)

# Load data
data("ToothGrowth")
ToothGrowth$dose <- as.factor(ToothGrowth$dose)

shinyServer(function(input, output){
  model <- lm(len ~ ., data = ToothGrowth)
  
  output$modelSummary <- renderPrint({
    summary(model)
  })
  
  output$modelPred <- renderText({
    suppInput <- input$Supp
    doseInput <- input$Dose
    predict(model, newdata = data.frame(supp = suppInput,
                                        dose = doseInput))
  })
  
  output$modelPlot1 <- renderPlot({
    ggplot(ToothGrowth, aes(x = supp, y = len, fill = supp)) +
      geom_boxplot() +
      labs(x = "Supplement Type", y = "Tooth Length",
           title = "Tooth Length vs Supplement Type",
           fill = "Supp.Type")
  })
  
  output$modelPlot2 <- renderPlot({
    ggplot(ToothGrowth, aes(x = dose, y = len, fill = dose)) +
      geom_boxplot() +
      labs(x = "Dosage", y = "Tooth Length",
           title = "Tooth Length vs Dosage",
           fill = "Dosage")
  })
})