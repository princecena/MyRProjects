#R uses lexical or static scoping
#Lexical scoping in R means that the values of free variables are searched for in the enviornment in which the function was defined.

#A function returing another function
make.power <- function(n) {
  pow <- function(x) {
    x^n
  }
  pow
}

#This function returns another function as its value.
cube <- make.power(3)
square <- make.power(2)
cube(3)
square(3)

######################################################################################################
# Exploring a Function Closure
######################################################################################################
ls(environment(cube)) #gives what's in a function enviornment
get("n",environment(cube)) #gets value of n in the specified enviornment

######################################################################################################
# Optimization
######################################################################################################
