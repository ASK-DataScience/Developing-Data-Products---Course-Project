# Loading Data and applying model
data(mtcars)
mtcars$am <- factor(mtcars$am)
modelFit <- lm(mpg ~ am+cyl+hp+wt, mtcars)
test <- mtcars[1,c(2,4,6,9)]

# Prediction Function
MPGPrediction <- function(id1, id2, id3, id4) {
        test$am <- id1
        test$cyl <- as.numeric(id2)
        test$hp <- as.numeric(id3)
        test$wt <- as.numeric(id4)
        p <- predict(modelFit, newdata = test)
        as.numeric(p)
}

library(shiny)
shinyServer(
        function(input,output){
                output$oid1 <- renderPrint({input$id1})
                output$oid2 <- renderPrint({input$id2})
                output$oid3 <- renderPrint({input$id3})
                output$oid4 <- renderPrint({input$id4})
                output$prediction <- renderPrint({MPGPrediction(input$id1,
                                                                input$id2,
                                                                input$id3,
                                                                input$id4)})
        }
)

