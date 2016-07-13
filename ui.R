
# By Alexander Sickert, July 2016

library(shiny)

# Define UI for the application
shinyUI(fluidPage(
  
  # Application title
  titlePanel("MTCARS DATASET ANALYZER"),
  
  # Sidebar with a dropdown input for chosing a vairable of mtcars
  sidebarLayout(
    sidebarPanel(
      
      helpText("You can chose a parameter from the mtcars dataset and compare it with miles per gallon."),
      
       
       selectInput("parameter", label = h3("choose parameter"), 
                   choices = list("cyl" = "cyl",  "disp" = "disp", "hp" = "hp",    "drat" =  "drat",  "wt" = "wt",    "qsec" = "qsec",  "vs" = "vs",   "am" = "am",   "gear" = "gear"),
                   
                   selected = 1)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       # draw the plot
       plotOutput("distPlot"),
       # add the info about which parameter was selected
       textOutput("text1"),
       # show coefficients of linear model
       textOutput("text2")
    )
  )
))
