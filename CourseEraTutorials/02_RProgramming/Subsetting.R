
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

#Extracting multiple elements of a list
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
x[,2]  ##returns first column containing all row values

#By default, the dimensions are dropped when we extract a single element from matrix.
#But by using drop = FALSE, the dimensions are not dropped.
x[1,2, drop = FALSE] #returns a 1 X 1 matrix as dimensions are now not dropped.
x[1,]  #returns a vector containing first row with all column values
x[1, ,drop = FALSE] #returns a 1 X n matrix,where n is the number of columns.

######################################################################################################
#Subsetting Partial Matching
######################################################################################################
#Partial matching works with [[ and $
