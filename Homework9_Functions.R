#####################################
# FUNCTION: get_data
# packages: none
# purpose: find data
# input: the file name
# output: the file
#-----------------------------------
get_data<-function(FileName) {
morph<- read.csv(FileName)

return(morph)
}

#####################################
# FUNCTION: clean_data
# packages: none
# purpose: pull the indiviudal variable columns need in the tests 
# input: var1 and var2 
# output: a new data frame with the selected columns
#-----------------------------------
clean_data<-function(var1, var2)
  {
 DataFrame<-data.frame(var1, var2)
 
  return(DataFrame)
}

#####################################
# FUNCTION: random_data
# packages: none
# purpose: create random data from the data set, the parameters of the data set
# input: data frame 
# output: randomized data and the mean
#-----------------------------------
random_data<-function(clean_data, var1, var2, n)
{
  mean_1<- mean(clean_data$var1, na.rm=TRUE)
  mean_2<-mean(clean_data$var2, na.rm=TRUE
  )
  sd_1<-sd(clean_data$var1, na.rm=TRUE)
  sd_2<-sd(clean_data$var2, na.rm=TRUE)
  rand_1<-abs(rnorm(clean_data$var1))
  rand_2<-abs(rnorm(clean_data$var2))
  rand_data<-data.frame(rand_1, rand_2)
  return(rand_data)
}  


#####################################
# FUNCTION: plot_data
# packages: none
# purpose: make a scatter plot of the data and a regression line
# input: file name, and 2 different variables from the data set
# output: the scatter plot of the data with a regression line
#-----------------------------------
plot_data<-function(filename, xlab, ylab)
  {
  scatterplot<-plot(filename$rand_1, filename$rand_2, xlab=xlab, ylab=ylab)
  regression_line<- lm(filename$rand_2 ~ filename$rand_1, data=filename)
  abline(regression_line)
return(scatterplot)
}

#####################################
# FUNCTION: summary table
# packages: none
# purpose: make a table with the sd, mean, range
# input: dataset 
# output: sd, mean, and range of the data
#-----------------------------------
summary_table <-function(clean_data){

  mean_1<- mean(clean_data[,1], na.rm=TRUE)
  mean_2<-mean(clean_data[,2], na.rm=TRUE)
  sd_1<-sd(clean_data[,1], na.rm=TRUE)
  sd_2<-sd(clean_data[,2], na.rm=TRUE)
  range_1<- range(clean_data[,1], na.rm=TRUE)
  range_2<- range(clean_data[,2], na.rm=TRUE)
m <-matrix(c(mean_1, mean_2, sd_1, sd_2, range_1, range_2))

table<- data.frame(m)
  return(table)
}





