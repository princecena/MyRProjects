# Color Utilities in R
#   >The grDevices package has two functions
#     -colorRamp
#     -colorRampPalette
#   >These functions take palettes of colors and help to interpolate between the colors
#   >The function colors() lists the names of colors you can use in any plotting function
#   
# Color Palette Utilities in R
#   -colorRamp: Take a palette of colors and return a function that takes valeus between 0 and 1,
#              indicating the extremes of the color palette (e.g. see the 'gray' function)
#   -colorRampPalette: Take a palette of colors and return a function that takes integer arguments
#              and returns a vector of colors interpolating the palette (like heat.colors or topo.colors)

# colorRamp
# [,1] [,2] [,3] corresponds to [Red] [Blue] [Green]
pal <- colorRamp(c("red", "blue"))
pal(0)
pal(1)
pal(0.5)
pal(seq(0, 1, len = 10))

#colorRampPalette
pal <- colorRampPalette(c("red", "yellow"))
pal(2)
pal(10)

# RColorBrewer Package
# One package on CRAN that contains interes1ng/useful color palettes
# There are 3 types of palettes
#   -Sequential
#   -Diverging
#   -Qualitative
# Palette information can be used in conjunction with the colorRamp() and
# colorRampPalette()

#RColorBrewer and colorRampPalette
library(RColorBrewer)
cols <- brewer.pal(3, "BuGn")
cols
pal <- colorRampPalette(cols)
image(volcano, col = pal(20))

# Some other plotting notes
# -The rgb function can be used to produce any color via red, green, blue proportions
# -Color transparency can be added via the alpha parameter to rgb
# -The colorspace package can be used for a different control over colors

#Scatterplot with no transparency
plot(x,y,pch=19)

#Scatterplot with transparency
plot(x,y,col=rgb(0,0,0,0.2),pch=19)