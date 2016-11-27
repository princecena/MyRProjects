# Getting the data from the web
if(!file.exists("CourseEraTutorials/03_Getting and Cleaning Data/.data")) {dir.create("CourseEraTutorials/03_Getting and Cleaning Data/.data")}
#fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
#download.file(fileUrl,destfile = "CourseEraTutorials/03_Getting and Cleaning Data/.data/restaurants.csv", method = "curl")
cameraData <- read.csv("CourseEraTutorials/03_Getting and Cleaning Data/.data/cameras.csv")
names(cameraData)

# Fixing character vectors - tolower(),toupper()
tolower(names(cameraData))

# Fixing character vectors - strsplit()
# - Good for automatically splitting variable names
# - important parameters: x, split

splitNames <- strsplit(names(cameraData),"\\.")
splitNames[[5]]
splitNames[[6]]

# Quick Aside - Lists
mylist <- list(letters = c("A","b","c"),numbers = 1:3,matrix(1:25,ncol = 5))
head(mylist)
mylist[1]
mylist$letters
mylist[[1]]

# Fixing character vectors - sapply()
# - Applies a function to each element in a vector or list
# - important parameters: X,FUN
splitNames[[6]][1]
firstElement <- function(x) {x[1]}
sapply(splitNames,firstElement)

# Fixing characters - sub() and gsub()
#to replace a single character which appears first
# to replace all the characters in a string
testName <- "this_is_a_test"
sub("_","",testName)
gsub("_","",testName)

# Finding values - grep(),grepl()
grep("Alameda",cameraData$intersection)
table(grepl("Alameda",cameraData$intersection))
cameraData2 <- cameraData[!grepl("Alameda",cameraData$intersection),]

# More on grep
grep("Alameda",cameraData$intersection,value = TRUE)
grep("JeffStreet",cameraData$intersection)
length(grep("JeffStreet",cameraData$intersection))

# Other functions:
# paste()
# paste0()
# substr()











