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
# 1,500,000 # 120 * 8/numeric
# = 1440000000 bytes
# = 1440000000/ 2^20 bytes/MB
# = 1,373.29 MB
# = 1.34 GB

# R will require almost double memory for loading the above dataset.

########################################################################################################
# Textual formats - dump() and dput()
########################################################################################################



