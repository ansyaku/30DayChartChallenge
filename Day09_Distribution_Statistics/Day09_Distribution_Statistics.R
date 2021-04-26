---
  title: "Temperature Distribution of North Sumatera"
author: "Andreas Syaloom Kurniawan"
date: "April 26th, 2021"
---
  
# Loading package
library(tidyverse)
library(ggplot2)
library(ggthemes)  

# Reading Data
suhu <- read.csv("suhu.csv", sep=";", stringsAsFactors=TRUE)
head(suhu)
tbl_suhu<-as_tibble(suhu)
head(tbl_suhu)

#Plotting Data Using stata theme from ggtheme
options(repr.plot.width=15, repr.plot.height=10) 
p<-ggplot(r, aes(x=Degree, fill=Type)) + 
  geom_density(alpha=.4)+
  theme_stata(base_size = 18, base_family = "sans", scheme = "s2color")
p+labs(
  title = "Temperature Distribution of North Sumatera",
  subtitle = "(Maximum, Minimum, and Average) \n",
  caption = "\n Datasource: Central Bureau of Statistics (Period: 1/1/2019-31/12/2019) | @ansyaku |Day9: Statistics "
)+
  ylab("Probability Density \n")
  )

#SAVING VISUALIZATION
ggsave("temperature.png",
       scale = 1,
       width=15,
       height=10)