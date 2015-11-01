setwd("~/Documents/usps_machine_learning")

source("adaboost.R")

X <- read.table("uspsdata.txt")
y <- read.table("uspscl.txt")

stime <- proc.time()
res <- ada.train(X, y, 3)
print(proc.time() - stime)

source("bagging.R")
bg <- bg.train(X, y)
res <- bg.test(X, 5, bg$allPars)
