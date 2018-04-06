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
The next lines will show the steps followed from this original data to the final dataset.
### Joining the files of every folder in one data frame.
* Using the function **get_and_join_files**, the files of subjects, activities and measures are joined in one dataset. The first two columns will be subject and activity cause the final set is going to be grouped by them. The activity id is substituted by the corresponding description of it. This is important cause it will improve the reading quality of the column.
### Joining the resulting dataset of train folder with test folder in a new one.
### Obtaining the vector with Standard Variations and Mean columns
* With the function **getVectorStdMean**, we get two vectors: one with the indexes of those columns, other with the titles related to those indexes.
### Extracting those positions joined to the subject and activity columns from the merged dataset and stored them in a new one.
### Tidying the columns of the dataset: eliminating special characters and capsizing the initial letter of certain words to make the variables more readable. It follows one of the Tidy Data directrixes.
### Grouping the dataset by subject and activity columns and aggregating every measure using mean function. The result is stored in the final dataset that can be exported to a text file.

## FINAL DATA SET
The final dataset contains the following columns:
* Subject
* Activity
* timeBodyAccMeanX
* timeBodyAccMeanY
* timeBodyAccMeanZ 
* timeBodyAccStdDevX
* timeBodyAccStdDevY 
* timeBodyAccStdDevZ
* timeGravityAccMeanX 
* timeGravityAccMeanY
* timeGravityAccMeanZ
* timeGravityAccStdDevX
* timeGravityAccStdDevY
* timeGravityAccStdDevZ 
* timeBodyAccJerkMeanX
* timeBodyAccJerkMeanY 
* timeBodyAccJerkMeanZ
* timeBodyAccJerkStdDevX
* timeBodyAccJerkStdDevY
* timeBodyAccJerkStdDevZ
* timeBodyGyroMeanX
* timeBodyGyroMeanY 
* timeBodyGyroMeanZ 
* timeBodyGyroStdDevX
* timeBodyGyroStdDevY
* timeBodyGyroStdDevZ 
* timeBodyGyroJerkMeanX
* timeBodyGyroJerkMeanY 
* timeBodyGyroJerkMeanZ
* timeBodyGyroJerkStdDevX
* timeBodyGyroJerkStdDevY 
* timeBodyGyroJerkStdDevZ 
* timeBodyAccMagnitudeMean
* timeBodyAccMagnitudeStdDev
* timeGravityAccMagnitudeMean
* timeGravityAccMagnitudeStdDev
* timeBodyAccJerkMagnitudeMean
* timeBodyAccJerkMagnitudeStdDev 
* timeBodyGyroMagnitudeMean
* timeBodyGyroMagnitudeStdDev
* timeBodyGyroJerkMagnitudeMean
* timeBodyGyroJerkMagnitudeStdDev 
* freqBodyAccMeanX
* freqBodyAccMeanY
* freqBodyAccMeanZ 
* freqBodyAccStdDevX
* freqBodyAccStdDevY 
* freqBodyAccStdDevZ 
* freqBodyAccJerkMeanX
* freqBodyAccJerkMeanY 
* freqBodyAccJerkMeanZ
* freqBodyAccJerkStdDevX 
* freqBodyAccJerkStdDevY
* freqBodyAccJerkStdDevZ
* freqBodyGyroMeanX 
* freqBodyGyroMeanY
* freqBodyGyroMeanZ
* freqBodyGyroStdDevX 
* freqBodyGyroStdDevY
* freqBodyGyroStdDevZ
* freqBodyAccMagnitudeMean
* freqBodyAccMagnitudeStdDev
* freqBodyAccJerkMagnitudeMean 
* freqBodyAccJerkMagnitudeStdDev 
* freqBodyGyroMagnitudeMean
* freqBodyGyroMagnitudeStdDev
* freqBodyGyroJerkMagnitudeMean
* freqBodyGyroJerkMagnitudeStdDev
### Subject 
* Id of the volunteer
### Activity
* Activity performed when the measures were taken
### Measures 
All the columns are the mean result of the measure by subject and activity.
* *time* indicates time domain signals
* *freq* indicates frequency based on Fast Fourier transformations
* *Body* indicates a body signal
* *Gravity* indicates a gravity signal
* *Acc* indicates accelerometer signal
* *Gyro* indicates Gyroscope signal
* *Jerk* indicates the derivation of body angular acceleration and speed
* *Magnitude* indicates the Euclidean norm applied to the measure of the column
* *Mean* indicates the Mean value of the measure
* *StdDev* indicates the Standard Deviation of the measure
* *XYZ* indicates the axis of the measure taken.


## WHY IS TIDY?
The dataset complies with the four rules:
1. Each variable you measure should be in one column. Every feature is stored in only one column
2. Each different observation of that variable should be in a different row. Every observation is characterized by subject and activity that are unique on every row. 
3. There should be one table for each "kind" of variable. There is only one kind of variables: mean of the measures taken due the movement,
4. If you have multiple tables, they should include a column in the table that allows them to be linked. There is only one table.