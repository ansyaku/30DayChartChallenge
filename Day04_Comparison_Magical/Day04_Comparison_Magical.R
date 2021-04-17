---
title: "Worldcloud of Bible (Old Testament & New Testament)"
author: "Andreas Syaloom Kurniawan"
date: "April 4th, 2021"
---


# Load the package
library("tm")
library("SnowballC")
library("wordcloud2")
library("RColorBrewer")

#-----------------------------------------------------------------------
#LOAD DATA AND CHANGING TO CORPUS FORMAT

# Load bible data
old_tst <- readLines("./02_Data Challenge/oldt.csv")
new_tst <- readLines("./02_Data Challenge/newt.csv")

# Change into corpus
corp_old <- Corpus(VectorSource(old_tst))
corp_new <- Corpus(VectorSource(new_tst))

#-----------------------------------------------------------------------
#CLEANING THE TEXT

#you can check your how's your corpus data look like by this command
#inspect(corp_old)

# Remove numbers
corp_old <- tm_map(corp_old, removeNumbers)
corp_new <- tm_map(corp_new, removeNumbers)

# remove extra whitespace
corp_old <- tm_map(corp_old, stripWhitespace)
corp_new <- tm_map(corp_new, stripWhitespace)

# convert to lower case
corp_old <- tm_map(corp_old, content_transformer(tolower))
corp_new <- tm_map(corp_new, content_transformer(tolower))

# remove anything other than English letters or space
removeNumPunct <- function(x) gsub("[^[:alpha:][:space:]]*", "", x)
corp_old <- tm_map(corp_old, content_transformer(removeNumPunct))
corp_new<-tm_map(corp_new, content_transformer(removeNumPunct))

# Remove punctuations
corp_old <- tm_map(corp_old, removePunctuation)
corp_new <- tm_map(corp_new, removePunctuation)

# remove stopwords
corp_old <- tm_map(corp_old, removeWords, stopwords("english"))
corp_new <- tm_map(corp_new, removeWords, stopwords("english"))

# remove custom stopwords.
add_stopwords <- c(setdiff(stopwords('english'), c("r", "big")),"unto", "shall", "thee", "thou","thy", "upon","every")
corp_old <- tm_map(corp_old, removeWords, add_stopwords)
corp_new <- tm_map(corp_new, removeWords, add_stopwords)

#-----------------------------------------------------------------------
#BUILDING A TERM DOCUMENT MATRIX

tdm_corp_old <- TermDocumentMatrix(corp_old)
tdm_corp_new <- TermDocumentMatrix(corp_new)

mtrx_old <- as.matrix(tdm_corp_old)
mtrx_srt_old <- sort(rowSums(mtrx_old),decreasing=TRUE)
mtrx_df_old <- data.frame(word = names(mtrx_srt_old),freq=mtrx_srt_old)
head(mtrx_df_old, 20)

mtrx_new <- as.matrix(tdm_corp_new)
mtrx_srt_new <- sort(rowSums(mtrx_new),decreasing=TRUE)
mtrx_df_new <- data.frame(word = names(mtrx_srt_new),freq=mtrx_srt_new)
head(mtrx_df_new, 10)

#-----------------------------------------------------------------------
#DISPLAYING WORDCLOUD

library(wordcloud2)
wordcloud2(mtrx_df_old, size = 1.5, 
           color = "#3b474b", 
           backgroundColor="#b8e3f2", 
           minRotation = -pi/6, 
           maxRotation = -pi/6, 
           rotateRatio = 1, 
           shape='circle')

library(wordcloud2)
wordcloud2(, size = 1.5, 
           color = "#3b474b", 
           backgroundColor="#eef0b1", 
           minRotation = -pi/6, 
           maxRotation = -pi/6, 
           rotateRatio = 1, 
           shape='circle')
#-----------------------------------------------------------------------
#EXPORTING THE RESULT

# install webshot
library(webshot)
webshot::install_phantomjs()

# Make the graph
my_graph <- wordcloud2(mtrx_df_old, size=1.5)

# save it in html
library("htmlwidgets")
saveWidget(my_graph,"tmp.html",selfcontained = F)

# and in png or pdf
webshot("tmp.html","fig_1.png", delay =5, vwidth = 480, vheight=480)