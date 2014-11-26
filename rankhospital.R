rankhospital <- function(state, condition, num = "best") {
    data <- read.csv("rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character")   
    colNum <- if(condition == "heart attack") { 11 }
    else if(condition == "heart failure") { 17 }
    else if(condition == "pneumonia" ) { 23 }
    else { stop("invalid outcome") }
    
    stateData <- data[data$State == state & data[colNum] != "Not Available", ]
    
    if(nrow(stateData) == 0) stop("invalid state")
    stateData[,colNum] <- sapply(stateData[,colNum], as.numeric)
    result <- stateData[order(stateData[colNum], stateData[2]), 2]
    
    if (num == "best") { rank <- 1 }
    else if (num == "worst") { rank <- length(result) }
    else { rank <- num }
    result[rank]
}