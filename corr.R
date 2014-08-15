corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0
        
        ## Return a numeric vector of correlations
        
        total <- numeric()
        for (file in list.files(directory)) {
                APData <- read.table(paste(directory,"/",file,sep = ""),sep = ",",header = TRUE)
                comple <- nrow(APData[complete.cases(APData),])
                        if (comple > threshold) {
                                total <- c(total,cor(APData$nitrate,APData$sulfate,use = "complete.obs"))
                        }
        }
        total
}