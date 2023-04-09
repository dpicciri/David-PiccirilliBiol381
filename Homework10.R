#Homework 10
#DAP 
# April 5, 2023

d<-(c(0, 5,6 ,7, 8, 1, 3, 0, 0, 0, 9, 6, 4, 2, 3, 4, 5, 6, 7, 0, 0))
counter<- 0 
# find the number of zeros in the list numbers
for(i in 1:length(d)){
  if (d[i]==0){
counter<-  counter+1
  }}

# find how many zeros are in the list again

zeros<- d[d==0]
length(zeros)

new_matrix<-function(i, j){
d<- matrix(runif(i*j), nrow = i, ncol=j)

for(i in 1:nrow(d)){
  for(j in 1:ncol(d)){
    d[i,j]<- i*j
  }
}
return(d)
}

new_matrix(4,5)


# ------------Question #3------------------
library(tidyverse)

x<-rnorm(1:20)
y<-rnorm(50:300)
z<-rnorm(20:50)
mean_x<-mean(x)
mean_y<-mean(y)
mean_z<-mean(z)

data<-data.frame(x,y,z)

matrix_long<-pivot_longer(data, cols=c(x,y,z),names_to="group", values_to="response" )

reshuffle <- sample(matrix_long$response)
print(reshuffle)
