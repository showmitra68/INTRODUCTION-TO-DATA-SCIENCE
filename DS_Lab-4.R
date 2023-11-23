mydataset<-read.csv("E:/mydataset.csv",header=TRUE,sep=",")
mydataset
names(mydataset)
Gender <- c("M","F","M","F","M","M","F","F","M","F")
Newcolumn<- cbind(mydataset,Gender)
Newcolumn
Newcolumn$Gender <- factor(Newcolumn$Gender,levels = c("M","F"),labels = c(1,2))
Newcolumn
str(mydataset)
summary(mydataset)
s<-mydataset$Loan
sd(s)
d<-mydataset$interest_rate
sd(d)
is.na(mydataset) #missing values
colSums(is.na(mydataset))
which(is.na(mydataset$Loan))
which(is.na(mydataset$interest_rate))
remove<- na.omit(mydataset)
mydataset
remove
