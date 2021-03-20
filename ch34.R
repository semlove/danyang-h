# MANOVA test
ch34=read.csv("C:/gskim/SSA/r/2days/data1/ch34.csv")
res.man <- manova(cbind(Attention, Purchase) ~ Customer + Product + Customer*Product, data = ch34)
# Look to see which differ
summary.aov(res.man)

# generate dataset
library(plyr)
nd1<-ddply(ch34, c("Customer","Product"), summarise, NAttention=mean(Attention))
nd2<-ddply(ch34, c("Customer","Product"), summarise, NPurchase=mean(Purchase))


# interaction plots
library("ggplot2")
library(plotly)
ig1<-ggplot(nd1, aes(x=Customer, y = NAttention, color = Product, group = Product)) + geom_line()
ig2<-ggplot(nd2, aes(x=Customer, y = NPurchase, color = Product, group = Product)) + geom_line()
ggplotly(ig1)
ggplotly(ig2)