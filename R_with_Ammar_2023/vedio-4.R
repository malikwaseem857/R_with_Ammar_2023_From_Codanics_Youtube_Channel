# 4th class about Boxplot

library(readxl)
my_data <- read_excel("data.xlsx", sheet = "data", 
                      col_types = c("text", "numeric", "numeric"))
View(my_data)


boxplot(my_data$Height ~my_data$Crop)

#labeling
boxplot(Height~ Crop, data=my_data)

boxplot(Height~ Crop, data=my_data, main="boxplot of experiment",
        xlab= "Crop Type", ylab="Plant height")

#coloring

boxplot(Height~ Crop, data=my_data, main="boxplot of experiment",
        xlab= "Crop Type", ylab="Plant height",
        col="Red", border= "Blue")
# favourite coloring
boxplot(Height~ Crop, data=my_data, main="boxplot of experiment",
        xlab= "Crop Type", ylab="Plant height",
        col="Red", border= "#C95792")

# grouping of treatment
library(readxl)
data <- read_excel("data.xlsx", sheet = "data 2", 
                   col_types = c("text", "numeric", "numeric", 
                                 "text"))
View(data)

## Height over crop
boxplot(data$Height ~ data$Crop)
boxplot(data$Height ~ data$Crop + data$Water)

# c for more than 1 factor or variables, if single use it as won
my_data2$Crop <- factor(my_data2$Crop, levels = c("potato","Maize", "Rice", "Wheat") )


boxplot(data$Crop, data$Height, xlab = "Crop Type", ylab = "Height Length")

boxplot(my_data2$Height ~ my_data2$Crop) * my_data2$water, main ="Boxplot of Experiment")
## if the middle line of the boxplot didn't touch the upper quartile of 2nd boxplot there will be significant difference


