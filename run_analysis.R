library(dplyr)
filename <- "dataset.zip"

## Download and unzip the dataset:
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
  download.file(fileURL, filename)
}  
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}

# Load test data
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")
Sub_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt")
Sub_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# Lead data description
variable_names <- read.table("./UCI HAR Dataset/features.txt")

# Read activity labels
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

# Merges the training and the test sets to create one data set.
X_total <- rbind(X_train, X_test)
Y_total <- rbind(Y_train, Y_test)
Sub_total <- rbind(Sub_train, Sub_test)

# Extracts the measurements on the mean and standard deviation for each measurement.
selected_var <- variable_names[grep("mean\\(\\)|std\\(\\)",variable_names[,2]),]
X_total <- X_total[,selected_var[,1]]

# Use descriptive names to name the activities in the data set
colnames(Y_total) <- "activity"
Y_total$activitylabel <- factor(Y_total$activity, labels = as.character(activity_labels[,2]))
activitylabel <- Y_total[,-1]

# Label the data set with descriptive variable names.
colnames(X_total) <- variable_names[selected_var[,1],2]

# From the data set, creates a second, independent tidy data set with the average
# of each variable for each activity and each subject.
colnames(Sub_total) <- "subject"
total <- cbind(X_total, activitylabel, Sub_total)
total_mean <- total %>% group_by(activitylabel, subject) %>% summarize_all(funs(mean))
write.table(total_mean, file = "./UCI HAR Dataset/tidydata.txt", row.names = FALSE, col.names = TRUE)

