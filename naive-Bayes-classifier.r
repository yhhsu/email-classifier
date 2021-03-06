
   
## X Window System (Y = 1)
## Microsoft Windows System (Y = 2)

install.packages('dplyr')
install.packages('Rcpp')
install.packages('devtools')
install.packages('pillar', type = 'binary') # THANK GOD IT WORKS! https://github.com/r-lib/pillar/issues/193
library('dplyr')

n <- 900
m <- 900

# Split dataset into train & test
train <- dataset[1:n,]
test <- dataset[(n+1):(n+m),]

install.packages('e1071')
library(e1071)
model <- naiveBayes(x = train[,-601], y = train[,601])
model

# Fit a naive Bayes classifier on "train"
pred_train <- predict(model, train[,-601])
table(pred_train, train$class)

pred_test <- predict(model, test[,-601])
table(pred_test, test$class)

(86 + 91) / 900 # Misclassification Rate = 19.67%

# Fit a naive Bayes classifier on "train" using "thresholds"
pred_test_1 <- predict(model, test[,-601], threshold = 10^-9)
table(pred_test_1, test$class)
(128 + 141) / 900 # Misclassification Rate = 29.89%

pred_test_2 <- predict(model, test[,-601], threshold = 10^-6)
table(pred_test_2, test$class)
(127 + 131) / 900 # Misclassification Rate = 28.67%

pred_test_3 <- predict(model, test[,-601], threshold = 10^-3)
table(pred_test_3, test$class)
(91 + 86) / 900 # Misclassification Rate = 19.67%
# We should prefer 10^-3 since it yields the lowest misclassification rate.

# Add 4 new data points in "train"
train_add <- train
nrow(train_add)
ncol(train_add)

train_add[nrow(train_add) + 1,] <- c(rep(0, 600), 1)
train_add[nrow(train_add) + 1,] <- c(rep(1, 600), 1)
train_add[nrow(train_add) + 1,] <- c(rep(0, 600), 2)
train_add[nrow(train_add) + 1,] <- c(rep(1, 600), 2)

nrow(train_add)

# Fit a naive Bayes classifier on "train_add"
model_add <- naiveBayes(x = train_add[,-601], y = train_add[,601])
model_add

pred_test_add <- predict(model_add, test[,-601])
table(pred_test_add, test$class)

(85 + 83) / 900 # Misclassification Rate = 18.67%
