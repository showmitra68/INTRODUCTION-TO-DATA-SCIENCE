myarray <- array(1:20, c(2,3,2))
myarray
me <- array(1:20, c(3,3,3))
me
myarray [,c(1),2]
myarray[1,2,1]
myarray[,2,1]

PatientID <- c(1,2,3,4,5,6)
Age <- c(25,30,35,40,45,50)
Diabates <- c("Type1","Type2","Type3","Type2","Type3","Type1")
Status <- c("Poor","Improved","Poor","Excellent","Improved","Excellent")
Patientdata <- data.frame(PatientID,Age,Diabates,Status)


Patientdata
newrow <- rbind(Patientdata, c(7,55,"Type2","Poor"))
newrow
Patientdata$Bloodgroup <- c("O+","O+","A+","B+","O+","B+")
Patientdata
install.packages("tibble")
library("tibble")
Name <- c("Tonmoy","Nill","Showmitra","Borhan","Asif","Hajjaj")
cbind(Patientdata,Name)
add_column(Patientdata,Name,.after=1)
Patientdata[1:2]
