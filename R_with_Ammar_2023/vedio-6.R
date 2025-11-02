# ANOVA and Multiple Mean Comparison in R

library(readxl)
x <- read_excel("data.xlsx", sheet = "data2", 
                   col_types = c("text", "numeric", "numeric", 
                                 "text"))
View(x)

#boxplot
boxplot(x$Height ~ x$Crop)
boxplot(Height ~ Crop, data= x) # best onne
# for just 2 means we will use t-test

#multiple comparison of mean

install.packages("agricolae")
library(agricolae)

help("agricolae-pacakge")
#1-tukey-HSD test   #out = output, group on base of crop, main = title 
model <- aov(Height ~ Crop, data = x)
out <- HSD.test(model,"Crop", group = TRUE, console = TRUE, main = "Tukey test")
plot(out)

#2- LSD.test
out <- LSD.test(model,"Crop", group = TRUE, console = TRUE, main = "LSD test")
plot(out)

#3- Duncan test
model <- aov(x$Height ~ x$Crop,)
out <- duncan.test(model,"Crop", group = TRUE, console = TRUE, main = "Duncan test")
plot(out)


#grouping
boxplot(Height ~ Crop * water, data= x, las=2, xlab = "")
model1 <- aov(Height ~ Crop * water, data= x)
out1 <- HSD.test(model1, c("Crop", "water"), group = TRUE, console = TRUE, main = "Tukey test")
plot(out1, horiz = TRUE, las = 2) # common one
plot(out1, horiz = TRUE, las = 1)
plot(out1, las = 2)
## save in super high quality graph in jpeg "tiff' file name
jpeg(file="Tukey test.tiff",
     width = 6, height= 4, units = "in", res = 300)
boxplot(Height ~ Crop * water, data = x, las=2, xlab = "")
dev.off()   # for saving

# to save the file in jpg
jpeg(file="Tukey test plot.tiff",
     width = 6, height= 4, units = "in", res = 300)
plot(out1, las = 2)

dev.off()   # for saving

