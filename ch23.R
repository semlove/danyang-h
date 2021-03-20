# independent 2-group t-test
ch21=read.csv("C:/gskim/SSA/r/2days/data1/ch21.csv")
t.test(score~school,ch21)# where score is numeric and school is a binary factor
library(ggplot2)
library(plotly)
p1 <- ggplot(ch21, aes(x =school, y = score)) +
  geom_boxplot()+
  stat_summary(fun="mean", geom="point", shape=22, size=3, fill="blue") 
ggplotly(p1)