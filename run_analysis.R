#####################################################################################
### The following script complies with the requested steps of the assignment of 
### Coursera's Getting and cleaning data - Week 4
### 1. Merges the training and the test sets to create one data set.
### 2. Extracts only the measurements on the mean and standard deviation for each measurement.
### 3. Uses descriptive activity names to name the activities in the data set
### 4. Appropriately labels the data set with descriptive variable names.
### 5. From the data set in step 4, creates a second, independent tidy data set with
###     the average of each variable for each activity and each subject.
###
### It  contains several auxiliary function that will help to organize the code
#####################################################################################
library(dplyr)
### Function that collects data from txt files we are going to use and stores them on
### their respective data frames and join them in a single data frame that is returned
get_and_join_files = function (mainTxt,
                               labelsTxt,
                               activitiesTxt,
                               subjectsTxt) {
      ### Loading the data frames from the txt files
      mainDf = read.table(mainTxt)
      labelsDf = read.table(labelsTxt)
      activitiesDf = read.table(activitiesTxt, stringsAsFactors = F)
      subjectsDF = read.table(subjectsTxt)
      ### checking the loading was correct
      if (nrow(mainDf) != nrow(subjectsDF) |
          nrow (mainDf) != nrow(labelsDf)) {
            return ("Error in data capture, data frames have not got the same length")
      }
      ### Getting the label text and substituting the id with the text
      ### 3. Uses descriptive activity names to name the activities in the data set
      labelsDf[, 1] = activitiesDf[match(labelsDf[, 1], activitiesDf[, 1]), 2]
      ### Adding the subject column with activity one
      result = cbind(subjectsDF, labelsDf)
      ### Adding the observation columns
      result = cbind(result, mainDf)
      ### Returning the final data set of training or testing
      result
}

### Returns the columns' vector of variables that are mean and standard variations

getVectorStdMean = function (colTxt, colNames) {
      ### Loading txt file on a dataset
      colDf = read.table(colTxt, stringsAsFactors = F)
      ### Getting vectors for mean and standard variation, discarding the meanFreq ones
      meanStdCols = grep("mean|std", colDf[grep("Freq", colDf[, 2], invert = T), 2])
      colNames <=
            grep("mean|std", colDf[grep("Freq", colDf[, 2], invert = T), 2], value = T)
      ### Increasing by 2 because the measures starts at 3rd column on dataset
      meanstdCols = meanStdCols + 2
      
}
### Return the names of the column that complies better with tidy data standards
### removing non-characters symbols and improving the reading of them extending
### the name sif necessary
getTidyNames = function (namesCol){
      namesCol = gsub("\\()","",namesCol)
      namesCol = gsub("-","",namesCol)
      namesCol = gsub("std","StdDev",namesCol)
      namesCol = gsub("mean","Mean",namesCol)
      namesCol = gsub("^(t)","time",namesCol)
      namesCol = gsub("^(f)","freq",namesCol)
      namesCol = gsub("(gravity)","Gravity",namesCol)
      namesCol = gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body",namesCol)
      namesCol = gsub("gyro","Gyro",namesCol)
      namesCol = gsub("acc","Acc",namesCol)
      namesCol = gsub("jerk","Jerk",namesCol)
      namesCol = gsub("Mag","Magnitude",namesCol)
}
run_analysis = function (dataSetTxt) {
      ### Getting the train and text files and loading both data sets that will be joined later.
      testDf = get_and_join_files(
            "./test/X_test.txt",
            "./test/Y_test.txt",
            "activity_labels.txt",
            "./test/subject_test.txt"
      )
      trainDf = get_and_join_files(
            "./train/X_train.txt",
            "./train/Y_train.txt",
            "activity_labels.txt",
            "./train/subject_train.txt"
      )
      
      ### 1. Merges the training and the test sets to create one data set.
      totalSet = rbind(testDf, trainDf)
      ### Renaming Subject and Activity columns to eliminate duplicated column names
      colnames(totalSet)[1:2] = c("Subject", "Activity")
      ### Getting the vector of column indexes to select the total Set
      colVectorSelect = append(c(1, 2), getVectorStdMean("features.txt", colNames))
      ###2. Extracts only the measurements on the mean and standard deviation for each measurement.
      ###Storing in another dataSet
      meanStdSet =  select(totalSet, colVectorSelect)
      ### 4. Appropriately labels the data set with descriptive variable names.
      ###Renaming columns with the  Description obtained for std/mean vector and removing non-variable characters
      names(meanStdSet) = append(c("Subject", "Activity"),getTidyNames(colNames) )
      ### 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
      ### The dataset with the means and standard variations is grouped by Subject and activity and finally the average of every measure for every group is obtained
      finalSet = meanStdSet %>% group_by(Subject, Activity) %>% summarise_all (funs(mean))
      ###Writing the dataSet on a text file
      write.table(finalSet,dataSetTxt, row.name=FALSE)
}