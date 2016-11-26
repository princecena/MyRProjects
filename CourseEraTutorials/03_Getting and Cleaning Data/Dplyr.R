# Dplyr aims to provide a function for each basic verb of data manipulation:
#   
# filter() (and slice())
# arrange()
# select() (and rename())
# distinct()
# mutate() (and transmute())
# summarise()
# sample_n() (and sample_frac())

library(nycflights13)
dim(flights)
head(flights)

################################################################################################
# filter() (and slice())
################################################################################################

# Filter rows with filter()
# filter() allows you to select a subset of rows in a data frame. The first argument is the name of the data frame. The second and subsequent arguments are the expressions that filter the data frame:
# For example, we can select all flights on January 1st with:
filter(flights, month == 1, day == 1)
#This is equivalent to the more verbose code in base R:
flights[flights$month == 1 & flights$day == 1, ]

#filter() works similarly to subset() except that you can give it any number of filtering 
# conditions, which are joined together with & (not && which is easy to do accidentally!). 
# You can also use other boolean operators:
  
filter(flights, month == 1 | month == 2)

#To select rows by position, use slice():
  
slice(flights, 1:10)

################################################################################################
# arrange
################################################################################################
# arrange() works similarly to filter() except that instead of filtering or selecting rows, 
# it reorders them. It takes a data frame, and a set of column names (or more complicated expressions)
# to order by. 
# If you provide more than one column name, each additional column will be used to break ties 
# in the values of preceding columns:

arrange(flights, year, month, day)

#Use desc() to order a column in descending order:
arrange(flights, desc(arr_delay))

# dplyr::arrange() works the same way as plyr::arrange(). 
# It’s a straightforward wrapper around order() that requires less typing. 
# The previous code is equivalent to:
  
flights[order(flights$year, flights$month, flights$day), ]
flights[order(flights$arr_delay, decreasing = TRUE), ]
flights[order(-flights$arr_delay), ]

################################################################################################
# select
################################################################################################
# Often you work with large datasets with many columns but only a few are actually of 
# interest to you. select() allows you to rapidly zoom in on a useful subset using 
# operations that usually only work on numeric variable positions:

select(flights, year, month, day)

# Select all columns between year and day (inclusive)
select(flights, year:day)

# Select all columns except those from year to day (inclusive)
select(flights, -(year:day))

# This function works similarly to the select argument in base::subset(). Because the dplyr philosophy is to have small functions that do one thing well, it’s its own function in dplyr.

# There are a number of helper functions you can use within select(), like starts_with(), ends_with(), matches() and contains(). These let you quickly match larger blocks of variables that meet some criterion. See ?select for more details.
# 
# You can rename variables with select() by using named arguments:
#   
select(flights, tail_num = tailnum)
select(flights, year:day,contains("dep"),contains("arr"))

# But because select() drops all the variables not explicitly mentioned, it’s not that useful. Instead, use rename():
  
rename(flights, tail_num = tailnum)

# Extract distinct (unique) rows
# Use distinct()to find unique values in a table:
distinct(flights, tailnum) #(This is very similar to base::unique() but should be much faster.)
distinct(flights, origin, dest)

###############################################################################################
# mutate
###############################################################################################
# Add new columns with mutate()
# 
# Besides selecting sets of existing columns, it’s often useful to add new columns that are functions of existing columns. This is the job of mutate():

mutate(flights,
       gain = arr_delay - dep_delay,
       speed = distance / air_time * 60)

# dplyr::mutate() works the same way as plyr::mutate() and similarly to base::transform(). The key difference between mutate() and transform() is that mutate allows you to refer to columns that you’ve just created:

mutate(flights,
       gain = arr_delay - dep_delay,
       gain_per_hour = gain / (air_time / 60)
)

transform(flights,
          gain = arr_delay - delay,
          gain_per_hour = gain / (air_time / 60) #> Error: object 'gain' not found
)

#If you only want to keep the new variables, use transmute():
  
transmute(flights,
          gain = arr_delay - dep_delay,
          gain_per_hour = gain / (air_time / 60)
)

###############################################################################################
# summarise
###############################################################################################
#Summarise values with summarise()

# The last verb is summarise(). It collapses a data frame to a single row (this is exactly equivalent to plyr::summarise()):
  
summarise(flights,
          delay = mean(dep_delay, na.rm = TRUE))


###############################################################################################
# sample_n() (and sample_frac())
###############################################################################################
# Randomly sample rows with sample_n() and sample_frac()
# 
# You can use sample_n() and sample_frac() to take a random sample of rows: use sample_n() for a fixed number and sample_frac() for a fixed fraction.

sample_n(flights, 10)

sample_frac(flights, 0.01)

# Use replace = TRUE to perform a bootstrap sample. If needed, you can weight the sample with the weight argument.

###############################################################################################
# Grouped operations
###############################################################################################

# These verbs are useful on their own, but they become really powerful when you apply them to groups of observations within a dataset. In dplyr, you do this by with the group_by() function. It breaks down a dataset into specified groups of rows. When you then apply the verbs above on the resulting object they’ll be automatically applied “by group”. Most importantly, all this is achieved by using the same exact syntax you’d use with an ungrouped object.
# 
# Grouping affects the verbs as follows:
#   
#   grouped select() is the same as ungrouped select(), except that grouping variables are always retained.
# 
#   grouped arrange() orders first by the grouping variables
# 
#   mutate() and filter() are most useful in conjunction with window functions (like rank(), or min(x) == x). They are described in detail in vignette("window-functions").
# 
#   sample_n() and sample_frac() sample the specified number/fraction of rows in each group.
# 
#   slice() extracts rows within each group.
# 
#   summarise() is powerful and easy to understand, as described in more detail below.

# In the following example, we split the complete dataset into individual planes and then summarise each plane by counting the number of flights (count = n()) and computing the average distance (dist = mean(Distance, na.rm = TRUE)) and arrival delay (delay = mean(ArrDelay, na.rm = TRUE)). We then use ggplot2 to display the output.

by_tailnum <- group_by(flights, tailnum)
delay <- summarise(by_tailnum,
                   count = n(),
                   dist = mean(distance, na.rm = TRUE),
                   delay = mean(arr_delay, na.rm = TRUE))
delay <- filter(delay, count > 20, dist < 2000)

# Interestingly, the average delay is only slightly related to the
# average distance flown by a plane.
ggplot(delay, aes(dist, delay)) +
  geom_point(aes(size = count), alpha = 1/2) +
  geom_smooth() +
  scale_size_area()

# You use summarise() with aggregate functions, which take a vector of values and return a single number. There are many useful examples of such functions in base R like min(), max(), mean(), sum(), sd(), median(), and IQR(). dplyr provides a handful of others:
#   
# n(): the number of observations in the current group
# 
# n_distinct(x):the number of unique values in x.
# 
# first(x), last(x) and nth(x, n) - these work similarly to x[1], x[length(x)], and x[n] but give you more control over the result if the value is missing.

# For example, we could use these to find the number of planes and the number of flights that go to each possible destination:
  
  destinations <- group_by(flights, dest)
summarise(destinations,
          planes = n_distinct(tailnum),
          flights = n()
)

# When you group by multiple variables, each summary peels off one level of the grouping. That makes it easy to progressively roll-up a dataset:
  
daily <- group_by(flights, year, month, day)
per_day   <- summarise(daily, flights = n())
  
per_month <- summarise(per_day, flights = sum(flights))

per_year  <- summarise(per_month, flights = sum(flights))

# However you need to be careful when progressively rolling up summaries like this: it’s ok for sums and counts, but you need to think about weighting for means and variances (it’s not possible to do this exactly for medians).

###############################################################################################
# Chaining
###############################################################################################

# The dplyr API is functional in the sense that function calls don’t have side-effects. You must always save their results. This doesn’t lead to particularly elegant code, especially if you want to do many operations at once. You either have to do it step-by-step:
  
  a1 <- group_by(flights, year, month, day)
a2 <- select(a1, arr_delay, dep_delay)
a3 <- summarise(a2,
                arr = mean(arr_delay, na.rm = TRUE),
                dep = mean(dep_delay, na.rm = TRUE))
a4 <- filter(a3, arr > 30 | dep > 30)

# dplyr provides the %>% operator. x %>% f(y) turns into f(x, y) so you can use it to rewrite multiple operations that you can read left-to-right, top-to-bottom:
  
  flights %>%
  group_by(year, month, day) %>%
  select(arr_delay, dep_delay) %>%
  summarise(
    arr = mean(arr_delay, na.rm = TRUE),
    dep = mean(dep_delay, na.rm = TRUE)
  ) %>%
  filter(arr > 30 | dep > 30)
  
# for each day of the year, count the total number of flights and sort in descending order
flights %>%
  group_by(month, day) %>%
  summarise(flight_count = n()) %>%
  arrange(desc(flight_count))

# rewrite more simply with the `tally` function
flights %>%
  group_by(Month, DayofMonth) %>%
  tally(sort = TRUE)

#Grouping can sometimes be useful without summarising
# for each destination, show the number of cancelled and not cancelled flights
flights %>%
  group_by(dest) %>%
  select(month) %>%
  table() %>%
  head()
###############################################################################################
# summarise_each
###############################################################################################
#summarise_each allows you to apply the same summary function to multiple columns at once
#Note: mutate_each is also available
  
# for each carrier, calculate the percentage of flights cancelled or diverted
flights %>%
  group_by(carrier) %>%
  summarise_each(funs(mean), origin, dest)

# for each carrier, calculate the minimum and maximum arrival and departure delays
flights %>%
  group_by(carrier) %>%
  summarise_each(funs(min(., na.rm=TRUE), max(., na.rm=TRUE)), matches("Delay"))

###############################################################################################
# Window Functions
###############################################################################################
# Aggregation function (like mean) takes n inputs and returns 1 value
# Window function takes n inputs and returns n values
# Includes ranking and ordering functions (like min_rank), offset functions (lead and lag), and cumulative aggregates (like cummean).

# for each carrier, calculate which two days of the year they had their longest departure delays
# note: smallest (not largest) value is ranked as 1, so you have to use `desc` to rank by largest value
flights %>%
  group_by(UniqueCarrier) %>%
  select(Month, DayofMonth, DepDelay) %>%
  filter(min_rank(desc(DepDelay)) <= 2) %>%
  arrange(UniqueCarrier, desc(DepDelay))

# rewrite more simply with the `top_n` function
flights %>%
  group_by(UniqueCarrier) %>%
  select(Month, DayofMonth, DepDelay) %>%
  top_n(2) %>%
  arrange(UniqueCarrier, desc(DepDelay))


# for each month, calculate the number of flights and the change from the previous month
flights %>%
  group_by(Month) %>%
  summarise(flight_count = n()) %>%
  mutate(change = flight_count - lag(flight_count))


# rewrite more simply with the `tally` function
flights %>%
  group_by(Month) %>%
  tally() %>%
  mutate(change = n - lag(n))

# dplyr approach: better formatting, and adapts to your screen width
glimpse(flights)

###############################################################################################
# Connecting to Databases
###############################################################################################

# dplyr can connect to a database as if the data was loaded into a data frame
# Use the same syntax for local data frames and databases
# Only generates SELECT statements
# Currently supports SQLite, PostgreSQL/Redshift, MySQL/MariaDB, BigQuery, MonetDB
# Example below is based upon an SQLite database containing the hflights data

# connect to an SQLite database containing the hflights data
my_db <- src_sqlite("my_db.sqlite3")

# connect to the "hflights" table in that database
flights_tbl <- tbl(my_db, "hflights")

# example query with our data frame
flights %>%
  select(UniqueCarrier, DepDelay) %>%
  arrange(desc(DepDelay))

# identical query using the database
flights_tbl %>%
  select(UniqueCarrier, DepDelay) %>%
  arrange(desc(DepDelay))

# You can write the SQL commands yourself
# dplyr can tell you the SQL it plans to run and the query execution plan

# send SQL commands to the database
tbl(my_db, sql("SELECT * FROM hflights LIMIT 100"))

# ask dplyr for the SQL commands
flights_tbl %>%
  select(UniqueCarrier, DepDelay) %>%
  arrange(desc(DepDelay)) %>%
  explain()