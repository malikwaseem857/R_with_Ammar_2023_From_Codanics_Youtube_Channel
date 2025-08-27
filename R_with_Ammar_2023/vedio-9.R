#how to use built in database of R
data() # all datasets in R
view(CO2) #to view datasets in R cosole
view(PlantGrowth)
view(iris)
view(mtcars)
view(trees)
View(npk) #NPK data for fictorial design


head(CO2) #to show the first 6 rows of the data
names(CO2) #to show the names of columns
nrow(co2) #to look for number of rows
ncol(co2)  #to look for numbers of columns

install.packages("writexl") #to save .xlsx files
library(writexl)

write_xlsx(CO2, path = "C:\\Users\\Waseem Akram\\Desktop\\test1\\co2.xlsx") #to commont files

library(ggplot2) # ggplot used to plot the graph and figure
ggplot(trees, aes(Girth, Height))+geom_point()+geom_smooth(method = "lm")
