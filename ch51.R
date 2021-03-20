#read data
ch51=read.csv("C:/gskim/SSA/r/2days/data1/ch51.csv")
# Prepare Data
mydata <- na.omit(ch51) # listwise deletion of missing
# Pricipal Components Analysis
# entering raw data and extracting PCs 
# from the correlation matrix 
fit <- princomp(mydata, cor=TRUE)
summary(fit) # print variance accounted for 
loadings(fit) # pc loadings 
plot(fit,type="lines") # scree plot 
fit$scores # the principal components
biplot(fit) 
# PCA Variable Factor Map 
library(FactoMineR)
install.packages("factoextra")
library(factoextra)
result <- PCA(mydata) # graphs generated automatically 
res.pca <- PCA(mydata,  graph = FALSE)
# Extract eigenvalues/variances
get_eig(res.pca)
# Visualize eigenvalues/variances
fviz_screeplot(res.pca, addlabels = TRUE, ylim = c(0, 50))
# Extract the results for variables
var <- get_pca_var(res.pca)
var
# Coordinates of variables
head(var$coord)
# Contribution of variables
head(var$contrib)
# Graph of variables: default plot
fviz_pca_var(res.pca, col.var = "black")
# Control variable colors using their contributions
fviz_pca_var(res.pca, col.var="contrib",
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
             repel = TRUE # Avoid text overlapping
             )
# Contributions of variables to PC1
fviz_contrib(res.pca, choice = "var", axes = 1, top = 10)

# Contributions of variables to PC2
fviz_contrib(res.pca, choice = "var", axes = 2, top = 10)

# Extract the results for individuals
ind <- get_pca_ind(res.pca)
ind
# Coordinates of individuals
head(ind$coord)
# Graph of individuals
# 1. Use repel = TRUE to avoid overplotting
# 2. Control automatically the color of individuals using the cos2
# cos2 = the quality of the individuals on the factor map
# Use points only
# 3. Use gradient color
fviz_pca_ind(res.pca, col.ind = "cos2", 
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
             repel = TRUE # Avoid text overlapping (slow if many points)
)
# Biplot of individuals and variables
fviz_pca_biplot(res.pca, repel = TRUE)

# Compute PCA on the iris data set
# The variable Species (index = 5) is removed
# before PCA analysis
iris.pca <- PCA(iris[,-5], graph = FALSE)
