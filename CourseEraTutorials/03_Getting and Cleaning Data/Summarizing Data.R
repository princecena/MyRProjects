# Getting the data from the web
if(!file.exists("CourseEraTutorials/03_Getting and Cleaning Data/.data")) {dir.create("CourseEraTutorials/03_Getting and Cleaning Data/.data")}
fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl,destfile = "CourseEraTutorials/03_Getting and Cleaning Data/.data/restaurants.csv", method = "curl")
restData <- read.csv("CourseEraTutorials/03_Getting and Cleaning Data/.data/restaurants.csv")
summary(restData)
str(restData)

#Quantiles of quantitative variables
quantile(restData$councilDistrict,na.rm = T)
quantile(restData$councilDistrict,probs = c(0.5,0.75,0.9))

#Make Table
table(restData$zipCode,useNA = "ifany")
table(restData$councilDistrict,restData$zipCode)

#Check for missing values
sum(is.na(restData$councilDistrict))
any(is.na(restData$councilDistrict))
all(restData$zipCode > 0)

#Column and Row sums
colSums(is.na(restData))
all(colSums(is.na(restData))==0)

#Value with Specific Characterstics
table(restData$zipCode %in% c("21212"))
table(restData$zipCode %in% c("21212","21213"))
restData[restData$zipCode %in% c("21212","21213"),]

#Cross Tabs
data("UCBAdmissions")
DF <- as.data.frame(UCBAdmissions)
summary(DF)
xt <- xtabs(Freq ~ Gender + Admit,data=DF)
xt

#Flat Tables
warpbreaks$replicate <- rep(1:9,len=54)
xt <- xtabs(breaks~., data=warpbreaks)
xt
ftable(xt)

#Size of a dataset
fakeData <- rnorm(1e5)
object.size(fakeData)
print(object.size(fakeData),units="Mb")
