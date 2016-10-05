# Base graphics are used most commonly and are a very powerful system for creating 2-D graphics.
# 
# > There are two phases to creating a base plot:
#   -Initializing a new plot
#   -Annotating (adding to) an existing plot

# > Calling plot(x, y) or hist(x) will launch a graphics device (if one is not already open) and
# draw a new plot on the device

# >If the arguments to plot are not of some special class, then the default method for plot is
# called; this function has many arguments, letting you set the title, x axis label, y axis label, etc.

# > The base graphics system has many parameters that can set and tweaked; these parameters are
# documented in ?par; it wouldn’t hurt to try to memorize this help page!

library(datasets)
hist(airquality$Ozone) ## Draw a new plot

with(airquality, plot(Wind, Ozone))

airquality <- transform(airquality, Month = factor(Month))
boxplot(Ozone ~ Month, airquality, xlab = "Month", ylab = "Ozone (ppb)")

# Some Important Base Graphics Parameters
# Many base plotting functions share a set of parameters. Here are a few key ones:
#   -pch: the plotting symbol (default is open circle)
#   -lty: the line type (default is solid line), can be dashed, dotted, etc.
#   -lwd: the line width, specified as an integer multiple
#   -col: the plotting color, specified as a number, string, or hex code; the colors() function gives
#   -you a vector of colors by name
#   -xlab: character string for the x-axis label
#   -ylab: character string for the y-axis label

# The par() function is used to specify global graphics parameters that affect all plots in an R
# session. These parameters can be overridden when specified as arguments to specific plotting
# functions.
#   las: the orientation of the axis labels on the plot
#   bg: the background color
#   mar: the margin size
#   oma: the outer margin size (default is 0 for all sides)
#   mfrow: number of plots per row, column (plots are filled row-wise)
#   mfcol: number of plots per row, column (plots are filled column-wise)


# Base Plotting Functions
#   plot: make a scatterplot, or other type of plot depending on the class of the object being plotted
#   lines: add lines to a plot, given a vector x values and a corresponding vector of y values (or a 2-
#                                                                                                 column matrix); this function just connects the dots
#   points: add points to a plot
#   text: add text labels to a plot using specified x, y coordinates
#   title: add annotations to x, y axis labels, title, subtitle, outer margin
#   mtext: add arbitrary text to the margins (inner or outer) of the plot
#   axis: adding axis ticks/labels

library(datasets)
with(airquality, plot(Wind, Ozone))
title(main = "Ozone and Wind in New York City") ## Add a title

with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in New York City"))
with(subset(airquality, Month == 5), points(Wind, Ozone, col = "blue"))

with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in New York City",
                      type = "n"))
with(subset(airquality, Month == 5), points(Wind, Ozone, col = "blue"))
with(subset(airquality, Month != 5), points(Wind, Ozone, col = "red"))
legend("topright", pch = 1, col = c("blue", "red"), legend = c("May", "Other Months"))

with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in New York City",
                      pch = 20))
model <- lm(Ozone ~ Wind, airquality)
abline(model, lwd = 2)

par(mfrow = c(1, 2))
with(airquality, {
  plot(Wind, Ozone, main = "Ozone and Wind")
  plot(Solar.R, Ozone, main = "Ozone and Solar Radiation")
})

par(mfrow = c(1, 3), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(airquality, {
  plot(Wind, Ozone, main = "Ozone and Wind")
  plot(Solar.R, Ozone, main = "Ozone and Solar Radiation")
  plot(Temp, Ozone, main = "Ozone and Temperature")
  mtext("Ozone and Weather in New York City", outer = TRUE)
})

########################################################################################################
# Base Plotting Demonstration
########################################################################################################
x <- rnorm(100)
hist(x)

#Plotting x and y
y <- rnorm(100)
plot(x,y) #default small white circles as points

#Setting the margin
par(mar=c(2,2,2,2))
plot(x,y)

par(mar=c(4,4,2,2))
plot(x,y)
plot(x,y,pch = 20) #solid black circles
plot(x,y,pch = 2) # triangles
title("Scatterplot")
text(-2,-2,"Label")
legend("topleft", legend = "Data", pch = 2)

#Adding linear model
fit <- lm(y ~ x)
abline(fit, lwd = 3, col ="blue")

#Adding x and y lables
plot(x,y,xlab = "Weight", ylab = "Height",main = "Scatterplot", pch = 20)
legend("topright", legend = "Data", pch = 20)
fit <- lm(y ~ x)
abline(fit, lwd = 3, col = "red")

# Let's see what happens if we try to put more than one plot
z <- rpois(100,2)

par(mfrow = c(2,1))
plot(x,y, pch = 20)
plot(x,z, pch = 19)

#Let's set the margins
par(mar = c(2,2,1,1))
plot(x,y, pch = 20)
plot(x,z, pch = 19)

par(mfrow = c(1,2))
plot(x,y, pch = 20)
plot(x,z, pch = 19)

par(mar = c(4,4,2,2))
plot(x,y, pch = 20)
plot(x,z, pch = 19)

par(mfrow = c(2,2)) #row wise plots
plot(x,y, pch = 20)
plot(x,z, pch = 19)
plot(z,x, pch = 20)
plot(y,x, pch = 19)

par(mfcol = c(2,2)) #column wise plots
plot(x,y, pch = 20)
plot(x,z, pch = 19)
plot(z,x, pch = 20)
plot(y,x, pch = 19)

x <- rnorm(100)
y <- x + rnorm(100)
g <- gl(2,50, labels = c("Male", "Female"))
plot(x,y, type = "n") #creates the new blank plot , but does not put the data
points(x[g == "Male"], y[g == "Male"],col = "green")
points(x[g == "Female"], y[g == "Female"],col = "blue", pch = 19)
