# 2 variables are hard to draw on x-axis in big data
# because we have 2 axis and we cannot draw multiple variables
# PCA converts big data into small components called priciple components
# PCA used to Overll understand the multi-dimentional data
## samples ara seen as clusters or groups

#read data
data("iris")
 
#PCA applicale only numeric values 5th is categorical that why -5 means 5th not added
## do scale becuase each value should have same units
x<- prcomp(iris[ ,-5], center = TRUE, scale. = TRUE )
print(x)
summary(x)

#ggplot2 cbind for binding PCA components
## mostely or usually we draw PCA1 and PCA agaist each other becos 80-90% lies here
irirs <- cbind(iris, x$x)
## grouping by gglot2
ggplot(iris, aes(PC1, PC2, col=iris$Species, fill=iris$Species))+
  stat_ellipse(geom = "polygon", col="black", alpha=0.5)+
  geom_point(shape=21, col="black")


#pca plot
install.packages("factoextra")
installed.packages("FactoMineR")
library(factoextra)
library(FactoMineR)

#PCA table
iris.pca <- PCA(iris[ , -5], graph=TRUE, scale.unit = TRUE )
## scaling fasle if units are same
iris.pca <- PCA(iris[ , -5], graph=TRUE, scale.unit = FALSE )

#screeplot show PCA components
# if PCA1 & 2 contain about 60-70% data it usually good practice(if draw graph btw them)
# ylim is used a limit
fviz_eig(iris.pca, addlabels= TRUE, ylim=c(0, 70))


#PCA plot  cos2 shows  quality of data in PCA col. is color
# if 2 variable angle is less than 90, it correlate
# if 2 variable angle is more than 90, it negatively correlate
# if 2 variable angle oppositive or 180, it is highly negative

fviz_pca_var(iris.pca, col.var = "cos2",
             gradient.col= c("red", "blue", "green", "yellow"),
             repel = TRUE)

fviz_pca_var(iris.pca, col.var = "cos2",
             gradient.col= c("red", "blue", "green", "yellow"),
             repel = TRUE)+
  labs(title = "PCA of parameters", x= "PC1 (49%)", y= "PC2 (23.9%)",
       color = "cos2")
ggsave("PCA.png", units = "in", width=6.5, height =5.5 )


