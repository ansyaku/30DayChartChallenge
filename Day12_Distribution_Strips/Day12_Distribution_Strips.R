---
title: "Fishermen Exchange Rate Index (Nilai Tukar Nelayan)"
author: "Andreas Syaloom Kurniawan"
date: "April 26th, 2021"
---
  
# Loading package
library(tidyverse)
library(ggplot2)
library(ggthemes)  

# Reading Data
data<-read.csv2("ntn.csv", dec=",",sep=";", stringsAsFactors=TRUE)
data$NTN<-as.numeric(as.character(data$NTN))
data$Years<-as.factor(as.character(data$Years))
head(data)

#Plotting Data Using stata theme from ggtheme
#First, refactor month level
ord <- c("JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JULY","AUG","SEP","OCT","NOV","DEC")
e <- ggplot(data, aes(x =factor(Month, level = ord), y = NTN))
e + geom_jitter(aes(colour = Years), 
                position = position_jitter(0.2), size = 4)+
  scale_colour_manual(values=c("2014"="#FD0100",
                               "2015"="#F76915",
                               "2016"="#EEDE04",
                               "2017"="#A0D636",
                               "2018"="#2FA236",
                               "2019"="#333ED4"))+
  labs(
    fill=guide_legend(title=NULL),
    title = "Fishermen Exchange Rate Index (Nilai Tukar Nelayan)",
    subtitle = "(Indicator to See the Welfare of Fishing Communities) \n",
    caption = "FER Rate = price index received by fisherman divided by price index paid by fisherman\n \n Datasource: Central Bureau of Statistics (Period: 2014-2015) | @ansyaku |Day9: Statistics ")+
  ylab("FER Rate \n")+
  xlab("\n Month")+theme_fivethirtyeight(base_size = 18, base_family = "sans")

#SAVING VISUALIZATION
ggsave("fer.png",
       scale = 1,
       width=15,
       height=10)