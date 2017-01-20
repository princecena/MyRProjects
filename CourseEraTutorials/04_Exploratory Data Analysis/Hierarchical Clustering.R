# Clustering organizes things that are close into groups
#   -How do we define close?
#   -How do we group things?
#   -How do we visualize the grouping?
#   -How do we interpret the grouping?




# Hierarchical clustering
#   > An agglomerative approach
#       -Find closest two things
#       -Put them together
#       -Find next closest
#   > Requires
#       -A defined distance
#       -A merging approach
#   > Produces
#       -A tree showing how close things are to each other


# How do we define close?
#  > Most important step
#      -Garbage in -> garbage out
#  > Distance or similarity
#      -Continuous - euclidean distance
#      -Continuous - correlation similarity
#      -Binary - manhattan distance
#  > Pick a distance/similarity that makes sense for your problem

set.seed(1234)
par(mar = c(0, 0, 0, 0))
x <- rnorm(12, mean = rep(1:3, each = 4), sd = 0.2)
y <- rnorm(12, mean = rep(c(1, 2, 1), each = 4), sd = 0.2)
plot(x, y, col = "blue", pch = 19, cex = 2)
text(x + 0.05, y + 0.05, labels = as.character(1:12))

#Hierarchical clustering - dist
dataFrame <- data.frame(x = x, y = y)
dist(dataFrame)

#dataFrame <- data.frame(x = x, y = y)
distxy <- dist(dataFrame)
hClustering <- hclust(distxy)
plot(hClustering)

#heatmap() function is good to visualize matrix data.I t runs hierarchichal clustering on the rows and columns of the table
dataFrame <- data.frame(x = x, y = y)
set.seed(143)
dataMatrix <- as.matrix(dataFrame)[sample(1:12), ]
heatmap(dataMatrix)

# While using hierarchical clustering is how do you merge points together? And so the question is, you know, when you  merge a point together, what represents its new location. And so one is called average, so average linkage. And the idea is that if you take two points and their new  coordinate location, it's just the average of their x coordinates and their y coordinates. So it's kind of like the roughly the center of gravity or the middle of tat group of points, now that seems logical and and it can, and it will lead to a kind of certain type of clustering result.  The other type of approach is called complete linkage and there the idea is that if you want to measure the distance between two clusters of points, then you take the farthest two points from each, from the two clusters, as the distance.

