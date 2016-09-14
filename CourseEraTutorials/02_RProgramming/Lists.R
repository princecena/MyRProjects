##########################################################################################################
#Lists 
##########################################################################################################
x <- list(1,"a",TRUE,1+4i)


##########################################################################################################
#Examples 
##########################################################################################################
# Vector with numerics from 1 up to 10
my_vector <- 1:10 
# Matrix with numerics from 1 up to 9
my_matrix <- matrix(1:9, ncol = 3)
# First 10 elements of the built-in data frame 'mtcars'
my_df <- mtcars[1:10,]

# Construct list with these different elements:
my_list <- list("my_vector" = my_vector,"my_matrix" = my_matrix,"my_df" = my_df)

# Print 'my_list' to the console
names(my_list) <- c("vec","mat","df")
my_list

# Create the list 'shining_list'
shining_list <- list("moviename" = "The Shining", "actors" = actors, "reviews" = reviews)
shining_list

# Define 'last_actor'
last_actor <- shining_list[["actors"]][5]

# Define 'second_review'
second_review <- shining_list[["reviews"]][2,]


# We forgot something; add the year to shining_list
shining_list_full <- c(shining_list, "year"=1980)

# Have a look at shining_list_full
str(shining_list_full)