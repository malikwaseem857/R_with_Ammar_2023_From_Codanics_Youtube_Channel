#violin plot in ggplot
#geom_violin()
 
install.packages("gglpot2")
library(ggplot2)

data()
data("diamonds")

d_sample <- diamonds[seq(1, 53000, by=10),]
nrow(d_sample)
#Lets draw the  violin plot

p <- ggplot(data=d_sample, aes(x=cut, y=price)+ geom_violin()
            
# lets give me color as cut for fill= cut
p <- ggplot(data=d_sample, aes(x=cut, y= price, color=cut))+ geom_violin()
# lets fix geom+ voilin plot
p + geom_boxplot(width=0.1)+ geom_jitter(size=0.5)+ggsave("violinplot.pdf")
