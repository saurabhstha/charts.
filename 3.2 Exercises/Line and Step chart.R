##import dependecies
library(ggplot2)
library(readxl)

## set working directory
setwd("C:/Users/Saurabh/Desktop/640/Week 5&6")

# Load the dataset
df <- read_excel('C:/Users/Saurabh/Desktop/640/Week 3&4/world-population.xlsm')

## Create the line chart
ggplot(df, aes(x = Year, y = Population/1000000)) + geom_line(color = 'red', 
                                                              size = 1) 
## Step chart
ggplot(df, aes(x= Year, y = Population/1000000)) + geom_step(color = 'blue',
                                                             size = 0.6)
