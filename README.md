# Getting and Cleaning Data Course Project

This repository contains R code and other documents for *Coursera* "Getting and Cleaning Data" in Data Science specialization. 

The data set used in this project is [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones "Title")

## Process of this project:

1. Preparation: import `library(plyr)`, and download the data set
2. Merges the training and the test sets to create one data set:
  * Read in the x, y, subject training and test data.
  * Use *rbind* to merge them into merged data.
3. Extracts only the measurements on the mean and standard deviation for each measurement:
  * Subset `x_merged` by those features contain `-mean()` or `-std()`.
4. Uses descriptive activity names to name the activities in the data set
  * Update `y_merged` by activity labels in `"activity_labels.txt" file.
5. Appropriately labels the data set with descriptive variable names:
  * Name `x_merged` as feature names
  * Name `y_merged` as "activity"
  * Name `subject_merged` as "subject"
6. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject:
  * Use `ddply` function to calculate each average of each combination of 6 activities and 30 subjects to get 180 rows of average_data.
7. Write average_data into 'average_data.txt'
