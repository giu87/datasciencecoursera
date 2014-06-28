rankhospital <- function(state, outcome, num = "best") {
   
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  o <- outcomeMatching(outcome)
  if(o == "invalid outcome")
    stop(o)
  
  data <- data[data$State==state & data[o] != 'Not Available', ]

  data <- data[order(as.numeric(data[,o]),data[,2]),]
  
  if(nrow(data) == 0)
    stop ("invalid state")
  
  if(num == "best")
    return (data[1, 2])
  
  if(num == "worst")
    return (data[nrow(data),2])
  
  if(num > length(data))
    return (NA)
  
  return (data[num, 2])
}

outcomeMatching <- function (outcome){
  
  a <- "invalid outcome"
  if(outcome == "heart attack") a <- 11
  if(outcome == "heart failure") a <- 17
  if(outcome == "pneumonia") a <- 23
  return(a)
}