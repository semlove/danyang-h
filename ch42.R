library(ggplot2)
library(GGally)
library(CCA)
library(CCP)
ch42=read.csv("C:/gskim/SSA/r/2days/data1/ch42.csv")
a<-(ch42)
X <- as.matrix(a[,1:2])  # the working attitude tests
Y <- as.matrix(a[,3:4])   # the performance variables
ggpairs(a)
res.cc=cc(X,Y)
plot(res.cc$cor,type="b")
plt.cc(res.cc)
estim.regul(X, Y, grid1 = NULL, grid2 = NULL, plt = TRUE)
matcor(X, Y)
cancor(X,Y)
res.cc=cc(X,Y)
plt.cc(res.cc)
res.cc=rcc(X,Y,0.1,0.2)
plt.cc(res.cc)
N = dim(X)[1]
p = dim(X)[2]
q = dim(Y)[2]
rho <- cancor(X,Y)$cor
res1 <- p.asym(rho, N, p, q)
plt.asym(res1,rhostart=1)
plt.asym(res1,rhostart=2)
p.perm(X, Y, nboot = 999, rhostart = 1, type = "Wilks")
