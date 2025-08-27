## correlation plot in R

# install packages
install.packages("psych")
install.packages("corrplot")
install.packages("RColorBrewer")

library(psych)
library(corrplot)
library(RColorBrewer)

# psych Package
## corrplot used only for numeric variables
data("iris")
# By default it wll be pearson method
x <- corr.test(iris[-5])

pairs.panels(iris[-5])

# import dataset