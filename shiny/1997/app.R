#install.packages("stringr")
#install.packages("dplyr")
#install.packages('tidyverse')
#install.packages("shiny")
options(shiny.sanitize.errors = F) ## Error 내용 확인가능

library(shiny)
library(ggplot2)
library(dplyr)
#library(tqk)
#library(tidyverse) # 8개의 package가 있음
#library(httr)
#library(rvest)
#library(jsonlite)
#library(stringr)

library(showtext)
font_add_google(name = "Nanum Gothic")
showtext_auto()
showtext_opts(dpi = 100)

data <- readRDS(file = 'long_1128_1.RDS')#데이터 파일 불러오기
company<-'LG화학'
# Define UI for application that draws a histogram
ui <- fluidPage(

  # Application title
  titlePanel("company salse analysis"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      textInput("text", label = h3("회사명을 정확하게 입력하세요"), value = "EX)삼성전자"),

      hr(),

      submitButton('submit')
    ),

    # Show a plot of the generated distribution
    mainPanel(
      uiOutput("tb")
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  output$value <- renderPrint({ input$text })
  output$barplot <- reactivePlot(function(){

    company <-input$text

    p <- data %>%
      filter(회사 == company) %>%
      ggplot(aes(x = year, y = sales , fill = year)) +
      geom_col() +
      ggtitle("[실적]")+
      theme_bw()
    print(p)
  })

  output$tb <- renderUI({

    tabsetPanel(tabPanel("barplot",plotOutput("barplot")))

  })
}

# Run the application
shinyApp(ui = ui, server = server)
