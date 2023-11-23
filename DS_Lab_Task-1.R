a= scan ("E:/DS_Lab.txt",what ="")
print(a)

B <-matrix(1:15, nrow = 3,ncol =5)
print(B)
B[3,]
B[,5]
B[1,3]
A <-matrix(1:15,nrow = 3,ncol = 5)
print(A)
A+B

num_vect <-c(2,3,5,9,12,15)
divisible_by_5 <-sum(num_vect  %% 5 == 0)
divisible_by_5

numeric_vect<-c(30,50,70,90)
numeric_vect <- append(numeric_vect, 40)
numeric_vect <- numeric_vect[numeric_vect!=70]
print(numeric_vect)

install.packages("dplyr")
library(dplyr)

person <- c("Stan","Francine","Steve","Roger","Abigail","Klaus")
sex <- c("M","F","M","M","F","M")
funny <- c("High","Med","Low","High","High","Med")
dataframe <- data.frame(person,sex,funny)
dataframe

person <- c("Fredrico","Roberta","Alfred","Bruce")
age <- c(42,37,19,35)
sex <- c("M","F","M","M")
funny <- c("High","Med","Low","High")
dataframe2 <- data.frame(person,age,sex,funny)
dataframe2

mydataframe <- bind_rows(dataframe,dataframe2)
mydataframe
find_data <- mydataframe[mydataframe$sex == "F"  & mydataframe$funny %in% c("High", "Low"), c("person","age")]
find_data