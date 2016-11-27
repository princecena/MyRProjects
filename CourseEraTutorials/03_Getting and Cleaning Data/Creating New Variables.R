# Getting the data from the web
if(!file.exists("CourseEraTutorials/03_Getting and Cleaning Data/.data")) {dir.create("CourseEraTutorials/03_Getting and Cleaning Data/.data")}
#fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
#download.file(fileUrl,destfile = "CourseEraTutorials/03_Getting and Cleaning Data/.data/restaurants.csv", method = "curl")
restData <- read.csv("CourseEraTutorials/03_Getting and Cleaning Data/.data/restaurants.csv")
summary(restData)
str(restData)

# Creating Sequences
#Sometimes you need an index for your data set

s1 <- seq(1,10,by=2);s1
s2 <- seq(1,10,length=3);s2
x <- c(1,3,8,25,100);seq(along=x)

#Subsetting variables
restData$nearMe <- restData$neighborhood %in% c("Rolan Park","Homeland")
table(restData$nearMe)

#Creating binary Variables
restData$zipWrong <- ifelse(restData$zipCode < 0, TRUE,FALSE)
table(restData$zipWrong,restData$zipCode < 0)

# Creating Categorical Variables
restData$zipGroups <- cut(restData$zipCode,breaks = quantile(restData$zipCode))
table(restData$zipGroups)
table(restData$zipGroups,restData$zipCode)

# Easier Cutting
library(Hmisc)
restData$zipGroups <- cut2(restData$zipCode,g=4)
table(restData$zipGroups)

# Creating factor variables
restData$zcf <- factor(restData$zipCode)
restData$zcf[1:10]
class(restData$zcf)

# Levels of factor variables
yesno <- sample(c("yes","no"),size = 10,replace = TRUE)
yesnofac <-  factor(yesno,levels = c("yes","no"))
relevel(yesnofac,ref="yes")
as.numeric(yesnofac)


