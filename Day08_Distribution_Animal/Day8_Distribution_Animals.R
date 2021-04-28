---
title: "Catch per Unit of Silky Shark (Carcharhinus Falciformis)"
author: "Andreas Syaloom Kurniawan"
date: "April 28th, 2021"
---#Loading CSV files (distribution data)
  hiu<-read.csv("hiu1.csv", stringsAsFactors = FALSE, header=TRUE, sep=";" )
head(hiu)

options(repr.plot.width=15, repr.plot.height=10) 
library(ggthemes)
ord <- c("JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JULY","AUG","SEP","OCT","NOV","DEC")
ggplot(hiu, aes(x=factor(Year2, level=ord), y=X2014)) +
  geom_boxplot(fill="#77acf1")+
  labs(
    title = "Catch per Unit of Silky Shark (Carcharhinus Falciformis)",
    subtitle = "Fishing Method: Surface Longline (Fishing in 200 - 3000 m depth)- 2014-2020 \n",
    caption = "\n Data: Data-Ikan.org | Creation: @ansyaku | Day12_Distribution_Animal"
  ) +theme_tufte()+
  theme(
    text = element_text(color = "#22211d"),
    plot.background = element_rect(fill = "#f3f4ed", color = NA),
    panel.background = element_rect(fill = "#ffffff", color = NA),
    legend.background = element_rect(fill = "#E3F9E8", color = NA),
    plot.title = element_text(size= 22, hjust=0.01, color = "#4e4d47", margin = margin(b = -0.1, t = 0.4, l = 2, unit = "cm")),
    plot.subtitle = element_text(size= 16, hjust=0.01, color = "#4e4d47", margin = margin(b = -0.1, t = 0.43, l = 2, unit = "cm")),
    plot.caption = element_text( size= 14, color = "#4e4d47", margin = margin(b = 0.3, r=-99, unit = "cm") ),
    legend.position ="bottom"
  )+xlab("Month")+ylab("Number of Catch per Trip")

#SAVING VISUALIZATION
ggsave("shark.png",
       scale = 1,
       width=15,
       height=10)