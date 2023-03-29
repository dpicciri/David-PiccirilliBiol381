
#based on Biochar 4 Crops lettuce data

library(stats)
library(dplyr)
library(tidyverse)
library(ggplot2)

n=6
# n is the sample size
control<-rnorm(n, mean=350, sd=50)
#the control temperature variation
h.temp<-rnorm(n, mean=700, sd=50)
# high temperatur variation
l.temp<-rnorm(n, mean=500, sd=50)
#low temperature variation 
  dataFrame <- data.frame(control,h.temp,l.temp)
  # full data frame
  summary(control)
  summary(h.temp)
  summary(l.temp)
  
  # summary of the vectors
  newdata<-pivot_longer(dataFrame,cols= everything(), names_to = "treatments", values_to="temperature")
  print(newdata)
  # pivoted data set to be used in the boxplot, easily manipulated
  
  plot(control)
  plot(h.temp)
  plot(l.temp)

boxplot(control,l.temp,h.temp, data=newdata, xlab= "treatment",col="lightsteelblue" )
summary(aov(newdata$temperature~newdata$treatments)) 
# p-value = 6.26e-8
#as the sample becomes larger the test becomes more significant as a lower value each time the sample size is increased. 
# even with a value of 2 the data is still significant. the test resulted in p-value= 0.0255.

