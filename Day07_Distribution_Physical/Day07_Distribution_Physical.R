---
title: "Distribution of Health Workforce per 100.000 Population - Doctors"
author: "Andreas Syaloom Kurniawan"
date: "April 28th, 2021"
---
library(sf)
library(ggplot2)
library(dplyr)
library(tmap)
library(tmaptools)
library(leaflet)

#Loading CSV files (distribution data)
dist<-read.csv("medical.csv", stringsAsFactors = FALSE, header=TRUE, sep=";" )
head(dist)

peta<-sf::st_read("./peta_indo/prov.shp", stringsAsFactors=FALSE)
str(peta)

map_and_data<-dplyr::inner_join(peta, dist, by = c("NAME_1"="province"))
head(map_and_data)

ggplot(map_and_data)+
  geom_sf(aes(fill=doctors))+
  #scale_fill_viridis_d()+
  scale_fill_gradient(limits = c(10, 50), low="#a80077", high="#66ff00", 
                      guide="colorbar", na.value="white")+
  #scale_fill_gradient(limits = c(0, 45), values=Paired)+
  labs(
    title = "Distribution of Health Workforce per 100.000 Population - Doctors",
    subtitle = "(White colour map indicates - 1 doctor for > 75 population ) \n",
    caption = "\n Data: Ministry of Health, Indonesia | Creation: @ansyaku | Day12_Distribution_Physical"
  ) +
  theme(
    text = element_text(color = "#22211d"),
    plot.background = element_rect(fill = "#E3F9E8", color = NA),
    panel.background = element_rect(fill = "#ffffff", color = NA),
    legend.background = element_rect(fill = "#E3F9E8", color = NA),
    plot.title = element_text(size= 22, hjust=0.01, color = "#4e4d47", margin = margin(b = -0.1, t = 0.4, l = 2, unit = "cm")),
    plot.subtitle = element_text(size= 16, hjust=0.01, color = "#4e4d47", margin = margin(b = -0.1, t = 0.43, l = 2, unit = "cm")),
    plot.caption = element_text( size= 14, color = "#4e4d47", margin = margin(b = 0.3, r=-99, unit = "cm") ),
    legend.position ="bottom"
  )+
  guides(fill=guide_legend(title="1 Doctor for ... population"))

#SAVING VISUALIZATION
ggsave("distribution.png",
       scale = 1,
       width=15,
       height=10)