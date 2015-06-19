# Load Required Library
library(plyr)
# Set working Directory
setwd("~/GitHub/Getting-and-Cleaning-Data/")

#-------------------------------------------------------------------------------------------------------
# Step 1
# Merge the training and test sets to create one data set
#-------------------------------------------------------------------------------------------------------
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

# create 'x' data set
x_data <- rbind(x_train, x_test)

# create 'y' data set
y_data <- rbind(y_train, y_test)

# create 'subject' data set
subject_data <- rbind(subject_train, subject_test)

#-------------------------------------------------------------------------------------------------------
# Step 2
# Extract only the measurements on the mean and standard deviation for each measurement
#-------------------------------------------------------------------------------------------------------

features <- read.table("features.txt")

# get only columns with mean() or std() in their names
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

# subset the desired columns
x_data <- x_data[, mean_and_std_features]

# correct the column names
names(x_data) <- features[mean_and_std_features, 2]

#-------------------------------------------------------------------------------------------------------
# Step 3
# Use descriptive activity names to name the activities in the data set
#-------------------------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------------------------
# Step 4
# Appropriately label the data set with descriptive variable names
#-------------------------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------------------------
# Step 5
# Create a second, independent tidy data set with the average of each variable
# for each activity and each subject
#-------------------------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------------------------
# Step 6
# Write the tidy data set to the working directory
#-------------------------------------------------------------------------------------------------------
