# One Way Anova (Completely Randomized Design)
ch31=read.csv("C:/gskim/SSA/r/2days/data1/ch31.csv")
# normalization test
library(nortest)
qqnorm(ch31$satis) 
qqline(ch31$satis,lwd=1,col="red")
shapiro.test(ch31$satis)
# Bartlett Test of Homogeneity of Variances
bartlett.test(satis~com, data=ch31)
# interactive diagram examples
library(ggplot2)
library(plotly)
fit=aov(satis~com,data=ch31)
anova(fit)
# Description statistics
with(ch31, tapply(satis,com,mean))
T<-TukeyHSD(fit)
plot(T)
ig<-ggplot(ch31, aes(x=com, y=satis)) +
  geom_boxplot(pch=17, color="navy", size=0.5) +
  labs(title="One way Anova", x="Company", y="Satisfaction Index")
ggplotly(ig)
#Non-parametric alternative to one-way ANOVA test
kruskal.test(satis~com,data=ch31)