Dataset<-read.csv("F:/Dataset_MId.csv")
print(Dataset)

colSums(is.na(Dataset))
Dataset$age <- ifelse(is.na(Dataset$age),mean(Dataset$age, na.rm = TRUE),Dataset$age)
Dataset$pressurehight <- ifelse(is.na(Dataset$pressurehight),mean(Dataset$pressurehight, na.rm = TRUE),Dataset$pressurehight)
print(Dataset)

Dataset[,2]
print(max(Dataset$gender))
Dataset<-edit(Dataset)
Dataset[,2]

Dataset$age <- as.numeric(format(round(Dataset$age,0)))
Dataset$pressurehight<- as.numeric(format(round(Dataset$pressurehight,0)))
print(Dataset)

plot(Dataset$age,col=4)
plot(Dataset$pressurehight, col=6)
plot(Dataset$impluse, col=7)
plot(Dataset$pressurelow, col=5)
plot(Dataset$glucose,col=3)


mean(Dataset$age)
median(Dataset$age)
var(Dataset$age)
sd(Dataset$age)

mean(Dataset$impluse)
median(Dataset$impluse)
var(Dataset$impluse)
sd(Dataset$impluse)

mean(Dataset$pressurehight)
median(Dataset$pressurehight)
var(Dataset$pressurehight)
sd(Dataset$pressurehight)

mean(Dataset$pressurelow)
median(Dataset$pressurelow)
var(Dataset$pressurelow)
sd(Dataset$pressurelow)

hist(Dataset$age)
hist(Dataset$impluse,col=3)
hist(Dataset$pressurehight,col=5)
hist(Dataset$pressurelow,col=7)
hist(Dataset$glucose,col=4)

barplot(table(Dataset$gender), ylab = "Frequency", xlab = "Gender")

install.packages("dplyr")
install.packages("matrixStats")
library(matrixStats)
library(dplyr)
Dataset %>% summarise_if(is.numeric, sd)

age_bounds <- quantile(Dataset$age, c(0.25, 0.75))
IQR_age <- IQR(Dataset$age)
lower_age <- age_bounds[1] - 1.5 * IQR_age
upper_age <- age_bounds[2] + 1.5 * IQR_age
Dataset <- Dataset[Dataset$age >= lower_age & Dataset$age <= upper_age,]
plot(Dataset$age,col=4)

pressurehight_bounds <- quantile(Dataset$pressurehight, c(0.25, 0.75))
IQR_pressurehight <- IQR(Dataset$pressurehight)
lower_pressurehight <- pressurehight_bounds[1] - 1.5 * IQR_pressurehight
upper_pressurehight <- pressurehight_bounds[2] + 1.5 * IQR_pressurehight
Dataset <- Dataset[Dataset$pressurehight >= lower_pressurehight & Dataset$pressurehight <= upper_pressurehight,]
plot(Dataset$pressurehight, col=6)

impluse_bounds <- quantile(Dataset$impluse, c(0.25, 0.75))
IQR_impluse <- IQR(Dataset$impluse)
lower_impluse <- impluse_bounds[1] - 1.5 * IQR_impluse
upper_impluse <- impluse_bounds[2] + 1.5 * IQR_impluse
Dataset <- Dataset[Dataset$impluse >= lower_impluse & Dataset$impluse <= upper_impluse, ]
plot(Dataset$impluse, col=7)

pressurelow_bounds <- quantile(Dataset$pressurelow, c(0.25, 0.75))
IQR_pressurelow <- IQR(Dataset$pressurelow)
lower_pressurelow <- pressurelow_bounds[1] - 1.5 * IQR_pressurelow
upper_pressurelow <- pressurelow_bounds[2] + 1.5 * IQR_pressurelow
Dataset <- Dataset[Dataset$pressurelow >= lower_pressurelow & Dataset$pressurelow <= upper_pressurelow, ]
plot(Dataset$pressurelow, col=5)

print(Dataset)
