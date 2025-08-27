## title 
## 7 steps guide to make publication ready graph
## auther Waseem akram copied from R_with_Ammar
## date: 19-08-2025

## install packages
install.packages("tidyverse")
install.packages("ggplot2")

library(ggplot2)
library(tidyverse)
library(ggthemes)
library(multcompView)
library(dplyr)

### 
## step-1 Load or import your data set
data("chickwts")
tibble(chickwts)


 ## step-2  Calculate "means" of your treatment group and the "standard derivation" sp to show on error bars as for 
mean_data <- group_by(chickwts, feed) %>%
  summarise(weight_mean = mean(weight), sd  = sd(weight)) %>%
  arrange(desc(weight_mean))

tibble(mean_data)



## step-3 : Performing Analysis of Variance "ANOVA", using buitin "aov function
 library(stats)
anova <- aov(weight ~ feed, data= chickwts)
summary(anova)

##  step-4: if the ANOVA is significantly different , we will draw  multiple mean comparsion
tukey <- TukeyHSD(anova)
tukey


## step- 5 : Draw multiple comparsion letters using "multicomp" R packages as follows:
group_letters <- multcompLetters4(anova, tukey)
group_letters



##  Extracting group Letters
group_letters < as.data.frame.list(group_letters$feed)
## Adding to the mean data
mean_data$group_letters <- group_letters$Letters
tibble(mean_data)

## step- 6 : Drawing the "publlication ready Barplot in ggplot2 
p <- ggplot(mean_data, aes(x = feed, y = weight_mean, fill = feed)) +
  geom_bar(stat = "identity", show.legend = FALSE, width = 0.6)


# don't choose p for applying 
# if we want to draw the error bar


p <- ggplot(mean_data, aes(x = feed, y = weight_mean)) +
  geom_bar(stat = "identity",aes(fill = feed), show.legend = FALSE, width = 1 ) +
  geom_errorbar(
    aes(ymin = weight_mean-sd, ymax = weight_mean+sd), 
    width = 0.1
  ) + 
  geom_text(aes(label = group_letters, y = weight_mean + sd), vjust = 0.4)  +
  scale_fill_brewer(palette = "BrBG", direction = 1) + # theme setting
  labs(# this will add labels)
    x = "Feed Type",
    y = "Chicken Weight (g)",
    title = "Publication Ready Barplot",
    subtitle = "Copied from R_with_R",
    fill = "Feed Type"
  ) +
  ylim(0, 410) + # change your y-axis limit on the letters
  ggthemes:: theme_par() ;p
    
###  ## step- 7 : Saving upto 4k barplots in R

tiff('Barplot.tiff', units= "in", width=10, height= 6, res= 300, compression = 'lzw')
p
dev.off()








