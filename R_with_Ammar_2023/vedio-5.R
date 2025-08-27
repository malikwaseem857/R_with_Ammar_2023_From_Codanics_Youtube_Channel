# ANOVA and Tukey Test in R
library(readxl)
data <- read_excel("data.xlsx", sheet = "data2", 
                   col_types = c("text", "numeric", "numeric", 
                                 "text"))
View(data)


mean(data$Height)
mean(data$Weight)
median(data$Height)
median(data$Weight)

min(data$Height)
max(data$Weight)

range(data$Height)
range(data$Weight)
# 1st and 3rd quartile
quantile(data$Height,.25)
quantile(data$Height, .75)

# Standard Deviation
sd(data$Height)
sd(data$Weight)
# Variance 
var(data$Height)
Var(data$Weight)

# for particular data before, rows after , columns
lapply(data[, 2:3], mean)
lapply(data[, 2:3], sd)

# ANOVA and Multiple Comaparsion Mean Test
lapply(data[, 2:3], var)

# if we want all the parameters together
summary(data)

#anova
aov(data$Height ~ data$Crop)
# let make object and then take summary
a1<- aov(data$Height ~ data$Crop)
summary(a1)    # if there ** comes it means p value is significant


TukeyHSD(a1) 

#group, anova
a2 <- aov(data$Height ~ data$Crop)
summary(a2)

TukeyHSD(a2)
#for automatic lattaring install agricolae
