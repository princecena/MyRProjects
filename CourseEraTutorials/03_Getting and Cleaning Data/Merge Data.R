#Peer Review Data
if(!file.exists("./data")) {dir.create("CourseEraTutorials/03_Getting and Cleaning Data/.data")}
fileUrl1 <- "https://dl.dropboxusercontent.com/u/7710864/data/reviews-apr29.csv"
fileUrl2 <- "https://dl.dropboxusercontent.com/u/7710864/data/solutions-apr29.csv"

download.file(fileUrl1,destfile = "CourseEraTutorials/03_Getting and Cleaning Data/.data/reviews.csv",method = "curl")
download.file(fileUrl2,destfile = "CourseEraTutorials/03_Getting and Cleaning Data/.data/solutions.csv",method = "curl")
reviews <- read.csv("CourseEraTutorials/03_Getting and Cleaning Data/.data/reviews.csv")
solutions <- read.csv("CourseEraTutorials/03_Getting and Cleaning Data/.data/solutions.csv")
head(reviews)
head(solutions)

# Using join command in the plyr package also, you can merge
library(plyr)
df1 <- data.frame(id = sample(1:10),x = rnorm(10))
df2 <- data.frame(id = sample(1:10),y = rnorm(10))
arrange(join(df1,df2),id)

# If you have multiple data frames
df1 <- data.frame(id = sample(1:10),x = rnorm(10))
df2 <- data.frame(id = sample(1:10),y = rnorm(10))
df3 <- data.frame(id = sample(1:10),z = rnorm(10))
dfList <- list(df1,df2,df3)
join_all(dfList)

