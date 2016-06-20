# The zip file contains 332 comma-separated-value (CSV) files containing pollution monitoring data for fine particulate matter (PM) air pollution at 332 locations in the United States. 
# Each file contains data from a single monitor and the ID number for each monitor is contained in the file name. 
# For example, data for monitor 200 is contained in the file "200.csv". 
# Each file contains three variables:
#   
#     #Date: the date of the observation in YYYY-MM-DD format (year-month-day)
#   
#    #sulfate: the level of sulfate PM in the air on that date (measured in micrograms per cubic meter)
#   
#    #nitrate: the level of nitrate PM in the air on that date (measured in micrograms per cubic meter)
# 
# For this programming assignment you will need to unzip this file and create the directory 'specdata'. 
# Once you have unzipped the zip file, do not make any modifications to the files in the 'specdata' directory. 
# In each file you'll notice that there are many days where either sulfate or nitrate (or both) are missing (coded as NA). 
# This is common with air pollution monitoring data in the United States.

# Part 1
# 
# Write a function named 'pollutantmean' that calculates the mean of a pollutant (sulfate or nitrate) across a specified list of monitors. 
# The function 'pollutantmean' takes three arguments: 'directory', 'pollutant', and 'id'. 
# Given a vector monitor ID numbers, 'pollutantmean' reads that monitors' particulate matter data from the directory specified in the 'directory' 
# argument and returns the mean of the pollutant across all of the monitors, ignoring any missing values coded as NA. 
# A prototype of the function is as follows:

pollutantmean <- function(directory,pollutant,id = 1:332) {

    #Create an empty dataframe
    data <- data.frame(Date = character(0), sulphate = numeric(0), nitrate = numeric(0), ID = numeric(0),stringsAsFactors = FALSE)
    
    #reading all the files from the specified directory and saving in a dataframe
    for (i in id) {
      print(i)
      temp <- read.csv(paste(sprintf("%03d",i),"csv",sep = "."),header = TRUE,sep = ",")
      data <- rbind(data,temp)
    }
    
    #Calculating mean of the pollutant
    meanPollutant <- mean(data[[pollutant]], na.rm = TRUE)
    return(meanPollutant)
    
}
  

# Part 2
# 
# Write a function that reads a directory full of files and reports the number of completely 
# observed cases in each data file. The function should return a data frame where the first column 
# is the name of the file and the second column is the number of complete cases. 

complete <- function(directory, id = 332) {
  
}

  

 