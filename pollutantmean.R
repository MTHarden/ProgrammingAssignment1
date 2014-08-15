pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  ## Read the desired Air Polution Data
  ## Create a data frame names APData, 
  ## rbind combines by rows data from the tables on each .csv (as specified in id).
  ## sprintf %03d pads leading zeros to id if it has less than 3 digits.
  ## header identifes the first row from each csv as a header
  APData <- data.frame()
  for(file in rep(id)){
    APData<-rbind(APData,read.table(paste(directory,"/",sprintf("%03d", file),".csv",sep=""),sep=",",header=TRUE))
  }
  ## Calculate the mean
  ## Round to three decimal places
  ## Since APData[pollutnat] is a data.frame and not numeric, it must become a matrix to be an arg of mean()
  round(mean(as.matrix(APData[pollutant]), na.rm = TRUE), digits = 3)
}    