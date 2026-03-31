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

# Subset
x[x > 1]


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