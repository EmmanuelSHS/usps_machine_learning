setwd("~/Documents/usps_machine_learning")

source("decision_stump.R")
source("adaboost.R")

X <- read.table("uspsdata.txt")
y <- read.table("uspscl.txt")

stime <- proc.time()
res <- adaboost(X, y, 3)

print(proc.time() - stime)
