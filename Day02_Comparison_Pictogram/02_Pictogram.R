library(tidyverse)
library(readxl)
library(echarts4r)
vulk <- read.table("./02_Data Challenge/volcanoes.txt", sep=",", header=TRUE)
vulk
library(echarts4r)
vulk %>%
  e_charts(Kepulauan, width = 800, height = 800) %>%
  e_pictorial(
    Jumlah,
    symbol="triangle",
    symbolRepeat = TRUE, 
    symbolClip = TRUE,
    symbolMargin = c(1,1),
    symbolSize = c(25, 25),
    legend=FALSE,
    name = " = 1 Volcano",
  ) %>%
  e_title(
    "Number of Active Volcanoes in Indonesia by Island",
    "Datasource: Ministry of Energy and Mineral Resources || 1 Triangle = 1 Volcanoes || @ansyaku"
  ) %>%
  e_color("#bf444c") %>%
  e_theme("essos")%>%
  e_toolbox() %>%
  e_toolbox_feature()