TidyDataProject
===============

##Goals of the Project:

To create one R script called run_analysis.R that does the following: 
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 
- From the data set created through the previous steps, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#Files

For reading in the data, it is assumed all files are in the working directory. 

-run_analysis.R
-code_book.txt
-new_features.txt
-Subject_train.txt
-X_train.txt
-y_train.txt
-Subject_test.txt
-X_test.txt
-y_test.txt
-TidyDataSet.txt
-original_code_book.txt
-original_README.txt

##Usage

read in the feature names and the activity labels

read in the "test" data files, combine, and label "Subject_ID" and "Activity ID" columns

read in the "train" data files, combine, and label "Subject_ID" and "Activity ID" columns

 merge the combined test and train data frames

 use labels file to add descriptive name for each activity based on "Activity_ID"

 use dplyr package functionality to tidy up the data

 keep only required columns

 order by subject id and activity id 

 remove activity id column as it is no longer needed

 rearrange the order of the columns

 group the data by activity and subject id

 summarize the data so each of the variable columns is collapsed to the mean

 read in descriptive variable names for features

 rename the columns in the data frame

 create a long tidy data frame based on organizing the data per variable per activity per subject

 write tidy data set to file

 use line below to read file back in to R
 test <- read.table("TidyDataSet.txt", header=TRUE)
