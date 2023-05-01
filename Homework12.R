
# ------------Library------------------
library(ggplot2)
library(ggthemes)
library(patchwork)
# ------------Global variables------------------

morph<-read.csv("Morphometric_Analysis_Values - Sheet1.csv")
print(morph)
rwing<-morph$Right_Wing_Length
# ------------Program Body------------------
# graph data 

#Boxplot and anova

g1<- ggplot(data=morph)+
  aes(x=X, y=rwing, fill=rwing)+
  xlab("treatment") +
  ylab("right wing length (mm)")+
  geom_boxplot(fill=c("springgreen3", "orchid2"), col="black")+
  theme(legend.position = "none")
print(g1)


g2<- ggplot(data=morph)+
  aes(x=X, y=Total_Body_Length, fill=Total_Body_Length)+
  xlab("treatment") +
  ylab("total body length (mm)")+
  geom_boxplot(fill=c("springgreen3", "orchid2"), col="black")+
  theme(legend.position = "none")
print(g2)

g3<- ggplot(data=morph)+
  aes(x=X, y=Ovipositor_Length, fill=Ovipositor_Length)+
  xlab("treatment") +
  ylab(" ovipositor length (mm)")+
  geom_boxplot(fill=c("springgreen3", "orchid2"), col="black")+
  theme(legend.position = "none")
print(g3)


g4<- ggplot(data=morph)+
  aes(x=X, y=Head_R_L, fill=Head_R_L)+
  xlab("treatment") +
  ylab("head right to left")+
  geom_boxplot(fill=c("springgreen3", "orchid2"), col="black")+
  theme(legend.position = "none")
print(g4)

  
  g1+g2+g3+g4

# scatter plot graph
  m1 <- ggplot(data=morph) + 
    aes(x=Total_Body_Length,y=Head_R_L) +
    geom_point(size=3, col="violet") +
  geom_smooth(method="lm", col="grey9")
  print(m1)
  
  
  # Histogram for Total body length comparing the covered and uncovered groups
hist<-ggplot(data=morph)+
  aes(x=Total_Body_Length) + 
  geom_histogram(fill="steelblue3",
                 color="black")
print(hist)




