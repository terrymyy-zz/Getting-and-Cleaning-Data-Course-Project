# Getting and Cleaning Data Course Project

This repository contains R code and other documents for *Coursera* "Getting and Cleaning Data" in Data Science specialization. 

The data set used in this project is [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones "Title")

## Process of this project:

* Preparation: import `library(plyr)`, and download the data set
* 1. Merges the training and the test sets to create one data set.
** read the training and test data, and use rbind to merge them
* 2. Extracts only the measurements on the mean and standard deviation for each measurement.
* 3. Uses descriptive activity names to name the activities in the data set
* 4. Appropriately labels the data set with descriptive variable names.
* 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
* Write average_data into 'average_data.txt'
