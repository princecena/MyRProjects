#Reading Data from txt file
setwd("/Users/princesharma/Documents/MyRProjects/Exercises/You Tube Tutorial Statistics with R")
LungCapData <- read.table("LungCapData.txt",header = T)
attach(LungCapData)


#Scatter Plot in R
cor(Age,Height)
plot(Age,Height,main = "Scatterplot",xlab = "AGE",ylab = "HEIGHT",las = 1,xlim = c(0,25), cex = 0.5,pch = 8,col = 2)
abline(lm(Height~Age),col = 4)
lines(smooth.spline(Age,Height),lty =2, lwd = 5)

#How to Calculate Mean, Standard Deviation, Frequencies in R 
table(Smoke)/length(Smoke) # Frequency Table
table(Smoke,Gender) #Contingency Table
mean(LungCap)
mean(LungCap,trim = .10) #trimmed mean
median(LungCap) #median
var(LungCap) #variance
sd(LungCap) #standard deviation
min(LungCap) #minimum
range(LungCap) #range
quantile(LungCap,probs = c(0.20,0.50,0.90,1)) #quantile
sum(LungCap) #sum
cor(LungCap,Age) #pearson correlation between LungCap and Age
cor(LungCap,Age,method = "spearman") #spearman correlation between LungCap and Age
cov(LungCap,Age)
var(LungCap,Age)

#How to Modify Plots in R
plot(Age, Height, main = "Scatterplot", cex = 0.5, cex.main = 2, cex.lab = 1.5, cex.axis = 0.7)
plot(Age, Height, main = "Scatterplot", font.main = 3,font.lab = 2, font.axis = 3)


