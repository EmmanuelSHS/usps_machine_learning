# usps_machine_learning
Handwriting Recognition on USPS Dataset via SVM and Tree Classifiers.

USPS Dataset is a scanned handwritten numeric data by the U.S. Postal Service. The scanned version then is transferred from a 16*16 image to a vector with a length of 256.

uspsdata.txt: USPS handwritting dataset of 200 samples in a matrix.  
uspscl.txt: The corresponding class label of the samples in usps data. 

##The main classifiers
###Adaboost
Adaptive boosting by tree decision stump as weak learner is used.