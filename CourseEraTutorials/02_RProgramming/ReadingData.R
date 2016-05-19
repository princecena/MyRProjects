########################################################################################################
# Functions for reading data
########################################################################################################
# read.csv, read.table ,for reading tabular data
# read.lines, for reading lines of a text file
# source, for reading in R code files(inverse of dump)
# dget, for reading in R code files(inverse of dput)
# load, for reading in saved workspaces
# unserialize, for reading single R objects in binary form

########################################################################################################
# Functions for writing data
########################################################################################################
# write.table()
# writeLines()
# dump()
# dput()
# save()
# serialize()

########################################################################################################
# Reading in Larger datasets with read.table
########################################################################################################
# Use the colClasses argument.Sepcifying this option instead of using the default can make 'read.table'
# run MUCh faster, often twice as fast as R first finds classes for each column.
# Setting rnow does not make R run faster but it helps with memory usage. 

initial <- read.table("datatable.txt",nrows = 100)
classes <- sapply(initial,class)
tabAll <- read.table("datatable.txt",colClasses = classes)

########################################################################################################
# Know Thy System
########################################################################################################
# When working with large datasets ,it's useful to know a few things about your system.
# Calcluating memory requirements- If I have a dataframe with 1,500,000 rows and 120 columns, all of
# which are numeric data.
# 1,500,000 # 120 * 8 bytes/numeric
# = 1440000000 bytes
# = 1440000000/ 2^20 bytes/MB
# = 1,373.29 MB
# = 1.34 GB

# R will require almost double memory for loading the above dataset.

########################################################################################################
# Textual formats - dump() and dput()
########################################################################################################

# It is a way to read and write R Objects.So,
# the dput function takes an arbitrary R object, 
# and it will, use, it will take most types of R objects except for some more exotic ones, 
# and it will create some R code that will essentially reconstruct the object in R.
# You can dput the file to a file and then later on, you can read it into R using dget, 
# and when you dget the object, you will get this object and you will see that it's, 
# you have kind of reconstructed the object from before. So the dput function, 
# essentially writes R code, which can be used to reconstruct an R object. 
# When you dput, you can dget
y <- data.frame(a = 1, b = "a")
dput(y)
dput(y, file = "y.R")
new.y <- dget("y.R")
new.y

#Multiple objects can be deparsed using the dump function and read back in using source.
# Dput wokrs on single object, but dump can be used with multiple R objects
# When you dump, you can source
x <- "foo"
y <- data.frame(a = 1, b = "a")
dump(c("x", "y"), file = "data.R")
rm(x, y)
source("data.R")
y
x

