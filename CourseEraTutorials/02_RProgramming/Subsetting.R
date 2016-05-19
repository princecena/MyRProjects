#There are a number of operators that can be used to extract subsets of R objects.
#   [ always returns an object of the same class as the original; can be used to select more than one
#   element (there is one exception)

#   [[ is used to extract elements of a list or a data frame; it can only be used to extract a single
#   element and the class of the returned object will not necessarily be a list or data frame

#   $ is used to extract elements of a list or data frame by name; semantics are similar to that of [[.


######################################################################################################
#Subsetting Vectors
######################################################################################################
# Vectors can be subsetted using numeric index and logical index

x <- c("a","b","c","c","d","a")

## Numeric Index
x[1]
x[2]
x[1:4]

## Logical Index
x[x >"a"]
u <- x > "a"
x[u]


######################################################################################################
#Subsetting Lists
######################################################################################################
x <- list(foo = 1:4,bar =0.6)
x[1]  #returns a list
x[[1]]  #returns a vector
x$bar  #returns a vector
x[["bar"]]  #returns a vector
x["bar"]  #returns a list

#Extracting multiple elements of a list using single bracket
x <- list(foo = 1:4,bar =0.6, baz = "hello")
x[c(1,3)]

#Computed Indices
#The [[ operator can be used with computed indices; $ can only be used with literal names
x <- list(foo = 1:4,bar =0.6, baz = "hello")
name <- "foo"
x[[name]]   #computed index for 'foo'
x$name     #element 'name' does not exist!

#Subsetting Nested Elements of a List
x <- list(a = list(10,12,14),b = c(3.14,2.81))
x[[c(1,3)]]  #returns 14
x[[1]][[3]] #returns 14
x[[c(2,1)]] #returns 3.14


######################################################################################################
#Subsetting Matrices
######################################################################################################
x <- matrix(1:6,2,3)
x[1,2] #returns element at first row and second column
x[1,]  #returns first row containing all column values
x[,2]  ##returns second column containing all row values

#By default, the dimensions of a matrix are dropped when we extract a single element from matrix.
#But by using drop = FALSE, the dimensions are not dropped and you will get back the matrix object.
x[1,2, drop = FALSE] #returns a 1 X 1 matrix as dimensions are now not dropped.
x[1,]  #returns a vector containing first row with all column values
x[1, ,drop = FALSE] #returns a 1 X n matrix,where n is the number of columns.

######################################################################################################
#Subsetting Partial Matching
######################################################################################################
#Partial matching works with [[ and $

x <- list(aardvark = 1:5)
x$a #returns the object having name starting with a, in this case 'aardvark'
x[["a"]] #returns NULL as by default it does exact matching
x[["a", exact = FALSE]] #returns element with name 'aardvark'


######################################################################################################
#Removing NA Values
######################################################################################################
x <- c(1,2,NA,4,NA,5)
bad <- is.na(x)
x[!bad]

#Multiple objects, each having missing values an you want to take subset of all 
#objects having no missing values.Note that all objects should be of same length
x <- c(1,2,NA,4,NA,5)
y <- c("a","b",NA,"d",NA,"f")
good <- complete.cases(x,y)
x[good]
y[good]

#Removing missing values from data frame
airquality[1:6, ]
good <- complete.cases(airquality)
airquality[good, ][1:6, ]

######################################################################################################
#Vectorized Operations
######################################################################################################
#Many operations in R are vectorized making code more efficient, concise, and easier to read.
x <- 1:4
y <- 6:9
x * y
x / y

x <- matrix(1:4, 2, 2); y <- matrix(rep(10, 4), 2, 2)
x * y ## element-wise multiplication
x %*% y ## true matrix multiplication
