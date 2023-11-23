i <- 1
while (i <6) {
  print (i)
  i <- i+1
}
i <- 1
while (i <6) {
  print (i)
  i <- i+1
  if (i == 4){
    break
  }
}
i <- 0
while (i <6) {
  i <- i+1
  if (i == 3){
    next
  }
  print(i)
}
for ( x in 1:10){
  print (x)
}
for ( x in 1:5){
  print (x)
}
for ( x in 1:2){
  for (y in 1:3){
    print(x*y)
  }
}
sum <- function(){
  print("Hello")
}
sum()
var1 = readline(prompt = "Enter any value : ")
var2 = readline(prompt = "Enter any number : ")

var2 = as.integer(var2)
print(var1)
print(var2)
x = scan()
print(x)
d = scan(what = double())
s = scan(what = "")
c = scan(what = character())
print(d)
print(s)
print(c)
s = scan("E:/DS.txt",what ="")
print(s)
a <- c(1,2,3,4,5,6,7,8)
b <- c("one", "two", "three", "four")
c <- c(TRUE,TRUE,FALSE,FALSE,TRUE,FALSE)
print(a)
print(b)
print(c)
x <- c(2,3,4,5)
x+2
x*3
x <- c(20,3,40,5,10)
sort(x)
sort(a,decreasing = TRUE)
sort(b,decreasing = TRUE)
x[1]
x[1:5]
x[c(2,4)]
x[c(1,5)]
m <- matrix(1:20,nrow = 5,ncol = 4)
print(m)
m <- matrix(1:20,nrow = 5,ncol = 4,byrow = TRUE)
print(m)
