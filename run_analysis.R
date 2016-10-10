library(plyr)

## Download and unzip the dataset:
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","final.zip")
unzip("final.zip")

#1. Merges the training and the test sets to create one data set.
###############################################################################################
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

# Merge 'x', 'y', 'subject' data
x_merged <- rbind(x_train,x_test)
y_merged <- rbind(y_train,y_test)
subject_merged <- rbind(subject_train,subject_test)


#2. Extracts only the measurements on the mean and standard deviation for each measurement.
###############################################################################################
features <- read.table("features.txt")

# Extracts only the measurements on the mean and std
mean_std_feat <- grep("-(mean|std)\\(\\)",features[,2])

# subset the desired columns
x_merged <- x_merged[,mean_std_feat]

#3. Uses descriptive activity names to name the activities in the data set
###############################################################################################
activity_labels <- read.table("activity_labels.txt")

# Change the y_merged values into activity names
y_merged[, 1] <- activity_labels[y_merged[, 1], 2]

#4. Appropriately labels the data set with descriptive variable names.
###############################################################################################

# Name columns as features
names(x_merged) <- features[mean_std_feat,2]
# Name y_data column as 'activity'
names(y_merged) <- "activity"
# Name subject_merged column as 'subject'
names(subject_merged) <- "subject"

all_data <- cbind(x_merged,y_merged,subject_merged)

#5. From the data set in step 4, creates a second, independent tidy data set 
#   with the average of each variable for each activity and each subject.
###############################################################################################
# Use ddply to calculate each average of each combination of activity and subject
# to get average_data
average_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

# Write average_data into 'average_data.txt'
write.table(average_data,"average_data.txt",row.name=FALSE)