gender_vector <- c("Male", "Female", "Female", "Male", "Male")

# Define factor_gender_vector using 'factor()'
factor_gender_vector <- factor(gender_vector)
factor_gender_vector

animals_vector <- c("Elephant", "Giraffe", "Donkey", "Horse")
temperature_vector <- c("High", "Low", "High","Low", "Medium")

factor_animals_vector <- factor(animals_vector)
factor_animals_vector
factor_temperature_vector <- factor(temperature_vector, order = TRUE, levels = c("Low", "Medium", "High"))
factor_temperature_vector


survey_vector <- c("M", "F", "F", "M", "M")
# Encode survey_vector as a factor
factor_survey_vector <- factor(survey_vector)
# Specify the levels of 'factor_survey_vector'
levels(factor_survey_vector) <- c("Female","Male")
factor_survey_vector


# Type your code here for 'survey_vector'
summary(survey_vector)

# Type your code here for 'factor_survey_vector'
summary(factor_survey_vector)


# Create 'speed_vector'
speed_vector <- c("Fast", "Slow", "Slow", "Fast", "Ultra-fast") 

# Add your code below
factor_speed_vector <-  factor(speed_vector, ordered = TRUE, levels = c("Slow","Fast","Ultra-fast"))

# Print
factor_speed_vector

# R prints automagically in the right order
summary(factor_speed_vector) 

# Your code below
compare_them <- factor_speed_vector[2]>factor_speed_vector[5]

# Is data analyst 2 faster than data analyst 5?
compare_them



