#import
library(ggplot2)
library(readxl)
library(dplyr)
library(plyr)
library(tidyverse)
library(ggrepel)
library(ggpubr)
library(reshape2)

##set working directory
setwd("C:/Users/Saurabh/Desktop/640/Week 1&2")


#load datasets
df <- read_excel("C:/Users/Saurabh/Desktop/640/Week 1&2/hotdog-contest-winners.xlsm")
df1 <- read_excel('C:/Users/Saurabh/Desktop/640/Week 1&2/obama-approval-ratings.xls')
df2 <- read_excel('C:/Users/Saurabh/Desktop/640/Week 1&2/hotdog-places.xlsm', col_names = FALSE)

print(df1)

##Create Bar chart
ggplot(df, aes(x=Country, y= 'Dogs eaten')) +
  geom_bar(stat = "identity", fill = 'steelblue')+
  ggtitle("Number of Hotdogs Eaten by Country")+
  theme_minimal()

#Stacked bar chart
## melt function helps segregating the column level data into corresponding rows for each of the values in Issue column. This will help further in preparation of Stack chart
df_melt <- melt(df1, id=c("Issue"))

## assign new column names to the newly created (melted) dataframe
colnames(df_melt) <- c("Issue", "Rating", "Value")

## Plot stack chart, assign labels and align horizontal for better readability
ggplot(df_melt, aes(x = Issue, y = Value, fill=Rating)) +
  ggtitle("Obama approval ratings for various issues") +
  geom_bar(stat='identity', position = "stack") + 
  coord_flip() + 
  theme_light()


##create the pie
piepercent<- round(100*x/sum(x), 1)

## Plot the Pie chart.
pie(df_subset$Value, labels =  pielabels, main = "Approval rating on Taxes(Obama)",col = rainbow(length(df_subset$Value)))
legend("topright", c("Approve","Disapprove","None"), cex = 0.8,
       fill = rainbow(length(df_subset$Value)))

##Create the donut chart
ggdonutchart(df_subset, "Value", label = rev(paste0(df_subset$Value, "%")), fill = "Rating", color = "white", palette = c("green4", "red", "yellow1")) +
  ggtitle("Obama Approval Rating for Taxes")
