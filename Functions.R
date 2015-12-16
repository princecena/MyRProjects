columnmean <- function(y,removeNA =TRUE) {
  nc <- ncol(y)
  means <- numeric(nc)
  for(i in 1:nc) {
    means[i] <- mean(y[,i], na.rm = removeNA)
  }
  means #By default, the last command of the function is returned
}

##########################################################################################################
#Examples 
##########################################################################################################
#The following two function calls are equivalent:
#lm(data = mydata y ~ x,model = FALSE, 1:100)
#lm(y ~ x,mydata ,1:100,model = FALSE)

##########################################################################################################
#Arguments Matching 
##########################################################################################################
#Function arguments cal also be partially matched, which is useful for interactive work. The order of
#operations when given an argument is:
#1. Check for exact match for a named argument
#2. Check for a partial match
#3. Check for a positional match

##########################################################################################################
#Lazy Evaluation
##########################################################################################################
#Arguments to functions are evaluated lazily , so they are evaluated only as needed

f <- function(a,b) {
  a^2
}
f(2)

#In the above function , the function never uses the argument b, so calling f(2) will not produce an error
#because the 2 gets positionally matched to a.