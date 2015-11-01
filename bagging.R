# bagging with decision stump as weak learner

source("decision_stump.R")
source("bootstrap.R")

bg.test <- function(X, B, allPars) {
  labels <- matrix(0, nrow = B, ncol = dim(y)[1])
  for (b in 1:B) {
    labels[b, ] <- ds.classify(X, allPars[[b]])
  }
  label <- (sign(apply(labels, 2, mean)))
  return(label)
}
  
bg.train <- function(X, y, B = 5) {
  n = dim(X)[1]
  allPars <- c()
  labels <- matrix(0, nrow = B, dim(X)[1])
  bs <- bootstrap(X, y, B)
  # launch weak learning training
  ## decision stump needs weight
  w <- rep(1/n, n)
  for (b in 1:B) {
    allPars[[b]] <- ds.train(bs$X[[b]], w, bs$y[[b]])
  }
  return(list(allPars = allPars))
}