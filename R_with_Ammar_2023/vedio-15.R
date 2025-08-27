#1-heatmap
x <- mtcars
heatmap(mtcars)

x<- as.matrix(mtcars)
heatmap(x)
heatmap(x, scale = "column")


#2-gplots used for heatmap we used gplot
install.packages("gplots")
library(gplots)
heatmap.2(x, scale = "column", col = bluered(100))
# to remove the traces
heatmap.2(x, scale = "column", col = bluered(100),
          trace = "none")
?heatmap.2()

#3-p-heatmaps
install.packages("pheatmap")
library(pheatmap)

pheatmap(x, scale = "column")
#Lets cut the rows and columns by 4 & 2
pheatmap(x, scale = "column", cutree_rows = 4, cutree_cols = 2)

#4- ggplot2
library(ggplot2)
y <- iris
## reshape packge converts 4 columns in to 1 columns
install.packages("reshape")
library(reshape)


y1 <- melt(iris)
# species on x-axis, varibale on y-axis
ggplot(y1, aes(y1$Species, y1$variable, fill = y1$value))+
  geom_tile()
#lets change color by fil_graident by lower and upper
ggplot(y1, aes(y1$Species, y1$variable, fill = y1$value))+
         geom_tile()+
         scale_fill_gradient(low =  "yellow", high = "green")
