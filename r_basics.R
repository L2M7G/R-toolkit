#### Notes on the basics of R code ####

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


##### End of Intro to R #####

