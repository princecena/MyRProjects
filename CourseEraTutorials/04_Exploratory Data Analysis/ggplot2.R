library(ggplot2)

#####################################################################################################################
# qplot
#####################################################################################################################
# The	Basics:	qplot()
# • Works	much	like	the	plot	function	in	base	graphics	system	
# • Looks	for	data	in	a	data	frame,	similar	to lattice,	or	in	the	parent	environment	
# • Plots	are	made	up	of	aesthe4cs	(size,	shape,color)	and	geoms	(points,	lines)	
# • Factors	are	important	for	indica:ng	subsets	of	the	data	(if	they	are	to	have	different	
#   properties);	they	should	be	labeled	
# • The	qplot()	hides	what	goes	on	underneath,which	is	okay	for	most	opera:ons	
# • ggplot()	is	the	core	func:on	and	very	flexible for	doing	things	qplot()	cannot	do	
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

#####################################################################################################################
# ggplot2
#####################################################################################################################

# Basic	Components	of	a	ggplot2	Plot	
# • A	data	frame	
# • aesthetic mappings:	how	data	are	mapped	to	color,	size		
# • geoms:	geometric	objects	like	points,	lines,	shapes.		
# • facets:	for	conditional	plots.		
# • stats:	statistical	transformations	like	binning,	quantiles,	smoothing.		
# • scales:	what	scale	an	aesthetic	map	uses	(example:	male	=	 red,	female	=	blue).		
# • coordinate	system	

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


