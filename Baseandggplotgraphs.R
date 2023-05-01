# using base graphics for quick plotting 
# indtroduction to ggplot
# 13 April, 2023
#DAP

library(ggplot2)
library(patchwork)
library(ggthemes)

d<- mpg # use the R data frame 
str(d) # set up the data being used from R

###### BASE R ##########
# basic histogram (1 variable, continuous)
hist(d$hwy)

#basic density plot
plot(density(d$hwy))
# smooth line plot
#discrete variable
table(d$fl)
table(d$fl, d$drv)

#basic barplot
barplot(table(d$fl))

#alternative using plot function
plot(table(d$fl), type="h",lwd=10)


# basic bar plot (1 variable, continuous)
mass <- c(con=10.5, trt=12.5, trt2=2)
barplot(mass)

boxplot(d$cty~d$fl)
# the first variable is the y and the second after the "~" is teh x variable

# basic scatter plot (2 continuous variables)
cause<- runif(20)
effect<- runif(20)
plot(cause~effect)


# basic bubble plot (3 continuous variables)
covariate <- 1:20
cause <- sort(cause)
plot(effect~cause,cex=0.5*covariate)
print(data.frame(cause,effect,covariate))
# cex is character expansion, expand the size of the point 


# ------------Line Graphs------------------

plot(runif(20)~runif(20), type="l")
# type of L with give a line plot connecting the dots fo the graph 

plot(runif(20)~runif(20), type="b", col= "green4")

# basic curves and functions (use small line segments)
x_var <- seq(1,100,by=0.1)
my_fun <- function(x) sin(x) + 0.1*x
# quick function does not need {} bc on one line
y_var <- my_fun(x_var)

plot(y_var~x_var, type="l")
# connect the dots 



# build a density plot function (smooth plot line)
# built in stats density functions
my_vec <- seq(1,100,by=0.1)
plot(dgamma(my_vec,shape=5,scale=3),type="l")


# ------------GGPLOT2------------------
d <- mpg
p1 <- ggplot(data=d)+
  aes(x=displ,y=cty)+
  geom_point()

print(p1)

p1 + theme_bw() # good with grid lines
p1 + theme_classic() # no grid lines
p1 + theme_linedraw() # black frame
p1 + theme_dark() # good for brightly colored points
p1 + theme_base() # mimics base R
p1 + theme_par() # matches current par settings in base
p1 + theme_void() # shows data only
p1 + theme_solarized() # good for web pages
p1 + theme_economist() # many specialized themes
p1 + theme_grey() # ggplots default theme

# ------------Major theme modifications------------------
d <- mpg
p1 <- ggplot(data=d, mapping=aes(x=displ,y=cty)) + geom_point()
print(p1)
# use theme parameters to modify font and font size
p1 + theme_classic(base_size=20,base_family="serif")
# defaults: theme_grey, base_size=16,base_family="Helvetica")
# font families (Mac): Times, Ariel, Monaco, Courier, Helvetica, serif,sans

# make the words/ labels large so everyone will be able to look at the paper and presentation easily


# use coordinate_flip to invert entire plot
p2 <- ggplot(data=d) +
  aes(x=fl,fill=fl) + 
  geom_bar()
print(p2)
p2 + coord_flip() + theme_grey(base_size=25,base_family="sans")

# need fill color and color to be filled statements in the geom_bar. 
p2 <- ggplot(data=d) +
  aes(x=fl) + 
  geom_bar(fill="lightsteelblue",color="black")
print(p2)


# minor theme mods
d <- mpg
p1 <- ggplot(data=d) +
  aes(x=displ,y=cty) + 
  geom_point(size=7,
             shape=8, # in the symbols sheet on gotell's cheet sheets
             color="black",
             fill="steelblue") +
  labs(title="My graph title here",
       subtitle="An extended subtitle that will print below the main title",
       x="My x axis label",
       y="My y axis label") +
  xlim(0,4) + ylim(0,20)
print(p1)

# snowflakes are shape = 8

# talk about color choice, there can be bad color combinations







## ggplot lecture II
# April 18, 2023

library(ggplot2)
library(ggthemes)
library(patchwork)
d <- mpg # use built in mpg data frame

print(d)
# can use inkspace as a way to edits the graphs after they are made in R

g1 <- ggplot(data=d) +
  aes(x=displ,y=cty) + 
  geom_point() + 
  geom_smooth()
print(g1)
# standard ggplot, smooth plot makes a local regression to fit the line around the real data.


g2 <- ggplot(data=d) +
  aes(x=fl) +
  geom_bar(fill="tomato",color="black")+ 
  theme(legend.position="none")
print(g2)
# bar plot with fill color and the boarder color

g3 <- ggplot(data=d) +
  aes(x=displ) + 
  geom_histogram(fill="steelblue3",
                 color="black")
print(g3)
# histogram with the blue color


g4 <- ggplot(data=d) +
  aes(x=fl,y=cty,fill=fl) + 
  geom_boxplot() + 
  theme(legend.position="none")

print(g4)
# uses the base R colors in their order 


g1 + g2
# put the two plots together side by side

g1 +g2 +g3 +plot_layout(ncol=1)


# change relative area of each plot
g1 + g2 + plot_layout(ncol=1,heights=c(2,1))



# use nested layouts
g1 + {
  g2 + {
    g3 +
      g4 +
      plot_layout(ncol=1)
  }
} +
  plot_layout(ncol=1)



g1 + g2 - g3 + plot_layout(ncol=1)

# / and | for intuitive layouts
(g1 | g2 | g3)/g4
(g1 | g2)/(g3 | g4)# make a square of the plots 

# Add title, etc. to a patchwork
g1 + g2 + plot_annotation('This is a title', 
                          caption = 'made with patchwork',
                          theme = theme(plot.title = element_text(size = 16))
)
# make the plot title and make the font size larger 


# Add tags to plots
g1 / (g2 | g3) +
  plot_annotation(tag_levels = 'A')

# the tags are good for papers to refer to the individual lots with a letter 


g3a <- g3 + scale_x_reverse()
g3b <- g3 + scale_y_reverse() 
g3c <- g3 + scale_x_reverse() + scale_y_reverse()

(g3 | g3a)/(g3b | g3c)

(g3 + coord_flip() | g3a + coord_flip())/(g3b + coord_flip() | g3c + coord_flip())
# flip the axis 

# ggsave command

ggsave(filename="Plots/MyPlot.pdf",plot=g3, width=20,height=20,units="cm",dpi=300)
#dpi -> dots per inch

# ------------Basic mapping of aesthetic variables------------------

# mapping of a discrete variable to point color
m1 <- ggplot(data=mpg) + 
  aes(x=displ,y=cty,color=class) +
  geom_point(size=3) 
print(m1)


# mapping of a discrete variable to point shape (<= 6)
m1 <- ggplot(data=mpg) + 
  aes(x=displ,y=cty,shape=class) + 
  geom_point(size=3) 
print(m1)

# mapping of a discrete variable to point size (not advised)
m1 <- ggplot(data=mpg) +                                   aes(x=displ,y=cty,size=class) + 
  geom_point() 
print(m1)


# mapping a continuous variable to point color
m1 <- ggplot(data=mpg) + 
  aes(x=displ,y=cty,color=hwy) + 
  geom_point(size=5) 
print(m1)


# use shape for smaller number of categories
m1 <- ggplot(data=mpg) + aes(x=displ,y=cty,shape=drv,color=fl) +  
  geom_point(size=5)  
# use all 3 (size, shape, color) to indicate 5 attributes!
m1 <- ggplot(data=mpg) +
  aes(x=displ,
      y=cty,shape=drv,
      color=fl,
      size=hwy) + 
  geom_point()
print(m1)


# mapping a variable to the same aesthetic in two different geoms
m1 <- ggplot(data=mpg) + 
  aes(x=displ,y=cty,color=drv) + 
  geom_point(size=2) +
  geom_smooth(method="lm")
print(m1)

# basic faceting with variables split by row, column, or both
# make a really large plot to show the individual data points 
#shows the relationships between the variables on each axis 
# there are some empty plots which have no data in this grid 
m1 <- ggplot(data=mpg) + 
  aes(x=displ,y=cty) + 
  geom_point() 

m1 +  facet_grid(class~fl)     
m1 + facet_grid(class~fl, scales="free_y")
# adjust y-axis data to fit the data better 
m1 + facet_grid(class~fl, scales="free")
# adjust both the x-axis and y-axis to be more comparible by not very nice looking

m1 + facet_grid(.~class)
m1 + facet_grid(class~.)
m1 +  facet_wrap(~class)    
m1 + facet_wrap(~class + fl) # only plots the graph with data and makes a plot of the type of car and fuel needed


# NOW WITH COLORS

m1 <- ggplot(data=mpg) +
  aes(x=displ,y=cty,color=drv) + 
  geom_point() 

m1 + facet_grid(.~class)



# add a group and fill mapping for subgroups
m1 <- ggplot(data=mpg) + aes(x=displ,y=cty,group=drv,fill=drv) + 
  geom_boxplot()

m1 + facet_grid(.~class)



p1 <- ggplot(data=d) + 
  aes(x=displ,y=hwy) +
  geom_point() + 
  geom_smooth()
print(p1)

# break out the drive types (note what color affects
p1 <- ggplot(data=d) +
  aes(x=displ,y=hwy, color=drv) +
  geom_point() + geom_smooth()
print(p1)





