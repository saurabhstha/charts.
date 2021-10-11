install.packages("treemap")

# import libraries
library(ggplot2)
library("xlsx")
library(reshape2)
library("dplyr") 
library(numbers)
library("treemap")

## set working directory
setwd("C:/Users/Saurabh/Desktop/640/Week 5&6")

# Import "expenditures.txt" and "unemployement-rate-1948-2010.csv" for analysis
expenditures <- read.table(file = "expenditures.txt", header = TRUE, sep = '\t', dec = '.', fill = TRUE)
unemployement <- read.csv2(file = "unemployement-rate-1948-2010.csv", header = TRUE, sep=',')
unemployement$Value <- as.numeric(as.character(unemployement$Value))


# Tree maps

treemap::treemap(expenditures,index = c('category'),
                 vSize = 'expenditure',
                 title = 'Expenditure by Category')


# Area charts
# Calculate mean rating
unemployement_total = aggregate(Value ~ Year, unemployement, mean)
Area_Plt <- ggplot(unemployement_total, ggplot2::aes(x=Year , y=`Value`)) +
  geom_area( fill='blue', alpha=.2) +
  geom_line() +
  ylab("Mean Rate") +
  ggtitle('Unemployment Rate By Year')
Area_Plt


# Stacked area charts
Stack_Area <- ggplot(expenditures, aes(x=year, y=expenditure, fill=category)) +
  geom_area() +
  ggtitle('Expenditures By Year')
Stack_Area