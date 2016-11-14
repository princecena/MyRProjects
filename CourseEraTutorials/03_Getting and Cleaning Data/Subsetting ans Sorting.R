# SUbsetting - Quick Overview
set.seed(12345)
X <- data.frame("var1"=sample(1:5),"var2"=sample(6:10),"var3"=sample(11:15))
X <- X[sample(1:5),]
X$var2[c(1,3)] <- NA
X

X[,1]
X[,"var1"]
X[1:2,"var2"]

# Logical ANds and Ors
X[(X$var1 <= 3 & X$var3 > 11),]
X[(X$var1 <= 3 | X$var3 > 15),]

#Dealing with Missing values
X[which(X$var2) > 8,]

#Sorting
sort(X$var1)
sort(X$var1, decreasing = TRUE)
sort(X$var2,na.last = TRUE)

#Ordering
X[order(X$var1),]
X[order(X$var1,X$var3),]

#Ordering with plyr
library(plyr)
arrange(X,var1)
arrange(X,desc(var1))

#Adding rows and columns
X$var4 <- rnorm(5)
X
Y <- cbind(X,rnorm(5))
Y
