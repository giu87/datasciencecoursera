rankall <- function(outcome, num = "best") {
 
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  o <- outcomeMatching(outcome)
  if(o == "invalid outcome")
    stop(o)
  
  data <- data[data[o] != 'Not Available', ]
  
  data <- data[order(data[,7], as.numeric(data[,o]),data[,2]),]
  
  states = unique(unlist(data[,7], use.names = FALSE))
  
  result <- matrix(NA, nrow = length(states), ncol = 2)

  for(i in 1: length(states)){

    result[i,] <- states[i]
    result [i,1] <- checkNum(data[data$State == states[i],], num)
  }
  
  colnames(result) <- c("hospital", "state")
  
  return (data.frame(result))
}

checkNum <- function(data, num){
  
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