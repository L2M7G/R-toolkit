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


### Matrix ###

# Construct a matrix that contains the numbers 1-9, filled by the rows, with 3 rows
matrix(1:9, byrow = TRUE, nrow = 3)

# Column and row names
name_column <- c("name", "name", ...)
name_row <- c("name", "name", ...)
colnames(matrix_name) <- name_column
rownames(matrix_name) <- name_row

# RESUME HERE !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

### Data Frames ###

head(df)
str(df)
df[df$var > 0, ]


### Factors ###

factor(x)
factor(x, ordered = TRUE)


### Lists ###

my_list[[1]]
my_list$name