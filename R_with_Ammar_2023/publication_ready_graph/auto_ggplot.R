## welcome to the R_with_ammar graph (part-2)
# install the following package

install.packages("readxl")
install.packages("tidyverse")
install.packages("agricolae")
install.packages("devtools")
install.packages("esquisse")
install.packages("hrbrthemes")
devtools::install_github("JLSteenwnk/ggpubfigs")
 # load all packages
 library(readxl)
library(tidyverse)
library(ggpubfigs)
library(esquisse)
library(hrbrthemes)
 ## import data set in R
data("midwest")  # for scatter  plot
data("iris")     
data("mtcars")   # heatmaps etc
data("PlantGrowth")

# the magic

esquisser()
ggplot(PlantGrowth) +
  aes(x = group, y = weight, fill = group, colour = group) +
  geom_jitter() +
  scale_fill_hue(direction = 1) +
  scale_color_hue(direction = 1) +
  labs(
    x = "Treatment",
    y = "Plant Weight",
    title = "Jitter plot"
  ) +
  theme_classic()


####
esquisser()
