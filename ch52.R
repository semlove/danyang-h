#read data
redata=read.csv("C:/gskim/SSA/r/2days/data1/ch52.csv")
# Prepare Data
mydata <- na.omit(redata) # listwise deletion of missing
# Ward Hierarchical Clustering
d <- dist(mydata, method = "euclidean") # distance matrix
fit <- hclust(d, method="ward") 
plot(fit) # display dendogram
groups <- cutree(fit, k=3) # cut tree into 3 clusters
# draw dendogram with red borders around the 3 clusters 
rect.hclust(fit, k=3, border="red") 
library(psych)
describeBy(mydata, groups)