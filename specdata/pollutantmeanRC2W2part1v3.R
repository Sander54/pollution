pollutiontest <- function(directory, scope){ 

    
fileall <- list.files(path = directory, pattern = ".csv", full.names = TRUE)
i <- 1
id = scope
for (i in id){

    datapoll <- read.csv(fileall[i])            # read pollution station file
    valdata <-sum(datapoll[,3], na.rm = TRUE)   # read only value on pollution days excl NA

    timedata <-length(datapoll[,3])             # sum of all days inwhich 1 station is "searching"
    timewhen <- sum(!is.na(datapoll[,3]))       # sum of days inwhich pollution has occurred 1 station


    datacum <- c(datacum, valdata)              # safe data (sum poll) of each station  
    
    datatimecum <- c(datatimecum, timedata)     # safe data (all days) of each station
    datatimecumwhen <- c(datatimecumwhen, timewhen) # safe data (polluted days) of each station
    }

datacumtot <- sum(datacum)                  # sum of (all sums of pollution per station)
datatimecumtot <- sum(datatimecum)          # sum of (all sums of days meassured per station)
datatimecumwhentot <- sum(datatimecumwhen)  # sum of (all sums of polluted days per station)

avgSH <- (datacumtot / datatimecumtot)      # mean of polltion concerning all measured days
avgSHwhen <- (datacumtot / datatimecumwhentot) # mean of pollution only for the period inwhich poll occured
}

start = 1
end = 332
scope <- c(start:end)

datacum <- numeric()                    # start cumm. counting
datatimecum <- numeric()                # start cumm. counting
datatimecumwhen <- numeric()            # start cumm. counting

resultfunct <- pollutiontest("/Users/SamSam/Desktop/Coursera2017/specdata/specdata - kopie/", scope)
resultfunct

datapoll

datacum
datatimecum
timedata
timewhen

avgSH
avgSHwhen

