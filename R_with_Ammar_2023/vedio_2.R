# day_2
library(readxl)

my_data <- read_excel("data.xlsx", sheet = "data", 
                      col_types = c("text", "numeric", "numeric"))
View(my_data)

# now lets see the structure
# str is a function and applying to my_data

str(my_data)


head(my_data)
tail(my_data)

# let see how does we plot

plot(my_data)
# let make box plot remember it will be between two variables
# remember argument first or x-axis first
# boxplot is different for two same variable(numeric, numeric,) and diferent
# with two different variables (texet, numeric)

boxplot(my_data$Height, my_data$Weight)
boxplot(my_data$Crop, my_data$Height)


boxplot(my_data$Height~ my_data$Crop)
