library(tidyverse)
library(caret)
ch43=read.csv("C:/gskim//SSA/r/2days/data1/ch43.csv")
# Multiple Linear Regression 
model<- lm(y ~ x1 + x2, data=ch43)
summary(model) # show results1
summary(model)$coef # show results2
# Predict electicity quantity
newdata <- data.frame(x1=26, x2 = 3)
# Predict sales values
model %>% predict(newdata)

# Other useful functions 
fit <- lm(y ~ x1 + x2, data=ch43)
coefficients(fit) # model coefficients
confint(fit, level=0.95) # CIs for model parameters 
fitted(fit) # predicted values
residuals(fit) # residuals
anova(fit) # anova table 
vcov(fit) # covariance matrix for model parameters 
influence(fit) # regression diagnostics
# Evaluate Collinearity
library(car)
vif(fit) # variance inflation factors 
sqrt(vif(fit)) > 2 # problem?

library(ggplot2)
ggplot(ch43, aes(x = x1, y = y)) +  geom_point() +  stat_smooth(method="lm")
ggplot(ch43, aes(x = x2, y = y)) +  geom_point() +  stat_smooth(method="lm")