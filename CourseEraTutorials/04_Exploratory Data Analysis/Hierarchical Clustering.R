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

#Prettier dendrograms
myplclust <- function(hclust, lab = hclust$labels, lab.col = rep(1, length(hclust$labels)),
                      hang = 0.1, ...) {
  ## modifiction of plclust for plotting hclust objects *in colour*! Copyright
  ## Eva KF Chan 2009 Arguments: hclust: hclust object lab: a character vector
  ## of labels of the leaves of the tree lab.col: colour for the labels;
  ## NA=default device foreground colour hang: as in hclust & plclust Side
  ## effect: A display of hierarchical cluster with coloured leaf labels.
  y <- rep(hclust$height, 2)
  x <- as.numeric(hclust$merge)
  y <- y[which(x < 0)]
  x <- x[which(x < 0)]
  x <- abs(x)
  y <- y[order(x)]
  x <- x[order(x)]
  plot(hclust, labels = FALSE, hang = hang, ...)
  text(x = x, y = y[hclust$order] - (max(hclust$height) * hang), labels = lab[hclust$order],
       col = lab.col[hclust$order], srt = 90, adj = c(1, 0.5), xpd = NA, ...)
}
dataFrame <- data.frame(x = x, y = y)
distxy <- dist(dataFrame)
hClustering <- hclust(distxy)
myplclust(hClustering, lab = rep(1:3, each = 4), lab.col = rep(1:3, each = 4))

# Merging Data Points
# While using hierarchical clustering is how do you merge points together? And so the question is, you know, when you  merge a point together, what represents its new location. And so one is called average, so average linkage. And the idea is that if you take two points and their new  coordinate location, it's just the average of their x coordinates and their y coordinates. So it's kind of like the roughly the center of gravity or the middle of tat group of points, now that seems logical and and it can, and it will lead to a kind of certain type of clustering result.  The other type of approach is called complete linkage and there the idea is that if you want to measure the distance between two clusters of points, then you take the farthest two points from each, from the two clusters, as the distance.


#HeatMap Funtion
#heatmap() function is good to visualize matrix data.It runs hierarchichal clustering on the rows and columns of the table
dataFrame <- data.frame(x = x, y = y)
set.seed(143)
dataMatrix <- as.matrix(dataFrame)[sample(1:12), ]
heatmap(dataMatrix)
#heatmap function which is a really nice function for visualizing matrix data. So if you have an extremely large table or large matrix of numbers that are kind of similarly scaled, and you want to, just take a look at them really quickly in an organized way. And what the heat map function does is essentially runs a hierarchical cluster analysis on the rows of the table and on the columns of the table.  So if you can imagine the, the you know, rows of the table are like observations. And then it runs a cluster analysis on the rows of the table. And then, think of the columns of the, of the table as, as sets of observations. Even if they're not actually observations. The columns, for example, might be variables or something like that. But think of them as just different observations. You can write a cluster analysis on that, too. And the idea with the heatmap function is that it uses the hierarchical clustering function to organize the rows and the columns of the tables so that you can visualize them. You can visualize kind of groups or blocks of observations within the table using the image function. So, what it does is it creates a image plot here, and and it reorders the columns and the rows of the table according to the hierarchical clustering algorithm. So here you can see that for example, along the rows I've got this hierarchical, this cluster dendogram which shows that there are probably you know, three clusters. And those clusters, rows are all grouped together. And then there are only two columns in the data frame. So it's not particularly interesting to do a hierarchical cluster analysis on that. But if you had many,many columns, you know, you would reorganize the columns so that we, they would be kind of, the closer ones would be closer together, and the farther ones would be farther apart. And so, the heatmap function is really useful for kind of, or, as a very quickly visualizing this kind of high dimensional table data. 

#Summary
#the clustering picture may be unstable. And so, for example, if a few points were to change. Or, for example, if you have some outliers. Then the clustering, if you were to remove those points. Or modify them a little bit. Then the clustering dendogram or whatever the final products might be, could change a lot. And so you have to be sensitive to that possibility. So you might, so the, often the use, a useful thing is to try different metrics, distance metrics, to make sure it's not to see how sensitive it is to the different distance metrics. And also clustering algorithms could be sensitive to the scalings of a given variable, so you might, if, if one variable, for example, is, is measured on with units that are much larger than another variable then that can sometimes throw off the algorithm. So, it may be useful to scale certain variables so that they're more comparable to each other. 

