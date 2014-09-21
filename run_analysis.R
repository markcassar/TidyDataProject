# for reading in the files, I am assuming all files are in your working directory

library(dplyr)
library(reshape2)

# read in the feature names and the activity labels
labels <- read.table("activity_labels.txt", header=FALSE)
colnames(labels) <- c("Activity_ID", "Activity")
labels$Activity <- gsub("_"," ", labels$Activity)
features <- read.table("features.txt", header=FALSE)

# read in the "test" data files, combine, and label "Subject_ID" and "Activity ID" columns
subject_test <- read.table("subject_test.txt", header=FALSE)
X_test <- read.table("X_test.txt", header=FALSE)
y_test <- read.table("y_test.txt", header=FALSE)
colnames(X_test) <- features$V2
subject_add_test <- cbind(subject_test, X_test) # subject number shows up as column V1 (leftmost column)
colnames(subject_add_test)[1] <- "Subject_ID"
full_test <- cbind(subject_add_test, y_test) # activity shows up as column V1 (rightmost column)
colnames(full_test)[563] <- "Activity_ID"

# read in the "train" data files, combine, and label "Subject_ID" and "Activity ID" columns
subject_train <- read.table("subject_train.txt", header=FALSE)
X_train <- read.table("X_train.txt", header=FALSE)
y_train <- read.table("y_train.txt", header=FALSE)
colnames(X_train) <- features$V2
subject_add_train <- cbind(subject_train, X_train) # subject number shows up as column V1 (leftmost column)
colnames(subject_add_train)[1] <- "Subject_ID"
full_train <- cbind(subject_add_train, y_train) # activity shows up as column V1 (rightmost column)
colnames(full_train)[563] <- "Activity_ID"

# merge the combined test and train data frames
merged_data <- rbind(full_train, full_test)

# use labels file to add descriptive name for each activity based on "Activity_ID"
activity_data <- merge(labels, merged_data, "Activity_ID")

# use dplyr package functionality to tidy up the data
act_data <- tbl_df(activity_data)

# keep only required columns
new_act_data <- select(act_data, matches("Activity"), matches("Subject"), matches("mean"), matches("std"), -matches("angle"))

# order by subject id and activity id 
new_act_data <- arrange(new_act_data, Subject_ID, Activity_ID)

# remove activity id column as it is no longer needed
new_act_data <- select(new_act_data, -Activity_ID)

# rearrange the order of the columns
new_act_data <- new_act_data[,c(2,1,3:ncol(new_act_data))]

# group the data by activity and subject id
groups <- group_by(new_act_data, Activity, Subject_ID)

# summarize the data so each of the variable columns is collapsed to the mean
groups_summ <- summarise_each(groups, funs(mean))

# read in descriptive variable names for features
new_names <- read.delim("new_features.txt", header=FALSE, sep="\n")

# rename the columns in the data frame
colnames(groups_summ) <- new_names[,1]

# create a long tidy data frame based on organizing the data per variable per activity per subject
new_names_vec <- new_names[3:nrow(new_names),1]
groups_summ_melt <- melt(groups_summ, id.vars= c("Activity", "Subject ID"), measure.vars= new_names_vec)  #  [3:length(new_names)]) 

# write tidy data set to file
write.table(groups_summ_melt, file="TidyDataSet.txt", row.names=FALSE)

# use line below to read file back in to R
# test <- read.table("TidyDataSet.txt", header=TRUE)
