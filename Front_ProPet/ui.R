#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(
  fluidPage(
    
    fluidRow(
      column(3,
             fluidRow(imageOutput("image1", height = 400)),
             fluidRow(imageOutput("image5",  height = 400))
             ),
      column(3,
             fluidRow(imageOutput("image2", height = 400)),
             fluidRow(imageOutput("image6", height = 400))
             ),
      column(3,
             fluidRow(imageOutput("image3", height = 400)),
             fluidRow(imageOutput("image7", height = 400))
             ),
      column(3,
             fluidRow(imageOutput("image4", height = 400)),
             fluidRow(imageOutput("image8", height = 400))
             )
    )
    
  )
)








