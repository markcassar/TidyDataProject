TidyDataProject
===============

##Goal of the Project

To create one R script called run_analysis.R that does the following: 
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 
- From the data set created through the previous steps, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##Files

For reading in the data, it is assumed all files are in the working directory. 

####Anlysis files

- run_analysis.R 
- new_features.txt

####Data/input files

- Subject_train.txt 
- X_train.txt 
- y_train.txt 
- Subject_test.txt 
- X_test.txt
- y_test.txt
- features.txt
- labels.txt

####Output file
- TidyDataSet.txt

####Explanatory file
- code_book.txt

####Original reference files
- original_code_book.txt 
- original_README.txt 
- The original data files can be downloaded [here] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
- More information about the original data can be found [here] 
(http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

##Usage

The run_analysis.R code first reads in the files features.txt and lables.txt for the feature names and the activity labels

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
