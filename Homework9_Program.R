# Homework 9
# 29 March 2023

# ------------Library------------------
library(tidyverse)
library(dplyr)
# ------------Functions------------------
source("Homework9_Functions.R") 

# ------------Global variables------------------
morph_file<-"Morphometric_Analysis.csv"
# ------------Program Body------------------
morph<- get_data(FileName=morph_file)

clean_morph<-clean_data(var1=morph$Total_Body_Length, var2=morph$Right_Wing_Length)

New_dataset<-random_data(clean_data=clean_morph,var1=var1, var2=var2, n=34)

morph_data<- plot_data(filename=New_dataset, xlab="Total Body Length", ylab="Right Wing Length")

table<-summary_table(clean_data=New_dataset)
