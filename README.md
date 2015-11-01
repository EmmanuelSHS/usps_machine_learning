# usps_machine_learning
Handwriting Recognition on USPS Dataset via SVM and Tree Classifiers.

USPS Dataset is a scanned handwritten numeric data by the U.S. Postal Service. The scanned version then is transferred from a 16*16 image to a vector with a length of 256.


##The main classifiers
Ensemble methods are the main focus for this project.

* **Adaptive boosting** by tree decision stump as weak learner is used.

* **Bagging** by tree decision stump as weak learner

##Package Descriptions  
### Data
* uspsdata.txt: USPS handwritting dataset of 200 samples in a matrix.  
* uspscl.txt: The corresponding class label of the samples in usps data. 
### Methods
* decision_stump.R
* adaboost.R
* bootstrap.R
* bagging.R
* svm_in_e1701.R
* main_tree.R: main function for data training & testing & visualization.
