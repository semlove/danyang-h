# paired t-test
X1<-c(70,62,54,82,75,64,58,57,80,63)
X2<-c(68,62,50,75,76,57,60,53,74,60)

# Paired t test
t.test(X1,X2,paired = TRUE) # where X1 & X2 are numeric 

# visualiziation 1
boxplot(score~school,data=ch21,
        ylab="mean point", xlab="name of school", col="lightgray")

# visualiziation 2
# Create a data frame
my_data <- data.frame( 
  group = rep(c("X1", "X2"), each = 10),
  weight = c(X1,  X2))
# Print all data
print(my_data)

# Visualization
library("dplyr")
group_by(my_data, group) %>%
  summarise(
    count = n(),
    mean = mean(weight, na.rm = TRUE),
    sd = sd(weight, na.rm = TRUE))
# Plot weight by group and color by group

library("ggpubr")
ggboxplot(my_data, x = "group", y = "weight", 
          color = "group", palette = c("#00AFBB", "#E7B800"),
          order = c("X1", "X2"),
          ylab = "Weight", xlab = "Groups")