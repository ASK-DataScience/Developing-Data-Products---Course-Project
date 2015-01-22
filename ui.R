library (shiny)
shinyUI(pageWithSidebar(
        headerPanel("Predicting MPG for different cars"),
        sidebarPanel(
                radioButtons("id1","Transmission",
                                   c("Automatic" = "0",
                                     "Manual" = "1")),
                selectInput("id2", "Number of cylinders",
                            c("4" = "4",
                              "6" = "6",
                              "8" = "8")),
                numericInput('id3','Gross Horsepower', 
                             value = 120, 
                             min = 40, 
                             max = 350, 
                             step = 5),
                numericInput('id4','Weight (lb/1000)', 
                             value = 3.325, 
                             min = 1.5, 
                             max = 6, 
                             step = 0.25),
                submitButton(text = "Submit", icon = NULL)
        ),
        mainPanel(
                p('Here, we are trying to predict the MPG (Miles/(US) gallon) for differenct cars 
                using transmission type, number of cylinders, gross horsepower 
                  and weight.'),
                p('Please choose these values from the side panel then hit 
                  the "Submit" button to get a prediction for the MPG value.'),
                h3('You entered:'),
                h4('Transmission is'),
                verbatimTextOutput("oid1"),
                p('Note that 0 = automatic, 1 = manual'),
                h4('Number of cylinders is'),
                verbatimTextOutput("oid2"),
                h4('Gross Horsepower is'),
                verbatimTextOutput("oid3"),
                h4('Weight (lb/1000) is'),
                verbatimTextOutput("oid4"),
                h4('Which resulted in a prediction for MPG of'),
                verbatimTextOutput("prediction"),
                p('        '),
                p('Notes:'),
                p('- mtcars data set was used in this analysis.'),
                p('- Linear regression model was used. The model includes the 
                  relationship between mpg (outcome) and transmission type, 
                  number of cylinders, gross horsepower. and weight (regressors).')
        )
))