classify <- function(X, pars) {
  y_class <- (2*(X[, pars$j] > pars$t) - 1) * pars$m
  # return class label vector for input pars
  return(y_class)
}

train <- function(X, w, y) {
  sum_w <- sum(w)
  n_i <- dim(X)[1]
  n_j <- dim(X)[2]
  # initialize global pars
  j_min = 0
  m = -1
  t = 0
  error_min = 2
  # iterating every dimension
  # TODO: simplification
  #tapply(X, 2, )
  for (j in 1:n_j) {
    data_j <- X[,j]
    
    # iterate every data point to determine the best pars
    for (i in 1:(n_i)) {
      pars <- list(j = j, theta = data_j[i], m = sign(sum(data_j[data_j > t])))
      y_class <- classify(X, pars)
      error_now <- (w %*% (y != y_class)) / sum_w
      # compare present error with global min
      if (error_now < error_min) {
        error_min = error_now
        j_min = j
        t = data_j[i]
        m = sign(sum(data_j[data_j > t]))
      }
    }
  }
  
  allPars <- list(j = j_min, theta = t, m = m, error = error_min)
  return(allPars)
}