# GETTING & CLEANING DATA PROGRAMMING ASSIGNMENT - CODEBOOK

This document will show the data transformations from the original experimental text files to the final dataset.
Finally, it will show the structure of the dataset and the reasons why it can be considered as tidy data.

## ORIGINAL DATA
It is separated in three folders:
* Main - It contains the general information about the data and its variables.
* Train - It contains the data about the training data.It has a folder with *Inertia Signals* that we are not going to use in this exercise.
* Test - It contains the data about the test data. It has a folder with *Inertia Signals* that we are not going to use in this exercise.

### Main Folder
* Readme.txt - Where the structure is explained
* features_info.txt - With information about the variables used
* features.txt - Information about the variables a the relation with the column name of the text files.
* activity_labels.txt - It contains the translation of the activity id into the real activity done by the subject.

### Test Folder
* subject_test.txt - It contains the subject of the row of the measures collected on x_test file.
* X_test.txt - It contains the measures featured on features.txt
* Y_test.txt - It contains the activity id of the row of the measures collected on x_test file.
* Inertial Signals folder - It is not going to be used

### Train Folders
* subject_train.txt - It contains the subject of the row of the measures collected on x_train file.
* X_train.txt - It contains the measures featured on features.txt
* Y_train.txt - It contains the activity id of the row of the measures collected on x_train file.
* Inertial Signals folder - It is not going to be used
 
 
## DATA ANALYSIS
It is observed that the the features file has the same number of rows than the columns of x_test and x_train files. So it is inferred that the every column of those files are named after the one indicated on the feature file.
As well, the number of rows of x, y and subject files of test and train folders are equal so they can be joined on only data set.
Finally, the activity id numbers of Y files can be translated by the description contained on the file activity_labels.

## CLEANING AND TYDING PROCESS


## FINAL DATA SET

## WHY IS TIDY?