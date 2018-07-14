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
plot(Age, Height, main = "Scatterplot", col = 3,col.main =  4,col.lab = 2, col.axis = 3)
plot(Age, Height, main = "Scatterplot",pch = "w")
abline(lm(Height~Age), col = 4, lty = 2, lwd = 6)
plot(Age[Gender == "male"],Height[Gender == "male"], col = 4, pch = "m",xlab = "Age", ylab = "Height", main = "Height vs Age")
points(Age[Gender == "female"],Height[Gender == "female"], col = 6, pch = "f")

par(mfrow=c(1,2))
plot(Age[Gender == "male"],Height[Gender == "male"],xlab = "Age", ylab = "Height", main = "Height vs Age(Male)",xlim = c(0,20), ylim = c(45,85))
plot(Age[Gender == "female"],Height[Gender == "female"],xlab = "Age", ylab = "Height", main = "Height vs Age(Female)",xlim = c(0,20), ylim = c(45,85))

par(mfrow=c(1,1))
plot(Age,Height,main = "TITLE", axes = F)
axis(side = 1, at = c(7,12.3,15), labels = c("sev","mean","15"))
axis(side = 2, at = c(55,65,75), labels = c(55,65,75))
box()
axis(side = 4, at = c(50,60,70), labels = c(50,60,70))

#How to Add Text to Plots in R 
plot(Age,LungCap,main = "Scatterplot of LungCap vs Age",  las = 1)
cor(Age,LungCap)
text(x =5, y = 11, label = "r = 0.82", adj = 1)
text(x =3.5, y = 13, label = "r = 0.82", adj = 0, cex= 1 , col = 4, font =4)
abline(h =  mean(LungCap), col =2, lwd = 2)
text(x =2.5, y =8.5, adj = 0, label = "Mean Lung Cap", cex =0.65, col = 2)
mtext(text = "r = 0.82", side = 1, adj = 1)
mtext(text = "r = 0.82", side = 3, adj = 1, col = 4, font = 4, cex= 1.25)

# How to add a Legend to Plots in R
plot(Age[Smoke == "no"],LungCap[Smoke == "no"], main = "LungCap vs Age for Smoke/Non-Smoke", col =4, xlab = "Age", ylab = "Lung Cap", pch = 16)
points(Age[Smoke == "yes"],LungCap[Smoke == "yes"],col =2 , pch = 17)
legend(x = 3.5, y = 14, legend = c("Non-Smoke","Smoke"), fill = c(4,2))

plot(Age[Smoke == "no"],LungCap[Smoke == "no"], main = "LungCap vs Age for Smoke/Non-Smoke", col =4, xlab = "Age", ylab = "Lung Cap", pch = 16)
points(Age[Smoke == "yes"],LungCap[Smoke == "yes"],col =2 , pch = 17)
legend(x = 3.5, y = 14, legend = c("Non-Smoke","Smoke"), col = c(4,2), pch = c(16,17), bty = "n")

plot(Age[Smoke == "no"],LungCap[Smoke == "no"], main = "LungCap vs Age for Smoke/Non-Smoke", col =4, xlab = "Age", ylab = "Lung Cap", pch = 16)
points(Age[Smoke == "yes"],LungCap[Smoke == "yes"],col =2 , pch = 17)
lines(smooth.spline(Age[Smoke == "no"],LungCap[Smoke == "no"]), col =4, lwd =3)
lines(smooth.spline(Age[Smoke == "yes"],LungCap[Smoke == "yes"]), col =2, lwd =3)
legend(x = 3.5, y = 14, legend = c("Non-Smoke","Smoke"), col = c(4,2), lty = 1, bty = "n", lwd =3)


plot(Age[Smoke == "no"],LungCap[Smoke == "no"], main = "LungCap vs Age for Smoke/Non-Smoke", col =4, xlab = "Age", ylab = "Lung Cap", pch = 16)
points(Age[Smoke == "yes"],LungCap[Smoke == "yes"],col =2 , pch = 17)
lines(smooth.spline(Age[Smoke == "no"],LungCap[Smoke == "no"]), col =4, lwd =3 ,lty = 2)
lines(smooth.spline(Age[Smoke == "yes"],LungCap[Smoke == "yes"]), col =2, lwd =3, lty = 3)
legend(x = 3.5, y = 14, legend = c("Non-Smoke","Smoke"), col = c(4,2), lty = c(2,3), bty = "n", lwd =3)


#Binomial Distribution in R
dbinom(x=3,size =20,prob = 1/6)
dbinom(x=0:3,size =20,prob = 1/6)
sum(dbinom(x=0:3,size =20,prob = 1/6))
pbinom(q=0:3,size =20,prob = 1/6, lower.tail = T)

#Poisson Distribution in R 
dpois(x =4, lambda = 7)
dpois(x =0:4, lambda = 7)
sum(dpois(x =0:4, lambda = 7))
ppois(q = 4, lambda = 7, lower.tail = T)
ppois(q = 4, lambda = 7, lower.tail = F)

#Normal Distribution, Z Scores, and Normal Probabilities in R 
pnorm(q = 70, mean = 75, sd = 5, lower.tail = T) # P(X <= 70)
pnorm(q = 85, mean = 75, sd = 5, lower.tail = F) # P(X <= 85)
pnorm(q=1,mean = 0,sd = 1,lower.tail = F) #P(Z >= 1)
qnorm(q=0.25,mean = 75, sd =5, lower.tail = T) # find Q1
x <-  seq(from = 55, to = 95, by = 0.25)
dens <- dnorm(x, mean = 75, sd =5)
plot(x,dens, type = "l",main  = "X-Normal: mean=75, SD = 5", xlab= "x", ylab = "Probability Density", las = 1)
abline(v=75)
rand <- rnorm(n = 40, mean = 75, sd = 5)
hist(rand)


#Distribution and t Scores in R 









