library(data.table) #  transpose()
library(corrplot) #  correlation plot
library(gridExtra) #  multiplot
library(ggplot2)
library(readxl)
library(dplyr)
library(svglite)
library(ggplot2)
library(reshape2)
library(ggthemes)
library("ggsci")
library(viridis)
library(reshape2)
library(ggpubr)


my_data <- read_excel("data.xlsx")

my_data<-data.frame(my_data)
my_data$Familiarity[my_data$Familiarity=="Never used a programming language or seen code snippets in my life"]<-1
my_data$Familiarity[my_data$Familiarity=="Have not written any code myself but have seen code snippets of some languages"]<-2
my_data$Familiarity[my_data$Familiarity=="Have used 1 or 2 languages but not proficient"]<-3
my_data$Familiarity[my_data$Familiarity=="Advanced/proficient user of 1 language and moderately experienced in others"]<-4
my_data$Familiarity[my_data$Familiarity=="Programming whiz in many languages"]<-5


my_data_without_familiarity<-my_data[-c(1)]

my_data_readability<-my_data[-c(1,2,3,5,7,9,11,13,15)]
colnames(my_data_readability)<-c("C","C++","Java","Javascript","Python","R")

new_programmer_data <- my_data[ which(my_data$Familiarity<3), ]
new_programmer_readability<-new_programmer_data[-c(1,2,3,5,7,9,11,13,15)]
colnames(new_programmer_readability)<-c("C","C++","Java","Javascript","Python","R")

old_programmer_data <- my_data[ which(my_data$Familiarity>=3), ]
old_programmer_readability<-old_programmer_data[-c(1,2,3,5,7,9,11,13,15)]
colnames(old_programmer_readability)<-c("C","C++","Java","Javascript","Python","R")

my_data_writability<-my_data[-c(1,2,3,4,6,8,10,12,14)]
colnames(my_data_writability)<-c("C","C++","Java","Javascript","Python","R")

new_programmer_writability<-new_programmer_data[-c(1,2,3,4,6,8,10,12,14)]
colnames(new_programmer_writability)<-c("C","C++","Java","Javascript","Python","R")

old_programmer_writability<-old_programmer_data[-c(1,2,3,4,6,8,10,12,14)]
colnames(old_programmer_writability)<-c("C","C++","Java","Javascript","Python","R")


C_red<-my_data_readability$C
Cpp_red<-my_data_readability$C
Java_red<-my_data_readability$Java
JS_red<-my_data_readability$Javascript
Python_red<-my_data_readability$Python
R_red<-my_data_readability$R


boxplot(C_red,Cpp_red,Java_red,JS_red,Python_red,R_red,
        main = "Multiple boxplots for Readability comparision",
        at = c(1,2,3,4,5,6),
        names = c("C","C++","Java","Javascript","Python","R"),
        las = 2,
        col = c("red","orange","yellow","green","blue","purple"),
        border = "brown",
        horizontal = TRUE,
        notch = FALSE
)


boxplot(my_data_readability)


data_long <- melt(my_data_readability)
head(data_long)


ggplot(data_long, aes(x=variable, y=value, fill=variable)) +
  geom_boxplot(alpha=0.3) +
  theme(legend.position="none")+
  coord_flip()



g1<-ggplot(data_long, aes(x=variable, y=value, fill=variable)) +
  geom_boxplot(alpha=0.3) +
  theme(legend.position="none")+
  theme_stata() + scale_fill_stata()+
  coord_flip()+
  theme(axis.text.y=element_text(angle=360, hjust=1))+
  ggtitle("Multiple boxplots for Readability comparison")+
  xlab("Languages")+
  ylab("Score")

ggsave("Readability boxplot.tiff",device='tiff', dpi="300")

readability_corrplot <- cor(my_data_readability)
c1<-corrplot(readability_corrplot, method = "circle")

# Get lower triangle of the correlation matrix
get_lower_tri<-function(c){
  c[upper.tri(c)] <- NA
  return(c)
}
# Get upper triangle of the correlation matrix
get_upper_tri <- function(c){
  c[lower.tri(c)]<- NA
  return(c)
}

upper_tri <- get_upper_tri(c1)
upper_tri

melted_cormat <- melt(upper_tri, na.rm = TRUE)

ggplot(data = melted_cormat, aes(Var2, Var1, fill = value))+
  geom_tile(color = "black")+ #outline
  scale_fill_gradient2(midpoint = 0.5, limit = c(0,1)) +scale_fill_viridis(option="magma")+
  coord_fixed()+theme_few()+
  ggtitle("Correlation plot for Readability comparison")+
  xlab("")+
  ylab("")+
  theme(plot.title = element_text(hjust = 0.5))

ggsave("Readability corrplot.tiff",device='tiff', dpi="print")

#--------------------------------------New programmer readabi;ity--------------

data2<-melt(new_programmer_readability)

ggplot(data2, aes(x=variable, y=value, fill=variable)) +
  geom_boxplot(alpha=0.3) +
  theme(legend.position="none")+
  theme_stata() + scale_fill_stata()+
  coord_flip()+
  theme(axis.text.y=element_text(angle=360, hjust=1))+
  ggtitle("Multiple boxplots for Readability comparison (Non programmers)")+
  xlab("Languages")+
  ylab("Score")

ggsave("Readability boxplot (non programmer).tiff",device='tiff', dpi="print")

readability_corrplot_new_programmer <- cor(new_programmer_readability)
c2<-corrplot(readability_corrplot_new_programmer, method = "circle")

upper_tri2 <- get_upper_tri(c2)
upper_tri2

melted_cormat2 <- melt(upper_tri2, na.rm = TRUE)

ggplot(data = melted_cormat2, aes(Var2, Var1, fill = value))+
  geom_tile(color = "black")+ #outline
  scale_fill_gradient2(midpoint = 0.5, limit = c(0,1)) +scale_fill_viridis(option="magma")+
  coord_fixed()+theme_few()+
  ggtitle("Correlation plot for Readability comparison (Non programmer)")+
  xlab("")+
  ylab("")+
  theme(plot.title = element_text(hjust = 0.5))

ggsave("Readability corrplot (non programmer).tiff",device='tiff', dpi="print")

#----------------------------Experienced programmer readbility-----------------------
data3<-melt(old_programmer_readability)

ggplot(data3, aes(x=variable, y=value, fill=variable)) +
  geom_boxplot(alpha=0.3) +
  theme(legend.position="none")+
  theme_stata() + scale_fill_stata()+
  coord_flip()+
  theme(axis.text.y=element_text(angle=360, hjust=1))+
  ggtitle("Multiple boxplots for Readability comparison (Experienced programmers)")+
  xlab("Languages")+
  ylab("Score")

ggsave("Readability boxplot (old programmer).tiff",device='tiff', dpi="print")

readability_corrplot_old_programmer <- cor(old_programmer_readability)
c3<-corrplot(readability_corrplot_old_programmer, method = "circle")

upper_tri3 <- get_upper_tri(c3)
upper_tri3

melted_cormat3 <- melt(upper_tri3, na.rm = TRUE)

ggplot(data = melted_cormat3, aes(Var2, Var1, fill = value))+
  geom_tile(color = "black")+ #outline
  scale_fill_gradient2(midpoint = 0.5, limit = c(0,1)) +scale_fill_viridis(option="magma")+
  coord_fixed()+theme_few()+
  ggtitle("Correlation plot for Readability comparison (Experienced programmer)")+
  xlab("")+
  ylab("")+
  theme(plot.title = element_text(hjust = 0.5))

ggsave("Readability corrplot (old programmer).tiff",device='tiff', dpi="print")

#-----------------general writability----------------
data4<-melt(my_data_writability)

ggplot(data4, aes(x=variable, y=value, fill=variable)) +
  geom_boxplot(alpha=0.3) +
  theme(legend.position="none")+
  theme_stata() + scale_fill_stata()+
  coord_flip()+
  theme(axis.text.y=element_text(angle=360, hjust=1))+
  ggtitle("Multiple boxplots for Writability comparison")+
  xlab("Languages")+
  ylab("Score")

ggsave("Writability boxplot.tiff",device='tiff', dpi="print")

writability_corrplot_my_data <- cor(my_data_writability)
c4<-corrplot(writability_corrplot_my_data, method = "circle")

upper_tri4 <- get_upper_tri(c4)
upper_tri4

melted_cormat4 <- melt(upper_tri4, na.rm = TRUE)

ggplot(data = melted_cormat4, aes(Var2, Var1, fill = value))+
  geom_tile(color = "black")+ #outline
  scale_fill_gradient2(midpoint = 0.5, limit = c(0,1)) +scale_fill_viridis(option="magma")+
  coord_fixed()+theme_few()+
  ggtitle("Correlation plot for Writability comparison ")+
  xlab("")+
  ylab("")+
  theme(plot.title = element_text(hjust = 0.5))

ggsave("Writability corrplot.tiff",device='tiff', dpi="print")

#------------------new programmer writability--------
data5<-melt(new_programmer_writability)

ggplot(data5, aes(x=variable, y=value, fill=variable)) +
  geom_boxplot(alpha=0.3) +
  theme(legend.position="none")+
  theme_stata() + scale_fill_stata()+
  coord_flip()+
  theme(axis.text.y=element_text(angle=360, hjust=1))+
  ggtitle("Multiple boxplots for Writability comparison (Non programmer)")+
  xlab("Languages")+
  ylab("Score")

ggsave("Writability boxplot(non programmer).tiff",device='tiff', dpi="print")

writability_corrplot_new_programmer <- cor(new_programmer_writability)
c5<-corrplot(writability_corrplot_new_programmer, method = "circle")

upper_tri5 <- get_upper_tri(c5)
upper_tri5

melted_cormat5 <- melt(upper_tri5, na.rm = TRUE)

ggplot(data = melted_cormat5, aes(Var2, Var1, fill = value))+
  geom_tile(color = "black")+ #outline
  scale_fill_gradient2(midpoint = 0.5, limit = c(0,1)) +scale_fill_viridis(option="magma")+
  coord_fixed()+theme_few()+
  ggtitle("Correlation plot for Writability comparison (Non programmer) ")+
  xlab("")+
  ylab("")+
  theme(plot.title = element_text(hjust = 0.5))

ggsave("Writability corrplot (non programmer).tiff",device='tiff', dpi="print")

#---------------old programmer writability------------
data6<-melt(old_programmer_writability)

ggplot(data6, aes(x=variable, y=value, fill=variable)) +
  geom_boxplot(alpha=0.3) +
  theme(legend.position="none")+
  theme_stata() + scale_fill_stata()+
  coord_flip()+
  theme(axis.text.y=element_text(angle=360, hjust=1))+
  ggtitle("Multiple boxplots for Writability comparison (Experienced programmer)")+
  xlab("Languages")+
  ylab("Score")

ggsave("Writability boxplot(old programmer).tiff",device='tiff', dpi="print")

writability_corrplot_old_programmer <- cor(old_programmer_writability)
c6<-corrplot(writability_corrplot_old_programmer, method = "circle")

upper_tri6 <- get_upper_tri(c6)
upper_tri6

melted_cormat6 <- melt(upper_tri6, na.rm = TRUE)

ggplot(data = melted_cormat6, aes(Var2, Var1, fill = value))+
  geom_tile(color = "black")+ #outline
  scale_fill_gradient2(midpoint = 0.5, limit = c(0,1)) +scale_fill_viridis(option="magma")+
  coord_fixed()+theme_few()+
  ggtitle("Correlation plot for Writability comparison (Experienced programmer) ")+
  xlab("")+
  ylab("")+
  theme(plot.title = element_text(hjust = 0.5))

ggsave("Writability corrplot (old programmer).tiff",device='tiff', dpi="print")

#--------stats general data----------
C_score<-sum(my_data$C_readability)
Cpp_score<-sum(my_data$C.._readability)
Java_score<-sum(my_data$Java_readability)
JS_score<-sum(my_data$Javascript_readability)
Python_score<-sum(my_data$Python_readability)
R_score<-sum(my_data$R_readability)

scores<-c(C_score,Cpp_score,Java_score,JS_score,Python_score,R_score)
labels <- c("C","C++","Java","Javascript","Python","R")

readability_importance<-sum(my_data$Importance_Reliability)/58
writability_importance<-sum(my_data$Importance_Writability)/58


readability_importance_new_programmer<-sum(new_programmer_data$Importance_Reliability)/nrow(new_programmer_data)
writability_importance_new_programmer<-sum(new_programmer_data$Importance_Writability)/nrow(new_programmer_data)


readability_importance_old_programmer<-sum(old_programmer_data$Importance_Reliability)/nrow(old_programmer_data)
writability_importance_old_programmer<-sum(old_programmer_data$Importance_Writability)/nrow(old_programmer_data)

#non programmers do not understand the importance of readability & writability


g1<-ggplot(data_long, aes(x=variable, y=value, fill=variable)) +
  geom_boxplot(alpha=0.3) +
  theme(legend.position="none")+
  theme_stata() + scale_fill_stata()+
  coord_flip()+
  theme(axis.text.y=element_text(angle=360, hjust=1))+
  ggtitle("Multiple boxplots for Readability comparison")+
  xlab("Languages")+
  ylab("Score")

g2<- ggplot(data2, aes(x=variable, y=value, fill=variable)) +
  geom_boxplot(alpha=0.3) +
  theme(legend.position="none")+
  theme_stata() + scale_fill_stata()+
  coord_flip()+
  theme(axis.text.y=element_text(angle=360, hjust=1))+
  ggtitle("Multiple boxplots for Readability comparison (Non programmers)")+
  xlab("Languages")+
  ylab("Score")

g3<- ggplot(data3, aes(x=variable, y=value, fill=variable)) +
  geom_boxplot(alpha=0.3) +
  theme(legend.position="none")+
  theme_stata() + scale_fill_stata()+
  coord_flip()+
  theme(axis.text.y=element_text(angle=360, hjust=1))+
  ggtitle("Multiple boxplots for Readability comparison (Experienced programmers)")+
  xlab("Languages")+
  ylab("Score")



grid.arrange(g1, g2, g3 + rremove("x.text"), 
             ncol = 1, nrow = 3)

ggsave("Readability boxplot_new.tiff",device='tiff' )

#