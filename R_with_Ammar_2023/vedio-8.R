#how to use built in datasets of R
data() # all datasets in R
View(CO2) #to view datasets in R console
View(PlantGrowth)
View(iris)
View(mtcars)
View(trees)
View(npk) #NPK data for fictorial design


head(CO2) #to show the first 6 rows of the data
names(CO2) #to show the names of columns
nrow(CO2) #to look for number of rows
ncol(CO2)  #to look for number of columns

install.packages("writexl") #to save .xlsx files
library(writexl)
# save the co2 data in test_1 file
write_xlsx(CO2, path = "C:\\Users\\SAMIA NOREEN\\Desktop\\test_1\\CO2.xlsx") #to commont files
# Let's make a graph (geomPLot) of tree data
library(ggplot2) #to plot the graph and figure
ggplot(trees, aes(Girth, Height))+geom_point()
# to find the type of trend in data use geom_smooth method
ggplot(trees, aes(Girth, Height))+geom_point()+geom_smooth(method = "lm")



