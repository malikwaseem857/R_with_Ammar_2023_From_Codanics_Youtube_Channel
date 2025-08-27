# welcome to R_with_Ammar - Publication ready graph(part-1)


## install following package

install.packages("readxl")
install.packages("tidyverse")
install.packages("agricolae")
install.packages("devtools")
install.packages("writeXLS")
devtools:: install_github("JLSteenwnk/ggpubfigs")
install.packages("ggpubr")

## load all packages
library(readxl)
library(tidyverse)
library(agricolae)
library(devtools)
library(writeXLS)
library(ggpubr)
install.packages("ggpubfigs")


# load data (biuld in R)

data("PlantGrowth")
# how to import data from R buildin set

write_xlsx(PlantGrowth, ".\\PlantGrowth.xlsx")
input_data <- read_excel("PlantGrowth.xlsx")
print(input_data)


# statistical Analysis of data (Tukey_test)

value_max = input_data %>%
  group_by(group) %>%
  summarize(max_value = max(weight))


hsd= HSD.test(aov(weight~ group, data= input_data), trt = "group", group = T)
sig.letters <- hsd$group[order(row.names(hsd$groups)), ]


## visualization
ggplot(data = inp_data, aes(x= group, y= weight, fill=group))+
  geom_boxplot()+
  stat_boxplot(geom = 'errorbar', width= 0.1)+
  geom_text(data = value_max, aes(x=group, y = 0.15 + max_value,
                                  label = sig.letters$groups), vjust=0)+
  ggtitle("") + xlab("Treatments") + ylab("Plant Weight (g)")+
  scale_fill_manual(values = friendly_pal("bright_seven"))+ theme_simple()+
  theme(legend.position = "none")


# then save the plot





