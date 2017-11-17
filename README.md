# Getting-CleaningData
Project for The Getting &amp; Cleaning Data Course
This repo was created to finish the assignment for week 4 of Coursera Getting and Cleaning Data course.

First, we downloaded and unziped the data file into our R working directory.
Second, we wrote and downloaded the R source code into your R working directory.
Finally, we executeed the R source code to generate tidy data file.

Data description

The variables in the data X are sensor signals measured with waist-mounted smartphone from 30 subjects. The variable in the data Y indicates activity type the subjects performed during recording.

Code explaination

The code combined training dataset and test dataset, and extracted partial variables to create another dataset with the averages of each variable for each activity.

New dataset

The newly-generated dataset contained variables calculated based on the mean and standard deviation. Each row of the dataset is an average of each activity type for all subjects.

The code was written based on the instruction of this assignment

We read training and test dataset into R environment. Read variable names into R envrionment. Read subject index into R environment.

We merged the training and the test sets to create one data set. Use command rbind to combine training and test set
We extracted only the measurements on the mean and standard deviation for each measurement. Use grep command to get column indexes for variable name contains "mean()" or "std()"
We used descriptive activity names to name the activities in the data set Convert activity labels to characters and add a new column as factor
Appropriately labels the data set with descriptive variable names. Give the selected descriptive names to variable columns
From the data set, we created a second, independent tidy data set with the average of each variable for each activity and each subject. Use pipeline command to create a new tidy dataset with command group_by and summarize_each in dplyr package
