source("decision_stump.R")
# AdaBoost
## aggregated classifier evaluation
ada.aggClass <- function (X, alpha, allPars) {
  # allPars is a matrix containing all weak learners
  B = length(alpha)
  n = dim(X)[1]
  labels = matrix(0, nrow = n, ncol = B)
  # majority vote algo
  tapply(labels, 2, ds.classify)

  # return majority vote
  aggLabels = sign(w %*% alpha)

  return(aggLabels)
}

## AdaBoost training algo
ada.train <- function (X, y, B = 10) {
  w <- rep(1/dim(y)[1], dim(y)[1])
  
  # initialize global variables
  alpha <- c()
  allPars <- c()
  marErr <- c()
  
  for (i in 1:B) {
    print(paste("adaBoost iteration: ", i))
    
    # train weak learner
    allPars[[i]] <- ds.train(X, w, y)
    
    # update for b-th weak learner
    missClass <- y != ds.classify(X, allPars[[i]])
    marErr[i] <- (w %*% missClass) / sum(w)
    alpha[i] <- log((1 - marErr[i]) / marErr[i])
    w <- as.vector(w * exp(alpha[i] * missClass))
  }
  
  res = list(allPars = allPars, alpha = alpha, marginErr = marErr)
}