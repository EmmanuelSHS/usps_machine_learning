setwd("~/Documents/usps_machine_learning/")
library("e1071")

# loading dataset
S <- read.table("uspsdata.txt")
y <- read.table("uspscl.txt")

# randomly choose 20% testing data
## this technique of choosing test data was found while reading online document:
## https://cran.r-project.org/web/packages/e1071/vignettes/svmdoc.pdf
## which it should be given credit to
test_number <- sample(1:dim(S)[1], 40)
test_data <- S[test_number, ]
test_label <- as.factor(y[test_number, ])
train_data <- S[-test_number, ]
train_label <- as.factor(y[-test_number, ])

# Q3.1 Plot Cross Validation accurracy rate
# cross validation to get best gamma
# the cost is the same thing as gamma we talked about in the lecture

## in linear kernel
linear_tune <- tune(svm, train.x = train_data, train.y = train_label,
                    ranges = list(cost = 2^seq(-11,3, by = 2)),
                    kernel = "linear", type = "C",
                    tune.control(sampling = "cross", cross = 10))
linear_tune
plot(linear_tune, main = "Misclassification Rate",
     xlab = "Marginal Parameters", ylab = "Misclassification Rate")

## in RBF kernel
rbf_tune <- tune(svm, train.x = train_data, train.y = train_label,
                 ranges = list(cost = 2^seq(-10, 5, by = 2),
                               gamma = 2^seq(-25, -5, by = 2)),
                 kernel = "radial", type = "C",
                 tune.control(sampling = "cross", cross = 10))
rbf_tune
plot(rbf_tune, main = "Misclassification Rate",
     xlab = "Marginal Parameters", ylab = "Bandwidth")

# Train Model with Selected Parameters & Test
linear_svm <- svm(y = train_label, x = train_data, 
                  cost = linear_tune$best.model$cost, kernel = "linear", type = "C")
rbf_svm <- svm(y = train_label, x = train_data,
               cost = rbf_tune$best.model$cost,
               gamma = rbf_tune$best.model$gamma, 
               kernel = "radial", type = "C")

# compute misclassification rate for both SVM
linear_pred <- predict(linear_svm, test_data)
rbf_pred <- predict(rbf_svm, test_data)
error_linear <- sum(linear_pred != test_label)/40
error_linear
error_rbf <- sum(rbf_pred != test_label)/40
error_rbf
