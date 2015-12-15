##########################################################################################################
#Vectors 
##########################################################################################################
numericVector <- c(0.5,0.6)
logicalVector <- c(TRUE,FALSE,T,F)
characterVector <- c("a","b","c")
integerVector <- 9:29
complexVector <- c(1+2i, 3+4i)

#Using vector() function
sampleVector <- vector("numeric",length = 10)

#Mixing objects- Impilicit Coercion
x <- c(1.7,"a")
y <- c(TRUE,2)
y <- c("a",TRUE)

#Explicit Coercion
x <- 0:6
class(x)
as.numeric(x)
as.logical(x)
as.character(x)

#Nonsensical coercion results in NaS
x <- c("a","b","c")
as.numeric(x)
as.logical(x)
as.complex(x)

##########################################################################################################
#Examples 
##########################################################################################################

# Poker winnings from Monday to Friday
poker_vector <- c(140, -50, 20, -120, 240)

# Roulette winnings from Monday to Friday
roulette_vector <- c(-24, -50, 100, -350, 10)

# Give names to both 'poker_vector' and 'roulette_vector'
days_vector <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
names(poker_vector) <- days_vector
names(roulette_vector) <- days_vector

# Total winnings with poker
total_poker <- sum(poker_vector)

# Up to you now:
total_roulette <- sum(roulette_vector)
total_week <- total_poker  +  total_roulette
total_week

# Check if you realized higher total gains in poker than in roulette 
answer <- total_poker >  total_roulette
answer

# Define a new variable based on a selection
poker_wednesday <- poker_vector[3]
poker_midweek <- poker_vector[c(2,3,4)]
roulette_selection_vector <- roulette_vector[2:5]

average_midweek_gain <- mean(poker_vector[c("Monday","Tuesday","Wednesday")])
average_midweek_gain

# What days of the week did you make money on poker?
selection_poker_vector <- poker_vector > 0
selection_poker_vector

# Select from poker_vector these days
poker_winning_days <- poker_vector[selection_poker_vector]
poker_winning_days

# What days of the week did you make money on roulette?
selection_roulette_vector <- roulette_vector > 0
selection_roulette_vector
# Select from roulette_vector these days
roulette_winning_days <-  roulette_vector[selection_roulette_vector]
roulette_winning_days
