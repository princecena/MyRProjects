###############################################################################################
# Loading the Data set
###############################################################################################
# Import the training set: train
train <- read.csv("Exercises/Titanic-Machine Learning from Disaster/train.csv")

# Import the testing set: test
test <- read.csv("Exercises/Titanic-Machine Learning from Disaster/test.csv")

# Print train and test to the console
train
test

###############################################################################################
# Rose vs Jack, or Female vs Male
###############################################################################################

# Your train and test set are still loaded
str(train)
str(test)

# Survival rates in absolute numbers
table(train$Survived)

# Survival rates in proportions
prop.table(table(train$Survived))

# Two-way comparison: Sex and Survived
table(train$Sex, train$Survived)

# Two-way comparison: row-wise proportions
prop.table(table(train$Sex, train$Survived),1)

###############################################################################################
# Does age play a role?
###############################################################################################
# Your train and test set are still loaded in
str(train)
str(test)

# Create the column child, and indicate whether child or no child
train$Child <- NA
train$Child[train$Age < 18] <- 1
train$Child[train$Age >= 18] <- 0

# Two-way comparison
prop.table(table(train$Child,train$Survived),1)

###############################################################################################
# Making your first predictions
###############################################################################################
# Your train and test set are still loaded in
str(train)
str(test)

# Copy of test
test_one <- test

# Initialize a Survived column to 0
test_one$Survived <- 0

# Set Survived to 1 if Sex equals "female"
test_one$Survived[test_one$Sex == "female"] <- 1

###############################################################################################
# Intro to decision trees
###############################################################################################
# Conceptually, the decision tree algorithm starts with all the data at the root node and scans all the variables for the best one to split on. Once a variable is chosen, you do the split and go down one level (or one node) and repeat. The final nodes at the bottom of the decision tree are known as terminal nodes, and the majority vote of the observations in that node determine how to predict for new observations that end up in that terminal node.


# Load in the R package
library(rpart)

###############################################################################################
# Creating your first decision tree
###############################################################################################
# Inside rpart, there is therpart() function to build your first decision tree. The function takes multiple arguments:
#   
# formula: specifying variable of interest, and the variables used for prediction (e.g. formula = Survived ~ Sex + Age).
# data: The data set to build the decision tree (here train).
# method: Type of prediction you want. We want to predict a categorical variable, so classification: method = "class".

# Your train and test set are still loaded in
str(train)
str(test)

# Build the decision tree
my_tree_two <- rpart(Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked, data = train, method = "class")

# Visualize the decision tree using plot() and text()
plot(my_tree_two)
text(my_tree_two)

# Load in the packages to build a fancy plot
library(rattle)
library(rpart.plot)
library(RColorBrewer)

# Time to plot your fancy tree
fancyRpartPlot(my_tree_two)

###############################################################################################
# Predict and submit to Kaggle
###############################################################################################

# Make predictions on the test set
my_prediction <- predict(my_tree_two, newdata = test, type = "class")

# Finish the data.frame() call
my_solution <- data.frame(PassengerId = test$PassengerId, Survived = my_prediction)

# Use nrow() on my_solution
nrow(my_solution)

# Finish the write.csv() call
write.csv(my_solution, file = "Exercises/Titanic-Machine Learning from Disaster/my_solution.csv", row.names = FALSE)


###############################################################################################
# Overfitting, the iceberg of decision trees
###############################################################################################
# If you submitted the solution of the previous exercise, you got a result that outperforms a solution using purely gender. Hurray!
#   
#   Maybe we can improve even more by making a more complex model? In rpart, the amount of detail is defined by two parameters:
#   
#   -cp determines when the splitting up of the decision tree stops.
#   -minsplit determines the minimum amount of observations in a leaf of the tree.

# Your train and test set are still loaded in

# Change this command
my_tree_three <- rpart(Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked,
                       data = train, method = "class", control = rpart.control(minsplit = 50, cp = 0))

# Visualize my_tree_three
fancyRpartPlot(my_tree_three)


###############################################################################################
# Re-engineering our Titanic data set
###############################################################################################
# Data Science is an art that benefits from a human element. Enter feature engineering: creatively engineering your own features by combining the different existing variables.
# 
# While feature engineering is a discipline in itself, too broad to be covered here in detail, let's have have a look at a simple example and create a new predictive attribute: family_size.
# 
# A valid assumption is that larger families need more time to get together on a sinking ship, and hence have less chance of surviving. Family size is determined by the variables SibSp and Parch, which indicate the number of family members a certain passenger is traveling with. So when doing feature engineering, you add a new variable family_size, which is the sum of SibSp and Parch plus one (the observation itself), to the test and train set.

# train and test are available

# Create train_two
train_two <- train
train_two$family_size <- train_two$SibSp + train_two$Parch + 1

# Finish the command
my_tree_four <- rpart(Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked + family_size,
                      data = train_two, method = "class")

# Visualize your new decision tree
fancyRpartPlot(my_tree_four)

###############################################################################################
# Passenger Title and survival rate
###############################################################################################
# Was it coincidence that upper-class Rose survived and third-class passenger Jack not? Let's have a look...
# 
# You have access to a new train and test set named train_new and test_new. These data sets contain a new column with the name Title (referring to Miss, Mr, etc.). Title is another example of feature engineering: it's a new variable that possibly improves the model.

train <- read.csv("Exercises/Titanic-Machine Learning from Disaster/train_new.csv")
test <- read.csv("Exercises/Titanic-Machine Learning from Disaster/test_new.csv")
# train_new and test_new are available in the workspace

# Finish the command
my_tree_five <- rpart(Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked + Title,
                      data = train_new, method = "class")

# Visualize my_tree_five
fancyRpartPlot(my_tree_five)

# Make prediction
my_prediction <- predict(my_tree_five, test_new, type = "class")

# Make results ready for submission
my_solution <- data.frame(PassengerId = test_new$PassengerId, Survived = my_prediction)
write.csv(my_solution, file = "Exercises/Titanic-Machine Learning from Disaster/my_solution.csv", row.names = FALSE)


