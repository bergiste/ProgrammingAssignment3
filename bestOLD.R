best <- function(state, name) {
    outcome <- read.csv("rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character")
    ##[2] "Hospital.Name"
    ##[7] "State"
    ##[11] "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"     
    ##[17] "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
    ##[23] "Hospital.30.Day.Death..Mortality..Rates.from.Pneumon
    colNum <- 11
    stateData = outcome[outcome$State == state,]
    minVal <- sapply(stateData[colNum], min)
    result <- stateData[stateData[colNum] == minVal,2]
    result
}
#best("TX", "heart failure")
#best("TX", "pneumonia")