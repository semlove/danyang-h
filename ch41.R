ch41=read.csv("C:/gskim/r/2days/data1/ch41.csv")
# Covariance among numeric variables in data set 
cov(ch41, use="complete.obs")
# Correlations among numeric variables in data set 
cor.test(ch41$x,ch41$y,method="pearson")
cor.test(ch41$x,ch41$z,method="pearson")
cor.test(ch41$y,ch41$z,method="pearson")

library('corrplot') #package corrplot
M<-cor(ch41)
corrplot(M, method = "circle") #plot matrix
corrplot(M, type="upper", order="hclust", 
         tl.col="black", tl.srt=45)