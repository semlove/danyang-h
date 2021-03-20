# Two-way Anova 
ch33=read.csv("C:/gskim/SSA/r/2days/data1/ch33.csv")
fit <- aov(yield ~ temp + pre + temp*pre, data=ch33)
anova(fit)

# Description Statistics
with(ch33, tapply(yield, temp, mean))
with(ch33, tapply(yield, temp, mean))

# generate dataset
library(plyr)
nd<-ddply(ch33, c("pre","temp"), summarise, nyield=mean(yield))

# interaction plots
library("ggplot2")
library(plotly)
ig<-ggplot(nd, aes(x=pre, y = nyield, color = temp, group = temp)) + geom_line()
ggplotly(ig)