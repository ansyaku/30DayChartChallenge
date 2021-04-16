library(tidytuesdayR)
library(ggplot2)
library(dplyr)
library(waffle)
library(yarrr)
library(emojifont)
library(extrafont)

vek8<-c("B 737"=264,"A-320"=125,"ATR-42/72"=82,"A-330"=35,"Bombardier CL-600"=18,"B-777"=9,"D-328-100"=6, "Other"=10)
waffle(
  vek8/5,
  rows = 10 ,use_glyph = "paper-plane", glyph_size = 6,
  xlab="1 square = 5 aircraft" ,
  flip=TRUE
)+
  guides(fill = guide_legend(title = NULL))+
  labs(
    title = 'Number of Indonesian Civil Aircraft (2019)',
    subtitle = 'Based on Air Operator Certificate (AOC) \nBy Aircraft Type',
    caption = 'Datasource: \n Central Agency on Statistics \n Air Transportation Statistics 2019')+
  theme(
    plot.title = element_text(size = 20, face = 'bold', margin = margin(b = 10)),
    plot.subtitle = element_text(size = 16, margin = margin(b = 20)),
    plot.caption = element_text(size = 12, margin = margin(t = 20)),
    plot.background = element_rect(fill = '#F3F7F7'),
    plot.margin = unit(c(1.5, 1.5, 1.5, 1.5), 'cm')
  )