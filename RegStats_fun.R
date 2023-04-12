##################################################
# function: reg_stats
# fits linear model, extracts statistics
# input: 2-column data frame (x and y)
# output: slope, p-value, and r2
#------------------------------------------------- 
reg_stats <- function(d=NULL, var1, var2) {
  if(is.null(d)) {
    x_var <- runif(10)
    y_var <- runif(10)
    d <- data.frame(x_var,y_var)
  }
  . <- lm(data=d,d[,2]~d[,3])# regression on the 2nd column on the 1st column 
  . <- summary(.) # set to a period (".")to make it easier to understand 
  stats_list <- list(slope=.$coefficients[2,1],
                     p_val=.$coefficients[2,4],
                     r2=.$r.squared)
  return(stats_list)
  
}

