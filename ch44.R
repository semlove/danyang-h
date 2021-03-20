ch44=read.csv("C:/gskim/SSA/r/2days/data1/ch44.csv")
# Logistic Regression
# where y is a binary factor and x1-x3 are continuous predictors
str(ch44)
fit.full<-glm(y~., data=ch44, family=binomial)
summary(fit.full) # display results
confint(fit.full) # 95% CI for the coefficients
# diagnostics plots
layout(matrix(c(1,2,3,4),2,2)) #optional 4 graphs/page
plot(fit.full)
testdata=read.csv("C:/gskim/SSA/r/2days/data1/testdata.csv")
testdata$prob<-predict(fit.full, newdata=testdata,type="response")
testdata