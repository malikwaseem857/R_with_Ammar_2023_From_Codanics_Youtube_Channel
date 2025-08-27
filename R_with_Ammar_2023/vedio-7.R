# ggplot2 package in R
install.packages("ggplot2")
library(ggplot2)

# 3 point to noted:
#ggplot (function)
#data(data1)
#mapping (xaxis, yaxis)
#geometry (scatter, box, line)


library(readxl)
x <- read_excel("ggdata.xlsx", sheet = "gg1", 
                     col_types = c("text", "numeric", "text", 
                                   "text"))
View(x)

ggplot(data = x, mapping = aes(x=crop, y=height))+ geom_point()

ggplot(x, aes(crop, height))+geom_point()+geom_line()
## lets increase the size
ggplot(x, aes(crop, height))+geom_boxplot()
ggplot(x, aes(crop, height))+geom_boxplot()+geom_point()
ggplot(x, aes(crop, height))+geom_boxplot()+geom_point(size=3)
ggplot(x, aes(crop, height))+geom_boxplot()+geom_point(size=3, color="red")
ggplot(x, aes(crop, height))+geom_boxplot()+geom_point(size=3)+geom_line()
#let do more transparent 
ggplot(x, aes(crop, height))+geom_boxplot()+geom_point(size=3, color= 'blue', alpha =0.8)


ggplot(x, aes(crop, height, fill=water))+ geom_boxplot()+
facet_wrap(~fert.type)+
  labs(x="Crop Type", y="Plant Height (cm)")
theme_bw()+
  ggsave("ggplot1.tiff", units =  "in", width =  8, height =  6 ,dpi = 300, compression = 'lzw')

ggplot(x, aes(crop, height, color=water))+ geom_boxplot()
# lets fill the water inside the boxplot
ggplot(x, aes(crop, height, fill=water))+ geom_boxplot()
# Lets separate N and P by facet_wrap
ggplot(x, aes(crop, height, fill=water))+ geom_boxplot()+
  facet_wrap(~fert.type)
## lets label them  on x-axis and Y-axis
ggplot(x, aes(crop, height, fill=water))+ geom_boxplot()+
  facet_wrap(~fert.type)+
  labs(x="Crop Type", y="Plant Height (cm)", title = "Plant Growth")
## lets aa theme bw for blacken-white
ggplot(x, aes(crop, height, fill=water))+ geom_boxplot()+
  facet_wrap(~fert.type)+
  labs(x="Crop Type", y="Plant Height (cm)")
theme_bw()
## lets add cord_flip of x- and Y-axis
ggplot(x, aes(crop, height, fill=water))+ geom_boxplot()+
  facet_wrap(~fert.type)+
  labs(x="Crop Type", y="Plant Height (cm)")
theme_bw()+
  coord_flip()+
ggsave("ggplot1.tiff", units =  "in", width =  6, height =  4 ,dpi = 300,
         compression= 'lzw')
