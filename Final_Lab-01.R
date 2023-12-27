mydata<-read.csv("H:/USArrests.csv")
mydata
str(mydata)

mydata = scale(mydata[,2:5])
summary(mydata)

install.packages("cluster")
library(cluster)
set.seed(123)
kresults = pam(mydata, k=4)
summary(kresults)

plot(kresults)
Hit
Hit