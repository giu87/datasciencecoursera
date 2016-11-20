library(shiny)
library(dplyr)
library(ggplot2)
library(GGally)
library(HistData)

data(GaltonFamilies)
gf <- GaltonFamilies

# transform inches to cms
gf <- gf %>% mutate(fh=father*2.54,
                    mh=mother*2.54,
                    mph=midparentHeight*2.54,
                    ch=childHeight*2.54)

# linear model
model <- lm(ch ~ fh + mh + gender, data=gf)

shinyServer(function(input, output) {

  output$heightPlot <- renderPlot({
    mh <- input$mother
    fh <- input$father
    
    son <- predict(model, newdata=data.frame(father=fh, mother=mh, gender = "male"))
    daughter <- predict(model, newdata=data.frame(father=fh, mother=mh, gender = "female"))
    
    yvals <- c("Father", "Son", "Daughter", "Mother")
    df <- data.frame(
      x = factor(yvals, levels= yvals, ordered=TRUE),
      y = c(fh, son, daughter, mh),
      colors = c("blue", "orange", "pink", "red")
    )
    
    ggplot(df, aes(x=x, y=y, color=colors, fill=colors)) +
      geom_bar(stat="identity", width=0.5) +
      xlab("") +
      ylab("Height (cm)") +
      theme_minimal() +
      theme(legend.position="none")
  })
})
