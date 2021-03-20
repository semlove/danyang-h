# Neural Network

library(nnet)
library(NeuralNetTools)
library(neuralnet)
x<-seq(-6, 6, 0.5)
y<-1/(1+exp(-x)) + rnorm(length(x), 0, 0.03)
plot(x,y)
nn.reg<-nnet(x,y,size=3,maxit = 100)
summary(nn.reg)
plotnet(nn.reg)
