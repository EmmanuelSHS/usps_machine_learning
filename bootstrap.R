# perform bootstrap on input dataset

bootstrap <- function(X, y, B) {
  n = dim(y)[1]
  X_list = list()
  y_list = list()

  for (b in 1:B) {
    sample_index = sample(n, n, replace = TRUE)
    X_list[[b]] = X[sample_index, ]
    y_list[[b]] = y[sample_index, ]
  }
  
  return( res = list(index = 1:B, X = X_list, y = y_list) )
}
