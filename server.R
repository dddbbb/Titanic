library(shiny)
library(shinyjs)
library(randomForest)

#Load trained model from a file (model trained on kaggle titanic dataset with random forest algoritm)
rfr<-load("model.rda")
shinyServer(function(input, output, session) {
        #Take all input in data.frame
        man <- reactive({
                 data.frame(Pclass = factor(input$Pclass, levels = c("1","2", "3")),
                            Age = as.numeric(input$Age),
                            Sex = factor(input$Sex,levels = c("female", "male")),
                            Parch = as.integer(input$Parch),
                            SibSp = as.integer(input$SibSp),
                            Fare = as.numeric(input$Fare),
                            Embarked = factor(input$Embarked, levels = c("C","Q","S")))                
         
        })
        
        # Output via tables without paging and searching forms
        output$result <- renderDataTable(options = list(paging = FALSE, searching = FALSE),{
                
                pas <- man()
                #Predicting
                pred<-data.frame(predict(get(rfr),pas, type="prob"))
                names(pred)<-c("Chance to die", "Chance to survive")
                pred
        })
        #Javascript for hide/show div with info
        shinyjs::onclick("toggleAdvanced",
                         shinyjs::toggle(id = "advanced", anim = TRUE))
       
}
)
