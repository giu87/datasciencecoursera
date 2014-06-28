best <- function(state, outcome) {

  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  o <- outcomeMatching(outcome)
  if(o == "invalid outcome")
    stop(o)
  
  data <- data[data$State==state & data[o] != 'Not Available', ]
  
  if(nrow(data) == 0)
    stop ("invalid state")
  
  rowNum <- which.min(data[, o])
  data[rowNum,2]
  
}

outcomeMatching <- function (outcome){

  a <- "invalid outcome"
  if(outcome == "heart attack") a <- 11
  if(outcome == "heart failure") a <- 17
  if(outcome == "pneumonia") a <- 23
  return(a)
}