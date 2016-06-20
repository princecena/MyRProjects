######################################################################################################
# Symbol Binding
######################################################################################################
# How does R know which value to assign to which symbol?
lm <- function(x) {
  x * x
}
# When R tries to bind a value to a symbol, it searches through a series of environments to find the 
# appropriate value. When you are working on the command line and need to retrieve the value of an R 
# object , the order is roughly:
# 1. Search the global environment for a symbol matching the one requested
# 2. Search the namespaces of each of the packages on the search list(search list using search() function)

-----------------------------
# Binding Values to Symbol
-----------------------------
  # The global environment or the user's workspace is always the first element of the search list and the
  # base package is always the last.
  
  # The order of the package on the search list matters!
  
  # User's can configure which packages get loaded on start up so you cannot assume that there will be
  # a list of packages available.
  
  # When a user loads a package with library, the namespace of that package gets put in position 2 of the 
  # search list(by default) and everything else gets shifted down the list.
  
  # Note that R has seperate namespaces for functions and non-functions so it's possible to have an object
  # named c and a function named c.

-----------------------------
# What is an environment?
-----------------------------
  # An environment is a collection of (symbol, values) pairs, i.e., x is a symbol and 3.14 might be its value
    
  # Every environment has a parent environment, it is possible for an environment to have multiple "children"
     
  # the only environment without a parent is the empty environment
  
  # A function + an environment = a closue or function closure
  
-----------------------------------------------------------------
# Lexical Scoping - Searching  for the value of a free variable
-----------------------------------------------------------------
# If the values of a symbol is not found in the environment in which the function was defined, then the
# search is continued in the parent environment
  
# The search continues down the sequence of parent environments until we hit the top-level environment;
# this usually the global environment(workspace) or the namespace of the package
  
# After the top-level environment, the search continues down the search list until we hit the empty environment.
# If a value for a given symbol cannot be found once the empty environment is arrived at, then an error is thrown.

######################################################################################################
# R Scoping Rules
######################################################################################################
#R uses lexical or static scoping which decides how a value is associated with a free variable in a function
#Lexical scoping in R means that the values of free variables are searched for in the environment in which the function was defined.

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
