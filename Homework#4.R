x<-1.1
a<-2.2
b<-3.3
## Problem 1

z<-x^a^b
print(z)
### 3.61714
z<-(x^a)^b
print(z)
### 1.997611
z<-3*(x^3)+2*(x^2)+1
print(z)
### 7.413

c(seq(1,8),seq(7,1))
#### output: 1 2 3 4 5 6 7 8 7 6 5 4 3 2 1

rep(1:5,c(1,2,3,4,5))
#### output:1 2 2 3 3 3 4 4 4 4 5 5 5 5 5

rep(5:1, c(1,2,3,4,5))
#### output:5 4 4 3 3 3 2 2 2 2 1 1 1 1 1

set.seed(0)
v<-runif(2)
y<-v[1]
x<-v[2]
r<- sqrt((x^2)+(y^2))
print(r)
#### output:0.9351795
theta<- atan(y/x)
print(theta)
#### output:1.282925


