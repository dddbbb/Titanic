# Define UI for Titanic Surviver
shinyUI(fluidPage(
        #Load css that only hide one div of table
        tags$head(
                tags$link(rel = "stylesheet", type = "text/css", href = "./css.css")
        ),
        # Application title
        headerPanel("Titanic Passanger"),
        #Load javascript to page
        shinyjs::useShinyjs(),
        # Sidebar with controls to select the variable to answer will passanger survive
        sidebarPanel(
                radioButtons("Sex","Sex:", list("Male" = "male","Female" = "female"), inline = T),
                sliderInput("Age", "Age:", 
                            min=1, max=100, value=25),
                selectInput("Embarked", "Embarked:",
                            list("Southampton" = "S", 
                                 "Cherbourg" = "C", 
                                 "Queenstown" = "Q")),
                selectInput("Pclass", "Passanger Class:",
                            list("1st" = "1", 
                                 "2nd" = "2",
                                 "3rd" = "3")),
                sliderInput("SibSp", "Number of Siblings/Spouses Aboard:", 
                            min=0, max=10, value=0),
                sliderInput("Parch", "Number of Parents/Children Aboard:", 
                            min=0, max=10, value=0),
                sliderInput("Fare", "Passenger Fare:", 
                            min=0, max=100, value=10, step=0.1)
        ),
        
        
        mainPanel(
                
                dataTableOutput("result"),
                br(),
                a(id = "toggleAdvanced", "How does it work?"),
                #Hide div with info on page loading via shinyjs
                shinyjs::hidden(div(id = "advanced", br(),p("Imagine you onboard Titanic. What is your chance to survive? Check it! 
                                                   Just choose your passanger data"),
                    p("This app uses random forest predicton model trained on", 
                      a(href="http://www.kaggle.com/c/titanic","Titanic: Machine Learning from Disaster", target="_blank"),
                     "competition dataset. Final model shows only 0.77 accuracy and used only for demonstration purpose.",
                     p("So, please, don't use it in a real life :)")))
                )
                
        )
))