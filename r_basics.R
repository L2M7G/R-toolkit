##### Notes on the basics of R code #####

#### The following section is based on Data Camp's Into to R ####
### Data Types ###

# Check data type
class(variable)
typeof(variable)
str(variable)      # commonly used and helpful (structure and contents, use to inspect data)

# Change data type
as.integer(variable)
as.numeric(variable)
as.character(variable)
as.logical(variable)
as.factor(variable)


### Vectors ###

# Create a vector
x <- c(1, 2, 3)

# Name elements
names(x) <- c("a", "b", "c")

# Add vectors
total_vector <- A_vector + B_vector   # A_vector <- c(1, 2, 3) B_vector <- c(4, 5, 6)  == total_vector c(5, 7, 9)

# Sum a vector
sum_vector <- sum(vector_name)    # if sum vector = c(1,2,3,4,5), sum vector = 15

# Subset/Select elements
select_vector <- vector_name[1] or [c(2,4,6)] or [2:5]
x[x > 1]


### Matrices ###

# Construct a matrix that contains the numbers 1-9, filled by the rows, with 3 rows
matrix(1:9, byrow = TRUE, nrow = 3)

# Construct a Matrix using vectors
box_office <- c(80, 30, 55, 65, 80, 75)
region <- c("US", "non-US")
titles <- c("Title 1", 
            "Title 2", 
            "Title 3")

matrix_name <- matrix(box_office, 
                           nrow = 3, byrow = TRUE,
                           dimnames = list(titles, region))

# Column and row names
name_column <- c("name", "name", ...)
name_row <- c("name", "name", ...)
colnames(matrix_name) <- name_column
rownames(matrix_name) <- name_row

# Total Each Row
rowSums(matrix_name)

# Add column(s) to matrix
new_matrix_name <- cbind(matrix1, matrix2, vector1, ...)

# Add raw(s)
new_matrix_name <- rbind(matrix1, matrix2, ...)

# Totals
colSums(matrix_name)
rowSums(matrix_name)

# Subset/Select elements [row,column]
matrix_name[1,2]
matrix_name[1:5,7]
matrix_name[,2]   # all rows, column 2

# Can use +, -, /, *


### Factors ###
# Categorical Variables, ordinal (age ranges) or nominal (gender)
factor(x)
factor(x, ordered = TRUE)

# example specifying ordinal variables
height_vector <- c("Tall", "Short", "Average","Short", "Tall")
factor_height_vector <- factor(height_vector, order = TRUE, levels = c("Short", "Average", "Tall"))

# Factor levels automatically assigned alphabetically unless specified
levels(height_vector) <- c("Bottom", "Middle", "Top")

# Compare with ordered factors (< or >)


### Data Frames ###

head(data_frame_name)
str(data_frame_name)     #view struture of data set - good place to start with new data

# Construct a data frame - define the vectors and pass as arguments to data.frame
name <- c("name1", "name2", ...)
age <- c("age1", "age2", ...)
data_frame_name <- data.frame(name, age, ...)

# Select values [row, column]
data_frame_name[2,]     # row 2, all columns
data_frame_name[, "variable_name"]    # all rows for column "variable_name"
vector_name <- data_frame_name$variable_name    # select a column variable_name and save as a vector
subset(data_frame_name, subset = age <20)   # subset based on criteria

# Order 
x <- c(4,3,7,2,9)
order(x)
x[order(x)]   # output will look like 2,3,4,7,9

# Rearrange data frame in order
positions <- order(data_frame_name$age)  # use as a row index
date_frame_name[positions,]



### Lists ###
# Can gather vectors, matrices, data frame, etc. under one name

# Create list
list_name <- list(vector_name, matrix_name, dataframe_name)

# Add names to list items
names(list_name) <- c("vector", "Matrix", "Data")

# Assign names when creating list
list_name <- list(vector = vector_name, maxtrix = matrix_name, data = dataframe_name)

# Select elements
my_list[1]  # select first element in the list
my_list[[1]][1]   # select the first component from the first element
my_list[["name"]]  # select the name element from the list
my_list$name   # select the name element from the list

#### End of Intro to R ####




#### The following section is based on Data Camp's Intermediate R

### Conditionals and Control FLow ###

## Relational Operators (==, !=, <, >, <=, >=)
# Greater than relationships determined alphabetically for strings

# Can use on vectors
vector_name <- c(3,5,7,9)
vector < 6     # will return TRUE, TRUE, FALSE, FALSE - check each component

# Can compare vectors
new_vector_name <- c(8,6,4,2)
new_vector_name >= vector_name     # will return TRUE, TRUE, FALSE, FALSE - compare every element of the vectors

# Operators also work for matrices 


## Logical Operators   (&, | (or), ! (not))

TRUE & TRUE # returns TRUE
TRUE & FALSE # returns FALSE

TRUE | TRUE # returns TRUE
TRUE | FALSE # returns TRUE
FALSE | FALSE # returns FALSE

!TRUE # returns FALSE
!FALSE # returns TRUE

x <- 10
x > 6 & x < 14 # returns TRUE - cannot do 6 < x < 14

y <- 10
y < 12 | y > 15 # return TRUE
y < 8 | y > 17 # return FALSE

# Vectors 
c(TRUE, FALSE, TRUE) & c(FALSE, FALSE, TRUE) # returns FALSE, FALSE, TRUE
c(TRUE, FALSE, TRUE) | c(FALSE, FALSE, TRUE) # returns TRUE, FALSE, TRUE
!C(TRUE, FALSE, TRUE) # returns FALSE, TRUE, FALSE

c(TRUE, FALSE, TRUE) && c(FALSE, FALSE, TRUE) # returns FALSE
c(TRUE, FALSE, TRUE) || c(FALSE, FALSE, TRUE) # returns TRUE
# double operators only look at first component 


## Conditional Statements (if, else)

# if statements
if(condition) {
  action
}

x <- 7
if(x < 0) {
  print("x is a negative number")
}

# else statements
if(condition) {
  action1
} else{
  action2
}

x <- 7
if(x < 0) {
  print("x is a negative number")
} else {
  print("x is a positive number")
}

# else if statements
if(condition1) {
  action1
} else if(condition2) {
  action2
} else {
  action3
}

x <- 0
if(x < 0) {
  print("x is a negative number")
} else if(x == 0) {
  print("x is zero")
} else {
  print("x is a positive number")
}


### Loops ###

## While Loop (vs if, will continue running as long as condition is true)
while(condition) {
  action
}

age <- 0
while(age <= 10) {
  print(paste("age is reported as", age))
  age <- age + 1    # will increment the variable
}      # will print out statement starting at initial age until the condition, otherwise will print with initial value indefinitely, can also subtract values and set a condition for the minimum

age <- 100
while(age >= 40) {
  print(paste("Your age is", age))
  if (age >= 65){
    print(paste("at", age, "years old, you are a senior"))
    age <- age - 1
  } else {
    print(paste("at", age, "years old, you are middle aged"))
    age <- age - 1
  }
}

# to stop loop at a certain point add:
  if (age > 70) {
    break
  }

## For loops
for(variable_name in defined_sequence) {
  action
}

countries <- c("Canada", "USA", "Mexico", "Guatemala", "Belize", "Honduras", "Nicaragua", "Costa Rica", "Panama")

for (country in countries) {
  print(country)
}    # creates a separate print out for each object in the vector

# Can do the same for other structures

# Break statement
countries <- list("Canada", "USA", "Mexico", "Guatemala", "Belize", "Honduras", "Nicaragua", "Costa Rica", "Panama")

for (country in countries) {
  if(nchar(country) == 8) {
    break  
  }   # stop loop when get to a country name with 8 characters
  print(country)
} 

# next statement
countries <- list("Canada", "USA", "Mexico", "Guatemala", "Belize", "Honduras", "Nicaragua", "Costa Rica", "Panama")

for (country in countries) {
  if(nchar(country) == 9) {
    next  
  }   # skip any countries with 8 characters in name 
  print(country)
} 

# Alternative version
countries <- c("Canada", "USA", "Mexico", "Guatemala", "Belize", "Honduras", "Nicaragua", "Costa Rica", "Panama")

for (i in 1:length(countries)) {
  print(paste(countries[i], "is on position", i, "in the cities vector."))
} 

# Alternative version for lists (require [[]] instead of usual [])
countries <- list("Canada", "USA", "Mexico", "Guatemala", "Belize", "Honduras", "Nicaragua", "Costa Rica", "Panama")

for (i in 1:length(countries)) {
  print(paste(countries[[i]], "is on position", i, "in the cities vector."))
} 

# Nested lopp (for lopp inside a for loop)
for (variable1 in defined_sequence1) {
  for (variable2 in defined_sequence2) {
    action
  }
}

# For a Matrix
for (i in 1:nrow(matrix_name)) {   # i corresponds to the rows
  for (j in 1:ncol(matrix_name)) {   # j corresponds to the columns
    print(paste("On row", i, "and column", j, "the value is", matrix_name[i,j]))
  }
}

# if and else in for loops, can also add break and next 
for (ny in newyork) {
  if (ny > 20) {
    print("it is warm in New York today")
    break
  } else {
    print("it is cool today")
    next
    }
}



### Functions ###

# to see full arguments of a function without reading through help - args()
args(sd)

# for more detail
?sd
help(sd)

sd_results <- sd(c(3,5,2,8,1))
info <- c(3,5,2,8,1)
sd(info)
sd(x = info)

info_na <- c(3,5,2,8,1,NA)
sd(info_na, TRUE) # removes NA 

list()
print()

sd()
mean(a+b)
sample()
abs(a-b)
sum()
diff()


## Writing R functions

function_name <- function(argument1, argument2) {
  body
}

quadruple <- function(x) {
  x*4
}
quadruple(10)

# With return statements
quadruple <- function(x) {
  y <- x*4
  return(y)
}
quadruple(5)

math <- function(a, b) {
  a*(a+b)/b*(a-b)
}
math(4, 6)

math <- function(a, b = 1) {    # makes b optional by setting a default
  a*(a+b)/b*(a-b)
}
math(4)

math <- function(a, b = 1) {    # makes b optional by setting a default
  if (b == 0){
    return(0)      # guard fundtion by specifying return 0 if argument is 0,or else function returns inf
  }
    a*(a+b)/b*(a-b)
}
math(4, 0)

# functions can contain loops and conditionals

# Anonymous functions
named_function <- function(x) {x/2}
# vs
function(x) {x/2}



## R Packages
# base (contains things like mean)
# ggvis (data visualization)
# ggplot2

# install packages
install.packages()
install.packages("ggvis")
search()

# load packages into the search list (so they can be used)
library()
library("ggvis")
search()



### Apply Family

# lapply()  - apply function over list or vector, output is a list
# sapply() - apply function over list or vector, output tries to simplify to an array
# vapply() - apply funciton over list or vector, output is explicitly specified

## lapply() - apply a function over all list elements, or a function

# Always returns a list
# Takes a vector or list and applies a function to each element
city <- list(pop = 1973693, neighborhoods = c("1","2","3","4", "5"), capital = TRUE)

for(info in city) {
  print(class(info))
}

# Instead
lapply(city, class) # apply class to each list element


countries <- c("Canada", "USA", "Mexico", "Guatemala", "Belize", "Honduras", "Nicaragua", "Costa Rica", "Panama")

num_chars <- c()
for(i in 1:length(countries)) {
  num_chars[i] <- nchar(countries[i])
}

num_chars

lapply(countries, nchar)
unlist(lapply(countries, nchar))    # unlist() to get output as a vector

list_name <- list(342, 645, 847, 498, 237)
third <- function(x) {
  x/3
}
list_3 <- lapply(list_name, third)
unlist(list_3)

divide <- function(x, factor) {
  x/factor
}
list_f3 <- lapply(list_name, divide, factor = 3)
unlist(list_f3)

list_f6 <- lapply(list_name, divide, factor = 6)
unlist(list_f6)

# Anonymous functions - don't have to define the function separately if only using once - do it in lapply
lapply(list(5,7,3,7,8), function(x) {x/2})

# lapply with functions that require more than one argument
divide <- function(x,factor) {
  x/factor
}
lapply(list(5,7,3,7,8), divide, factor = 2)

call_element <- function(x, index) {
  x[index]
}
lapply(list(5,7,3,7,8), call_element, index = 5)


## sapply() - simplify apply

# Output is always simplified vector (same as unlist(apply())

sapply(list_name, function, USE.NAMES = TRUE)   # TRUE by default

countries <- c("Canada", "USA", "Mexico", "Guatemala", "Belize", "Honduras", "Nicaragua", "Costa Rica", "Panama")

first_last <- function(country) {
  country <- gsub(" ", "", country)
  letters <- strsplit(name, split = "")[[1]]
  c(first = min(letters, last = max(letters)))
}

# output is a matrix, but sometimes not always possible to simplify


## vapply() - apply over list or vector, specify output format

vapply(x, function, FUN.VALUE, ..., USE.NAMES = TRUE)

countries <- c("Canada", "USA", "Mexico", "Guatemala", "Belize", "Honduras", "Nicaragua", "Costa Rica", "Panama")

sapply(countries, nchar)
vapply(countries, nchar, numeric(1))   # specify FUN.VALUE so that returnes numeric value of 1

# Safer than sapply - have to think about what the function will return istead of relying on sapply to do it 



### Utilities ###

## Useful Functions

sapply()
lapply()
vapply()

sort()
print()
identical()

# Mathematical utilities
mean()    # calculates numerical mean
sum()     # adds the vector elements together
diff()    # difference the elements 
rount()   # rounds the values
abs()     # absolute value

# Functions for data structures
seq()     # generates a sequence of numbers, indicate (start, stop, by = ??)
rep()     # replicates the input, indicate how may times (sequence, times = ??)
sort()    # sorts the input, default increasing, can indicate (decreasing = TRUE)
str()     # view structure of any R object

is.list()   # check if list, or other *
is.*()

as.list()    # convert to a list, or other *
as.*()

unlist()    # unlists and returns as a vector, tried to assign names for vector elements, can use to convert a list to a vector

append()    # add elements to a vector or list
rev()       # reverses the order of the elements in a data structure 


## Regular Expressions

# check for patters, replace , extract
# used when cleaning data


# grepl()

# returns logical

grepl(pattern = <regex>, x=<string>)

countries <- c("Canada", "United States", "Mexico", "Guatemala", "Belize", "Honduras", "Nicaragua", "Costa Rica", "Panama")

grepl(pattern = "e", x = countries)     # look for countries with the letter e

grepl(patter = "^C", x = countries)     # look for countries that start with c (case sensitive)

grepl(pattern = "a$", x= countries)     # look for countries that end with a

# Find more with $regex 


# grep()

# returns positions (2,5,5,etc) aka indicies
grep(pattern = <regex>, x=<string>)

countries <- c("Canada", "United States", "Mexico", "Guatemala", "Belize", "Honduras", "Nicaragua", "Costa Rica", "Panama")

grep(pattern = "e", x = countries)


# sub() - only looks for the first element that matches (if two e, will only replace the first one)

sub(pattern = <regex>, replacement = <str>, x = <sub>)

countries <- c("Canada", "United States", "Mexico", "Guatemala", "Belize", "Honduras", "Nicaragua", "Costa Rica", "Panama")

sub(pattern = "e", replacement = "x", x = countries)

#gsub() - replace all that match

gsub(pattern = "e", replacement = "x", x = countries)

# can use | as or
gsub(pattern = "e|a|i", repl
     acement = "x", x = countries)


## Times and Dates   (default: "YYYY-MM-DD")

today <- Sys.Date()    
today
class(today)

time_date <- Sys.time()
time_date
class(time_date)

# Class something as a date
date <- as.Date("1999-07-10")
class(date)

date <- as.Date("1999-27-07")  # does not work 
date <- as.Date("1999-27-07", format = "%Y-%d-%m")
date   # now recognizes the date, and prints in the default format

time <- as.POSIXct("1999-07-10 17:12:56")
time

# Can do calculations with dates and times
today + 1   # today defined above, result is next calendar day

date1 <- as.Date("1985-07-13")
date2 <- as.Date("2026-07-13")
date2 - date1   # result is in days

time1 <- as.POSIXct("1999-07-10 17:12:56")
time2 <- as.POSIXct("1999-07-10 21:19:56")
time2 - time1


# Counts dates from 1 January 1970 midnight
unclass(date)  # result is number of days since 1970

# Packages
# lubridate
# zoo
# xts

# as.Date()

#  %Y   - 4 digit year (1984)
#  %y   - 2 digit year (84)
#  %m   - 2 digit month
#  %d   - 2 digit day
#  %A   - weekday (Monday)
#  %a   - abbreviated weekday (Mon)
#  %B   - month (September)
#  %b   - abbreviated month (Sept)


# as.POSIXct()

#  %H   - hours as a decimal 24 hr (00-23)
#  %I   - hours as a decimal number 12 hr (01-12)
#  %M   - minutes as a decimal number
#  %S   - seconds as a decimal number
#  %T   - shorthand for typical %H:%M:%S
#  %p   - AM/PM

# Uses for Dates and Times
# can difference the dates and time to find the time spent doing things or between things, can average the time, can sum the time, etc 


##### END OF BASIC R CODE NOTES #####