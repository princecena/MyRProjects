# Why do we use graphs in data analysis?
# 1. to understand data properties
# 2. to find patterns in data
# 3. to suggest modelling strategies
# 4. to "debug" analysis
# 5. to communicate results

# Exploratory graphs are about first four points

# Characterstics of Exploratory analysis
# 1. they are made quickly
# 2. a large number are made
# 3. the goal is for personal understanding
# 4. Axes/legends are cleaned up(later)
# 5. Color/size are primarily used for information

head(airquality)
summary(airquality)

boxplot(airquality$Temp,col = 'blue')

hist(airquality$Temp,col = 'green')
rug

hist(airquality$Temp,col = 'green', breaks = 100)
rug(airquality$Temp)

boxplot(airquality$Temp,col = 'blue')
abline(h = 80)

hist(airquality$Temp,col = 'green')
abline(v=80,lwd = 2)
abline(v = median(airquality$Temp), col = "magenta", lwd = 4)

barplot(table(airquality$Month),col="wheat",main = "Number of Months")

boxplot(Temp ~ Month,data = airquality,col = 'red')

par(mfrow = c(2,1), mar = c(4,4,2,1))
hist(subset(airquality, Month == 5)$Temp, col = "green")
hist(subset(airquality, Month == 6)$Temp, col = "green")
hist(subset(airquality, Month == 7)$Temp, col = "green")
hist(subset(airquality, Month == 8)$Temp, col = "green")
hist(subset(airquality, Month == 9)$Temp, col = "green")

with(airquality[!is.na(airquality$Ozone),],plot(Ozone,Temp))
abline(h = 80, lwd = 2, lty = 2)


with(airquality[!is.na(airquality$Ozone),],plot(Ozone,Temp, col = Month))
abline(h = 80, lwd = 2, lty = 2)

#Multiple ScatterPlots
par(mfrow = c(1,5), mar = c(5,4,2,1))
with(subset(airquality,Month == 5), plot(Ozone,Temp, main = "5"))
with(subset(airquality,Month == 6), plot(Ozone,Temp, main = "6"))
with(subset(airquality,Month == 7), plot(Ozone,Temp, main = "7"))
with(subset(airquality,Month == 8), plot(Ozone,Temp, main = "8"))
with(subset(airquality,Month == 9), plot(Ozone,Temp, main = "9"))