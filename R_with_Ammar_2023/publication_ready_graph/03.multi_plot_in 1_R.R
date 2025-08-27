## ggpubr package Part-03

## install following packages

install.packages("readxl")
install.packages("tidyverse")

# main package for today
install.packages("ggpubr")
 

# load all packages
library(readxl)
library(tidyverse)
library(ggpubr)

## 1- Boxplot with Jitter points and means comparsion
data("ToothGrowth")

# simple Boxplot
p1 <- ggboxplot (ToothGrowth, x= "dose", y = "len",
                 color = "dose", pallete = c("blue", "red", "green"),
                 add = "jitter", shape = "dose",
                 xlab= "Dose", ylab = "length", legend.title="Dose" );p1
## showing main comparsions
# specify the comparsion you want

my_comparsions <- list(c("0.5", "1"), c("0.5", "2"), c("0.5", "2"))

p1 + stat_compare_means(comparsions = my_comparsions,
                        method = "t.test",
                        label = "p.signif",
                        )+ # add pairwise comparsion p-value
  stat_compare_means(label.y = 50)+ ylim(0, 60) # Add global p-value

# aganist control treatment or reference group
p1+ stat_compare_means(label.y = 42,
                       method = "t.test",
                       lable = "p.signif",
                       ref.group = "0.5") # add global p-value

# show p-vlaue
p1 <- p1 + stat_compare_means(comparsions = my_comparsions)+ # add pairwise 
  stat_compare_means(label.y = 50) + ylim(0, 60); p1 



# multiple grouping varibale

# boxplot faceted by "dose"

p2 <- ggboxplot(ToothGrowth, x = "supp", y = "len",
                color = "supp", palette = "nug",
                facet.by = "dose", short.panel.labs = FALSE);p2

## use only p.formate as label . Remove method name
p2 <- p2 + stat_compare_means(
  aes(label = paste0("p= ", ..p.format..))
);p2

## making violin plot

# violin plot

p3 <- ggviolin(ToothGrowth, x = "dose", y = "len",
               color = "dose", pallete = c("#00AFBB", "#E7B800", "#FC4E07"),
               add = "jitter", shape = "dose",
               xlab = "Dose", ylab = "Length", legend.title = "Dose");p3

# showing means comparsion
# aspect by comparsion you want
my_comparsions <- list( c("0.5", "1"), c("1", "2"), c("0.5", "2"))
 # showing significant stars

p3 <- p3 + stat_compare_means(comparsions = my_comparsions,
                              method = "t.test",
                              label = "p.signif")+ #add pairwise comparsion p_vlaue
stat_compare_means(label.y = 50)+ ylim(0, 60);p3

# 4- violin plot wit box plots inside

p4 <- ggviolin(ToothGrowth, x = "supp", y = "len",
               fill = "supp", pallete = "nug", 
               facet.by = "dose", short.panel.labs = FALSE,
               add = "boxplot", add.params = list(fill = "white"));p4

# use only p.formate as label. Remove method name
p4 <- p4 + stat_compare_means(
  aes(label = paste("p = ", ..p.format..))
);p4



p4 <- p4 + stat_compare_means(
  aes(label = paste0("p = ", ..p.signif..))
);p4

## combine all plots
ggarrange(p1, p2, p3, p4 + rremove("x.text"),
          labels = c("A", "B", "C", "D"),
          ncol = 2, nrow = 2) %>%
  ggexport(filename = "test.png", res = 200, width = 1600, height = 1600)

# 3 plot together

ggarrange(p1,                                       #first row with boxplot
          ggarrange(p2, p3, ncol = 2, ;labels = c("a", "c")),
          nrow = 2,
          labels = "A"
) %>%
  ggexport(filename = "test.png", res = 200, width = 1600, height = 1600)



