
# By Alexander Sickert, July 2016
# see https://alexandersickert.shinyapps.io/CourseraDataProductsApp/



library(shiny)


# Define server logic required to draw a scatterplot

shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({
    
    # use the mtcars dataset
    data(mtcars)
    # chose the column we want from this dataset
    x <- mtcars[,input$parameter]
    # plot the graph
    plot(x,mtcars$mpg , xlab=input$parameter, ylab="Miles per gallon")
    
  })
  
  output$text1 <- renderText({ 
    
    # show which parameter was selected
    paste("You have selected parameter: ", input$parameter, sep=" ")
    
    
  })
  
  output$text2 <- renderText({ 
    
    x <- mtcars[,input$parameter]
    lm <- lm(mtcars$mpg ~ x)
    intercept <- lm$coefficients[1]
    coefficient <- lm$coefficients[2]
    
    text <-c("linear model intercept: ", intercept, "linear model coefficient: ", coefficient)
  
    paste(text,  collapse=" ")
  
  })
  
})
