# Randomized Block Design (B is the blocking factor) 
ch32=read.csv("C:/gskim/SSA/r/3days/data/ch32.csv")
fit <- aov(yield ~ worker+machine, data=ch32)
anova(fit)
# Description Statistics
tapply(ch32$yield, ch32$worker, mean)
tapply(ch32$yield, ch32$machine, mean)
tapply(ch32$yield, list(ch32$worker,ch32$machine), mean)
# Posthoc analysis
TukeyHSD(fit)
# Boxplot graph
boxplot(yield ~ worker + machine,col="red",data=ch32)
# diagnostic plots
plot(fit)