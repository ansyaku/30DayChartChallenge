---
title: "School Enrollment for 19-24 Years Students (College)"
author: "Andreas Syaloom Kurniawan"
date: "April 19th, 2021"
---

# Loading package
library(ggplot2)
library(tibble)
library(ggthemes)  

# Reading and Filtering Data
tms<-read.csv("tpar.csv", sep=";", stringsAsFactors=FALSE)
tms<-tms[tms$Indikator>1999,]
tms_tb<-as_tibble(tms)

#Plotting Data Using WSJ_THEMES from ggtheme
p<-ggplot(tms_tb, aes(x=Indikator, y=X19.24years))+ 
  geom_line(aes(y=X19.24years), color="#739484", size=3) +
  geom_smooth(method = "lm", se = FALSE, linetype="dotdash", color="#879171")+
  labs(x="SPR PERCENTAGE\n",
       y="\n YEAR \n",
       caption="\n @ansyaku | Day5: Slope | #30DayChartChallenge")
p+ggtitle("College Enrollment Rate (19-24 Years Student)",
          subtitle="Datasource: Central Bureau of Statistics (Indonesia) \n")+
  theme_wsj(
    base_size = 12,
    color="gray",
    base_family = "sans",
    title_family = "sans")+
  theme(axis.title=element_text(size=14),
        panel.background = element_rect(fill = "gray98"),
        plot.subtitle = element_text(size=16),
        plot.caption = element_text(size=14, face = "italic")
  )

#SAVE THE VISUALIZATION
ggsave("enrollment.png",
       scale = 1,
       width = 15,
       height = 8)