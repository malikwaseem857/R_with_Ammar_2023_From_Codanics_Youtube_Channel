library(readxl)
my_data <- read_excel("data.xlsx", sheet = "data", 
                      col_types = c("text", "numeric", "numeric"))
View(my_data)


## strip chart    for plot zoom cntl+shf+6
stripchart(my_data$Height)
## strip chart for 2 variable
stripchart(my_data$Height~ my_data$Weight)

## Histogram
hist(my_data$Height)
hist(my_data$Weight)


# scatter plot
plot(my_data$Weight, my_data$Height)

# qqnorm plot
qqnorm(my_data$Weight)

## bar plot
barplot(my_data$Height)

## Mosaic plot
mosaicplot(~my_data$Crop+my_data$Height)


bqxplot(my_data$Height ~ my_data$Crop)











