##########################################################################################################
#Matrices 
##########################################################################################################
m <- matrix(1:6,nrow = 2,ncol = 3)
dim(m)
attributes(m)

#Another way to create a matrix
m <- 1:10
dim(m) <- c(2,5)

m <- matrix(1:4,nrow = 2,ncol = 2)
dimnames(m) <- list(c("a","b"),c("c","d"))

#cbind-ing and rbind-ing 
x <- c(1:3)
y <- 10:12
cbind(x,y)
rbind(x,y)

##########################################################################################################
#Names 
##########################################################################################################
x <- 1:3
names(x) <- c("foo","bar","norf")

##########################################################################################################
#Examples 
##########################################################################################################

# Construction of a matrix with 3 rows that contain the numbers 1 up to 9
matrix(1:9, byrow = FALSE, nrow = 3)

# Box office Star Wars: In Millions!
# The first element: US, the second element: Non-US 
new_hope <- c(460.998, 314.4)
empire_strikes <- c(290.475, 247.900)
return_jedi <- c(309.306, 165.8)
total <- c(1000, 1000,500)
c(new_hope,empire_strikes,return_jedi)

# Add your code below to Construct matrix
star_wars_matrix <- matrix(c(new_hope,empire_strikes,return_jedi),byrow=TRUE,nrow=3)

# Add your code here such that rows and columns of star_wars_matrix have a name!
rownames(star_wars_matrix) <- c("A New Hope","The Empire Strikes Back","Return of the Jedi")
colnames(star_wars_matrix) <- c("US","non-US")
star_wars_matrix


# Box office Star Wars: In Millions (!) 
# Construct matrix 
box_office_all <- c(461, 314.4, 290.5, 247.9, 309.3, 165.8)
movie_names <- c("A New Hope","The Empire Strikes Back","Return of the Jedi")
col_titles <- c("US","non-US")
star_wars_matrix <- matrix(box_office_all, nrow=3, byrow = TRUE, dimnames = list(movie_names, col_titles))
star_wars_matrix
# Your code here
worldwide_vector <- rowSums(star_wars_matrix)
class(worldwide_vector)
worldwide_vector

# Bind the new variable worldwide_vector as a column to star_wars_matrix
all_wars_matrix <- cbind(star_wars_matrix,worldwide_vector)
all_wars_matrix


# Print the star_wars_matrix to the console
star_wars_matrix 
rowSums(star_wars_matrix)[2]
# Average non-US revenue per movie
non_us_all  <-  sum(star_wars_matrix[,2])/3
non_us_all

# Average non-US revenue of first two movies
non_us_some <-  sum(star_wars_matrix[1:2,2])/2
non_us_some

# Estimation of visitors
ticket_prices_matrix <- matrix(c(5, 5, 6, 6, 7, 7), nrow = 3, byrow = TRUE, dimnames = list(movie_names, col_titles)) 
visitors <- star_wars_matrix / ticket_prices_matrix
visitors

# Average number of US visitors
average_us_visitors <- sum(visitors[,1])/3

# Average number of non-US visitors
average_non_us_visitors <- sum(visitors[,2])/3