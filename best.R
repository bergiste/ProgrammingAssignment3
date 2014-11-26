best <- function(state, condition) {
    data <- read.csv("rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character")   
    stateData <- data[data$State == state, ]
    if(nrow(stateData) == 0) stop("invalid state")
    colNum <- if(condition == "heart attack") { 11 }
        else if(condition == "heart failure") { 17 }
        else if(condition == "pneumonia" ) { 23 }
        else { stop("invalid outcome") }
    minLst <- lapply(stateData[colNum], as.numeric)
    minVal <- sapply(minLst, min, na.rm = T)
    result <- stateData[stateData[colNum] == as.character(minVal), 2]
    result
}