##########################################################################################################
#lapply 
##########################################################################################################
#1. Loop over a list and evaulate a function on each element
#2. lapply takes three arguments: (1) a list x; (2) a function(or name of a function) FUN, (3)other
#   arguments via ... agrument. If x is not a list,it will be coerced to a list using as.list
x <- list(a = 1:5, b = rnorm(10),c =rnomr(20,1),d =rnorm(100,5))
lapply(mean)

x <- 1:4
lapply(x,runif,min = 0,max =  10)

#lapply and friends make heavy use of anonymous functions
x <- list(a = matrix(1:4,2,2),b = matrix(1:6,3,2))
lapply(x,function(elt) elt[,1]) #An anonymous function for extracting the first column of each matrix

##########################################################################################################
#sapply 
##########################################################################################################
#Same as lapply but try to simplify the result.It will try to simplify the result of lapply, if possible.
# 1. If the result is a list where every element is lenght 1, then a vector is returned
# 2. If the result is a list where every element is a vector of the same length(>1), a matrix is returned
# 3. If it can't figure it out, a list is returned

x <- list(a = 1:5, b = rnorm(10),c =rnomr(20,1),d =rnorm(100,5))
sapply(mean)

##########################################################################################################
#apply 
##########################################################################################################
#Apply a function(often an anonymous function) over the margins of an array
# 1. most often used to apply a function to the rows or coulns of a matrix
# 2. can be sued with general arrays ,e.g., taking the average of an array of matrices
# 3. It is not really faster than writing a loop, but it works in one line!

x <- matrix(rnorm(200),20,10)
apply(x,2,mean) #returns a vector of length 10 , which contains the mean of each column
apply(x,1,sum) #returns a vector of length 20 , which contains the sum of each row

# rowSums = apply(x,1,sum)
# rowMeans = apply(x,1,mean)
# rowSums = apply(x,2,sum)
# rowMeans = apply(x,1,mean)
#The shortcut functions are much faster, but you won't notice unless you are using a large matrix

#Other ways to apply
x <- matix(rnorm(200),20,10)
apply(x,1,quantile,probs = c(0.25,0.75))

#Average matrix in an array
a <- array(rnorm(2*2*10),c(2,2,10))
apply(a,c(1,2),mean) #same as rowMeans(a, dims = 2)

##########################################################################################################
#tapply 
##########################################################################################################
#Apply a function over subsets of a numeric vector

#take group means
x <- c(rnorm(10),runif(10),rnorm(10,1))
f <- gl(3,10)
f
tapply(x,f,mean)

#Take group means without simplification.
tapply(x, f, mean, simplify = FALSE)

#Find group ranges
tapply(x, f, range)
##########################################################################################################
#mapply 
##########################################################################################################
#Multivariate version of lapply
list(rep(1,4),rep(2,3),rep(3,2),rep(4,1))
#instead we can do:
mapply(rep,1:4,4:1)


#Vectorizing a Function

noise <- function(n, mean, sd) {
  rnorm(n, mean, sd)
}

noise(5, 1, 2) #gives a vector of 5 elements
noise(1:5, 1:5, 2) #this also gives a vector of 5 elements, but we wanted a list with first element having element 1 with a mean 1, second element having 2 elements with mean 2 and so on.

noise(1:5, 1:5, 2) # this solves the purpose which is same as below command:

list(noise(1, 1, 2), noise(2, 2, 2),
     noise(3, 3, 2), noise(4, 4, 2),
     noise(5, 5, 2))


##########################################################################################################
#split 
##########################################################################################################
#split takes a vector(or list) or dataframe and splits it into groups determined by a factor or list of factors
#have a similar signature to tapply
#split always returns a list and then you can apply apply or sapply
x <- c(rnorm(10),runif(10),rnorm(10,1))
f <- gl(3,10)
f
split(x,f)

lapply(split(x,f),mean)  #same as doing 'tapply(x,f,mean)'

# sapply can be used to split a dataframe in to multiple dataframes based on a column as factor having different values
s <- split(airquality,airquality$Month) #gives 5 dataframes as the Month column has five different values
# Now if we want to calculate column mean of all dataframes, we can use lapply
lapply(s, function(x) colMeans(x[,c("Ozone","Solar.R","Wind")],na.rm = TRUE))
sapply(s, function(x) colMeans(x[,c("Ozone","Solar.R","Wind")],na.rm = TRUE)) #simplfies the result and returns a matrix

#Splitting on More than One Level.Suppose we eant to split on two different factors
x <- rnorm(10)
f1 <- gl(2,5)
f2 <- gl(5,2)
interaction(f1,f2) #combines the two factors. Interactions creates empty levels
str(split(x,list(f1,f2)))
str(split(x,list(f1,f2),drop = TRUE)) #Empty levels can be dropped