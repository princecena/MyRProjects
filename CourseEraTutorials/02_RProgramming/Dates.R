######################################################################################################
# Dates and Times
######################################################################################################

##R has developed a special representation of dates and times:
  
    #Dates are represented by the Date class
  
    #Times are represented by the POSIXct or the POSIXlt class
  
    #Dates are stored internally as the number of days since 1970-01-01
  
    #Times are stored internally as the number of seconds since 1970-01-01

x <- as.Date("1970-01-01")
unclass(x)

#Times are represented using the POSIXct or the POSIXlt class:

    #POSIXct is just a very large integer under the hood; it use a useful class when you want to store
    # times in something like a data frame
    
    #POSIXlt is a list underneath and it stores a bunch of other useful information like the day of the
    # week, day of the year, month, day of the month

#There are a number of generic functions that work on dates and times:

    #weekdays: give the day of the week
    
    #months: give the month name
    
    #quarters: give the quarter number (“Q1”, “Q2”, “Q3”, or “Q4”)

x <- Sys.time() #creates a PosixCt object
x
p <- as.POSIXlt(x)
names(unclass(p))
p$sec


x <- Sys.time()
x ## Already in ‘POSIXct’ format
## [1] "2013-01-24 22:04:14 EST"
unclass(x)
## [1] 1359083054
x$sec
## Error: $ operator is invalid for atomic vectors
p <- as.POSIXlt(x)
p$sec
## [1] 14.37

#Finally, there is the strptime function in case your dates are written in a different format
datestring <- c("January 10, 2012 10:40", "December 9, 2011 9:10")
x <- strptime(datestring, "%B %d, %Y %H:%M")
x
class(x) #returns a POSIXlt object


x <- as.Date("2012-01-01")
y <- strptime("9 Jan 2011 11:34:21", "%d %b %Y %H:%M:%S")
x-y
## Warning: Incompatible methods ("-.Date",
## "-.POSIXt") for "-"
## Error: non-numeric argument to binary operator
x <- as.POSIXlt(x)
x-y
## Time difference of 356.3 days


x <- as.Date("2012-03-01") y <- as.Date("2012-02-28")
x-y
## Time difference of 2 days
x <- as.POSIXct("2012-10-25 01:00:00")
y <- as.POSIXct("2012-10-25 06:00:00", tz = "GMT")
y-x
## Time difference of 1 hours

