# independent 2-group t-test
ch21=read.csv("C:/gskim/SSA/r/2days/data1/ch21.csv")
t.test(score~school,ch21) # where score is numeric and school is a binary factor
boxplot(score~school,data=ch21,
        ylab="mean point", xlab="name of school", col="lightgray")
