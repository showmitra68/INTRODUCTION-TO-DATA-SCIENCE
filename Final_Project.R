MyData <- read.csv("F:/diabetes_data_upload.csv")
print(MyData)

colSums(is.na(MyData))
summary(MyData)

Cat_Variables <- c('Gender', 'Polyuria', 'Polydipsia', 'sudden.weight.loss',
                   'weakness', 'Polyphagia', 'Genital.thrush', 'visual.blurring',
                   'Itching', 'Irritability', 'delayed.healing', 'partial.paresis',
                   'muscle.stiffness', 'Alopecia', 'Obesity', 'class')

for (variable in Cat_Variables) {
  cat("Table for", variable, ":\n")
  print(table(MyData[[variable]], useNA = "ifany"))
  cat("\n")
}

Chi_Test <- c("Age", "Gender", "Polyuria", "Polydipsia", "sudden.weight.loss", "weakness", 
              "Polyphagia", "Genital.thrush", "visual.blurring", "Itching", "Irritability", 
              "delayed.healing", "partial.paresis", "muscle.stiffness", "Alopecia", "Obesity")
for (variable in Chi_Test) {
  cat("Chi-square test for", variable, "and class:\n")
  print(chisq.test(MyData[[variable]], MyData$class))
  cat("\n")
}

MyData[,1]
print(max(MyData$Age))
print(min(MyData$Age))

MyData$Age_Category <- ifelse(MyData$Age >= 15 & MyData$Age <= 25, "Young",
                              ifelse (MyData$Age >= 26 & MyData$Age <= 39, "Adult",
                                      ifelse (MyData$Age >= 40 & MyData$Age <= 59, "Middle-aged",
                                              ifelse (MyData$Age >= 60 & MyData$Age <= 99, "Old", NA))))
head(MyData)

Selected_Features <- MyData[, c('Age_Category', 'Gender', 'Polyuria', 'Polydipsia', 'sudden.weight.loss', 
                                'Polyphagia', 'Genital.thrush', 'visual.blurring' , 'Irritability', 
                                'partial.paresis', 'muscle.stiffness', 'Alopecia', 'class')]
head(Selected_Features)

summary(Selected_Features)
names(Selected_Features)
nrow(Selected_Features)

library(e1071)
library(caret)
set.seed(123)
folds <- createFolds(Selected_Features$class, k = 10, list = TRUE, returnTrain = TRUE)
accuracy_results <- numeric(length(folds))

for (i in 1:10) {
  Training1 <- Selected_Features[folds[[i]], ]
  Testing1 <- Selected_Features[-folds[[i]], ]
  
  NB_model1 <- naiveBayes(class ~ ., data = Training1, laplace = 1)
  predictions <- predict(NB_model1, Testing1[, -13])
  
  conf_matrix <- table(predictions, Testing1$class)
  accuracy_results[i] <- sum(diag(conf_matrix)) / sum(conf_matrix)
}

print(NB_model1)
print(conf_matrix)
mean_accuracy <- mean(accuracy_results)
rec <- sensitivity(conf_matrix)
prec <- posPredValue(conf_matrix)
f_measure1 <- 2 * (prec * rec) / (prec + rec)

Results1 <- data.frame(Model = 'Naive Bayes', Accuracy = mean_accuracy, Precision = prec, Recall = rec, F1Score = f_measure1)
print(Results1)

s <- sample(nrow(Selected_Features), nrow(Selected_Features) * 0.8)
Training2 <- Selected_Features[s, ]
Testing2 <- Selected_Features[-s, ]
NB_model2 <- naiveBayes(class ~ ., data = Training2, laplace = 1)
predictions_test <- predict(NB_model2, Testing2[, -13])
conf_matrix_test <- table(predictions_test, Testing2$class)
accuracy_test <- sum(diag(conf_matrix_test)) / sum(conf_matrix_test)
print(NB_model2)
print(conf_matrix_test)
recall <- sensitivity(conf_matrix_test)
precision <- posPredValue(conf_matrix_test)
f_measure <- 2 * (precision * recall) / (precision + recall)

Results2 <- data.frame(Model = 'Naive Bayes', Accuracy = accuracy_test, Precision = precision, Recall = recall, F1Score = f_measure)
print(Results2)


