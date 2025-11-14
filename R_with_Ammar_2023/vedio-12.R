#scatter plot in R

library(ggplot2)

# import build-in data set 
data("cars")
View("cars")

ggplot(data = cars, aes(x= speed, y=dist))+geom_point()
# geom_smooth() will add the line in it
ggplot(data = cars, aes(x= speed, y=dist))+geom_point()+geom_smooth()
# to fix the line straight  use lm
ggplot(data = cars, aes(x= speed, y=dist))+geom_point()+geom_smooth(method = "lm")
# to remove the shaded part that is actually 95% confidence interval 
ggplot(data = cars, aes(x= speed, y=dist))+geom_point()+geom_smooth(method = "lm",)
# if you want to show the CI use se=falsle or it is true by default 

# if you want to change the CI use level= command
ggplot(data = cars, aes(x= speed, y=dist))+geom_point()+geom_smooth(method = "lm", level=0.90)

#scatter plot with multi line
data("Orange")
View("Orange")
# lets plot on orange 
ggplot(Orange, aes(age, circumference))+ geom_point()
# lets color then according to tree wise
ggplot(Orange, aes(age, circumference, color=Tree))+ geom_point()
# if want to change the geom-point size and shape
ggplot(Orange, aes(age, circumference, color=Tree))+geom_point(size=4, shape=16)

ggplot(Orange, aes(age, circumference, color=Tree))+
  geom_point(size=6, shape=15)     

#separate by shape and color
ggplot(Orange, aes(age, circumference, color=Tree))+ 
  geom_point(size=4, aes(shape=Tree))

ggplot(Orange, aes(age, circumference, color=Tree))+ 
  geom_point(size=4, aes(alpha=Tree))
# common is this 
ggplot(Orange, aes(age, circumference, color=Tree))+ 
  geom_point(size=4, shape=19)
## lets add a line
ggplot(Orange, aes(age, circumference, color=Tree))+ 
  geom_point(size=4, shape=19)+
  geom_line(linetype=5, size=1)



gplot(Orange, aes(age, circumference, color=Tree))+ 
  geom_point(size=4, shape=19)+
  geom_line(linetype=5, size=1)+
  labs(x= "Age", y="circumference", title= "Scatter Plot")

  ggsave("scatterplot.pdf")




#blubble plot
install.packages("viridis")
library(viridis)
data("quakes")
nrow(quakes)
# before comma(,) is rows after comma(,) will be columns
q_sample <- quakes[seq(from=1, to= 1000, by=10),]
nrow(q_sample)
# lets make a graph 
install.packages("ggplot2")
library("ggplot2")
ggplot(data = q_sample, aes(x=lat, y=long))+ geom_point()
# lets change the size and color by mag and function of guide to remove the guide
ggplot(data = q_sample, aes(x=lat, y=long))+
  geom_point(aes(size=mag, color+mag))+
  guides(size=F)

ggplot(data = q_sample, aes(x=lat, y=long))+
  geom_point(aes(size=mag, color+mag))+
  guides(size=F)+
  scale_colour_viridis_b(option = "B")
# scale size continous  for c(1, 8) buddle increase according to the size
ggplot(data = q_sample, aes(x=lat, y=long))+
  geom_point(aes(size=mag, color+mag))+
  guides(size=F)+
  scale_colour_viridis_b(option = "B")+
  scale_size_continuous(range = c(1, 8))+
  labs(x= "Latititude", y= "longtitude", title= "Graph")+
  ggsave("Bubbleplot.pdf")
  

#jitter plot (type of scatter plot)
install.packages("diamonds")
data("diamonds")
nrow(diamonds)
d_sample <- diamonds[seq(from= 1, to= 49000, by=100),]
nrow(d_sample)
# lets make jitter plot
ggplot(d_sample, aes(cut, price, color=cut))+geom_jitter()
ggplot(d_sample, aes(cut,))+geom_point()



