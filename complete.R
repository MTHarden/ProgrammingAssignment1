complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
        
        ## Read the desired Air Polution Data
        ## Create a data frame names APData, 
        ## rbind combines by rows data from the tables on each .csv (as specified in id).
        ## sprintf %03d pads leading zeros to id if it has less than 3 digits.
        ## header identifes the first row from each csv as a header
        ## Create a data.frame (counts) with rows (rbind) for each file (defined in for statement)
        ## Columns of these rows should be the file and number of rows in the subset of APData that are complete cases (as per the complete.cases function)
        total <- data.frame()
        for (file in rep(id)) {
                APData <- read.table(paste(directory,"/",sprintf("%03d", file),".csv",sep=""),sep=",",header=TRUE)
                counts <- rbind(counts,cbind(file,nrow(APData[complete.cases(APData),])))
        }
        ## Add a header to counts
        colnames(counts) <- c("id","nobs")
        ## retrun the counts data.frame
        counts
}