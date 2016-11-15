#Let's take a dataframe for example
mydata <- data.frame(x = 1:5)

#Since the variable x exists only in mydata, to transform x, I must somehow tell R it is stored in mydata. 
#The simplest way to do that is using dollar format: mydata$x. 
#I’ll make a copy of the data first so we can do the transformation several ways:

mydata.new <- mydata

mydata.new$x2 <- mydata.new$x  ^ 2
mydata.new$x3 <- mydata.new$x2 + 100

mydata.new


# That works, but I had to type more characters for the “mydata.new” part than I did for the transformation
# itself. let’s look at approaches that save us that trouble. One widely used approach is to use 
# the attach function. This function makes a copy of a data frame’s variables in a temporary area 
# that is attached to your search path as separate variables or vectors. 
# That’s nice because you can refer to them simply by their names like “x” instead of “mydata$x”. 
# However, the attach function is tricky to use. Here’s the most common mistake made by beginners.
##########################################################################################################
#attach Command 
##########################################################################################################
#The database is attached to the R search path
mydata.new <- mydata
attach(mydata.new)

mydata.new$x2 <- x  ^ 2
mydata.new$x3 <- x2 + 100

detach(mydata.new)

# The variable x2 got created and put into mydata.new. However, when the attempt to create x3 was run, 
# variable x2 could not be found. This is due to the fact that the attached version of the data is 
# a copy that was done in the past, it is not a live connection. 
# Therefore, to refer to simply “x2” you would have to attach mydata.new again. 
# You could also get around this problem by using dollar format in the second equation:
  
attach(mydata.new)

mydata.new$x2 <- x  ^ 2
mydata.new$x3 <- mydata.new$x2 + 100

mydata.new

##########################################################################################################
#detach Command 
##########################################################################################################
#Detach a database, i.e., remove it from the search() path of available R objects 
detach(mydata.new)

##########################################################################################################
#transform Command 
##########################################################################################################
# That worked in the above example, but having to keep track of when you do and don’t need dollar format 
# seems more trouble than it’s worth. In addition, the fact that attach actually makes 
# a copy of the data means that it wastes both time and memory.
# 
# The transform function lets you use short variable names on both sides of the equation, 
# and it does not need to make a copy of the data set. Let’s just square x to see how it works.

mydata.new <- transform(mydata, x2 = x ^ 2)
mydata.new

#However, the transform function has a problem: it is unable to use a variable that it just created.
mydata.new <- transform(mydata,x2 = x  ^ 2,x3 = x2 + 100)
##########################################################################################################
#mutate Command(in plyr package)
##########################################################################################################
#It’s very similar to the base transform function but it can use variables that it just created
library(plyr)

mydata.new <- mutate(mydata,x2 = x ^ 2,x3 = x2 + 100)
mydata.new 

# However, mutate does have a limitation: it cannot re-create a variable that it just created. 
# So you can use its new variables only on the right-hand side of your equations. 
# In this next example, rather than create x3, I’ll continue to use the name x2:
  
mydata.new <- mutate(mydata,x2 = x  ^ 2, x2 = x2 + 100)
mydata.new

##########################################################################################################
#within Command 
##########################################################################################################
# Finally, we come to the within function. It uses variables by their short names, 
# saves new variables inside the data frame using short names, 
# and it allows you to use new variables anywhere in calculations

mydata.new <- within(mydata, {
                x2 <- x  ^ 2
                x3 <- x2 + 100 
    } )

mydata.new


#When I reuse the variable name x2 rather than create a new variable, x3, I still get the right answer:
  
mydata.new <- within(mydata, {
                   x2 <- x  ^ 2
                   x2 <- x2 + 100} )

mydata.new

##########################################################################################################
#subset Command 
##########################################################################################################
#Return subsets of vectors, matrices or data frames which meet conditions.
subset(airquality, Temp > 80, select = c(Ozone, Temp))
subset(airquality, Day == 1, select = -Temp)
subset(airquality, select = Ozone:Wind)

with(airquality, subset(Ozone, Temp > 80))

##########################################################################################################
#with Command 
##########################################################################################################
#Value Returned:

#For with, the value of the evaluated expr. For within, the modified object.Try below on command line:
df <- data.frame(a=1:5,b=2:6)
with(df, {c <- a + b; df;} )
within(df, {c <- a + b; df;} )

#########################################################################################################
#paste Command 
#########################################################################################################
#Concatenate vectors after converting to character.

# paste converts its arguments (via as.character) to character strings, and concatenates them 
# (separating them by the string given by sep). If the arguments are vectors, 
# they are concatenated term-by-term to give a character vector result. 
# Vector arguments are recycled as needed, with zero-length arguments being recycled to "".

paste(1:12)

#two agruments:
  
#sep: concatenate the strings with this as seperator
#collapse: used when there are two or more vectors to combine and we want the result to be a single string

#########################################################################################################
#aggregate Command 
#########################################################################################################
aggregate(Ozone ~ Month, data = airquality, mean)
aggregate(cbind(Ozone, Temp) ~ Month, data = airquality, mean)


