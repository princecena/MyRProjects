# Start with reshaping
library(reshape2)
head(mtcars)

# Melting Data Frames
mtcars$carname <- rownames(mtcars)
carMelt <- melt(mtcars,id = c("carname","gear","cyl"),measure.vars = c("mpg","hp"))
head(carMelt)

# Casting dataframes
cylData <- dcast(carMelt,cyl ~ variable)
cylData
cylData <- dcast(carMelt,cyl ~ variable, mean)
cylData

# Averaging values
head(InsectSprays)
tapply(InsectSprays$count,InsectSprays$spray,sum)

# Another way - split
spIns <- split(InsectSprays$count,InsectSprays$spray)
spIns

# Another way - apply
sprCount <- lapply(spIns, sum)
sprCount
unlist(sprCount)

# Another way - combine
sapply(spIns, sum)

# Another way - plyr package
library(plyr)
ddply(InsectSprays,.(spray),summarize,sum=sum(count))

# Creating a new variable
spraySums <- ddply(InsectSprays,.(spray),summarize,sum=ave(count,FUN=sum))
dim(spraySums)
head(spraySums)



