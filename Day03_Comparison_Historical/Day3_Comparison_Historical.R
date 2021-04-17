---
title: "Indonesian Rupiah Exchange Rates (2010-2020"
author: "Andreas Syaloom Kurniawan"
date: "April 4th, 2021"
---

#----------------------------------------------------------------------
#LOAD PACKAGES

library(ggplot2)
library(ggthemes)

#----------------------------------------------------------------------
#LOAD DATA
data<-read.csv("Exchange.csv", header=TRUE, sep=";")

#----------------------------------------------------------------------
#CHANGE YEAR TO FACTOR
data$Year<-as.factor(data$Year)

#----------------------------------------------------------------------
#MAKE VISUALIZATION
myhjust <- 0
p <- ggplot(data, aes(factor(Year), Exchange)) + geom_violin()
p + labs(title = "Indonesian Rupiah (Rp) Exchange Rates (2010-2020)", subtitle = "\nBased on Monthly Exchange Rate\n", 
         caption = "\n (Datasource: Ministry of Trade-Republic of Indonesia)")+
  xlab("\n Year")+
  ylab("Exchange Rate per USD \n")+
  stat_summary(fun= mean, geom="point", shape=21, colour = "red", size=2)+
  theme_economist(base_size = 29, dkpanel=TRUE) + 
  scale_color_economist()+
  theme(plot.title = element_text(size=29), 
        plot.subtitle=element_text(size=16, hjust = myhjust),
        plot.caption=element_text(size=14))
#----------------------------------------------------------------------
#SAVE THE VISUALIZATION
ggsave("rates.png",
       scale = 1,
       width = 15,
       height = 8)