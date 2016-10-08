library(ggplot2)
qplot(data = mpg, displ, hwy)

# Modifying Aesthetics
qplot(displ,hwy,data = mpg, color = drv)
qplot(displ,hwy,data = mpg, shape = drv)

# Adding a geom
qplot(displ,hwy,data = mpg,geom = c("point","smooth"))

# Histograms
qplot(hwy,data = mpg, fill = drv)

# Facets
qplot(displ, hwy, data = mpg, facets = .~drv)
qplot(hwy, data=mpg, facets=drv ~., binwidth=2)

# Density Smooth
qplot(hwy,data=mpg,geom="density")
qplot(hwy,data=mpg,geom="density",color=drv)

# Scatterplots
qplot(displ,hwy,data=mpg,color=drv,geom=c("point","smooth"))
qplot(displ,hwy,data=mpg,geom=c("point","smooth"),facets = .~drv)

# ggplot
g <- ggplot(mpg,aes(displ,hwy)) + geom_point() + facet_grid(.~drv) +  geom_smooth(method = "lm")
ggplot(mpg,aes(displ,hwy)) + geom_point(color = "steelblue",size = 4, alpha = 1/2)
ggplot(mpg,aes(displ,hwy)) + geom_point(aes(color = drv),size = 4, alpha = 1/2) + labs(title = "Cars Data")
ggplot(mpg,aes(displ,hwy)) + geom_point(aes(color = drv),size = 2, alpha = 1/2) + geom_smooth(size = 4, linetype = 3, method = "lm", se = FALSE)
ggplot(mpg,aes(displ,hwy)) + geom_point(aes(color = drv)) + theme_bw(base_family = "Times")

# A Note About Axis Limits
testdat <- data.frame(x = 1:100, y = rnorm(100))
testdat[50,2] <- 100 ## Outlier!!
plot(testdat$x, testdat$y, type = "l", ylim = c(-3,3))

g <- ggplot(testdat, aes(x = x, y = y))
g + geom_line()

#Outlier Missing
g + geom_line() + ylim(-3, 3)

#Outlier Included
g + geom_line() + coord_cartesian(ylim = c(-3, 3))

#Continuous variables can be made categorical by using the cut() function so
# we can condition on it in the plotting


