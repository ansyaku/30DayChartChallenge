---
title: "Flight Connection (Route) Between Province Capital City in Indonesia"
author: "Andreas Syaloom Kurniawan"
date: "April 19th, 2021"
---
  
# Loading package
  
# Load the circlize library
library(circlize)

options(repr.plot.width=40, repr.plot.height=40) 
# Create an edge list: a list of connections between two province (capital city of province) in Indonesia
data_pswt<-read.csv("rute.csv",header=TRUE, stringsAsFactors=FALSE)
rute <- data.frame(asal=data_pswt$Kota.Asal, tujuan=data_pswt$Kota.Tujuan)
head(rute, n=5)
# Transform input data in a adjacency matrix
adjacencyData <- with(rute, table(dft$asal, dft$tujuan)) 

# Make the circular plot
chordDiagram(adjacencyData, transparency = 0.5)
par(cex = 4, mar = c(2, 2, 2, 2))
title("Airlines Connection Between Capital City of Province in Indonesia\n [@ansyaku|Day11:Circular]")