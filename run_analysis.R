# Load Required Library
# originally played around with plyr, but changed to dplyr
# library(plyr)
library(dplyr)

# The requirement for the course was to submit a program that would 
# be able to be called from the root working directory
# in my environment that is:
#     C:\Users\Timothy\Documents\  which equals ~/
# So, the run_analysis.R will be located in this folder, and the data will reside in:
#     C:\Users\Timothy\Documents\UCI HAR Dataset

# Set working Directory to GitHub - Used only when creating tidy submission file to be sync'd to GitHub
# and will be commented out in the final uploaded copy
# setwd("~/GitHub/Getting-and-Cleaning-Data/")

#-------------------------------------------------------------------------------------------------------
# Step 1
# read all data into data frames
# Merge the training and test sets to create one data set
#-------------------------------------------------------------------------------------------------------
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

activities <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")

# create 'x' data set
x_data <- rbind(x_train, x_test) 

# create 'y' data set
y_data <- rbind(y_train, y_test) %>% merge(activities,all=TRUE) %>% select(V2) %>% rename(activity=V2)

# create 'subject' data set
# rename the column using the dplyr 'rename' command
subject_data <- rbind(subject_train, subject_test) %>% rename(subject=V1)

#-------------------------------------------------------------------------------------------------------
# Step 2
# Extract only the measurements on the mean and standard deviation for each measurement
#-------------------------------------------------------------------------------------------------------

# get only columns with mean() or std() in their names
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

# subset the desired columns
x_data <- x_data[, mean_and_std_features]

# correct the column names
names(x_data) <- features[mean_and_std_features, 2]

#-------------------------------------------------------------------------------------------------------
# Step 3
# Combine the data sets into a single data set
#-------------------------------------------------------------------------------------------------------

# bind all the data in a single data set
all_data <- cbind(x_data, y_data, subject_data)

#-------------------------------------------------------------------------------------------------------
# Step 4
# Create a second, independent tidy data set with the average of each variable
# for each activity and each subject
#-------------------------------------------------------------------------------------------------------

# 66 <- 68 columns but last two (activity & subject)

# dplyr method
tidy_data <- summarise_each(group_by(all_data,activity,subject),funs(mean),-(activity:subject))

#-------------------------------------------------------------------------------------------------------
# Step 5
# Write the tidy data set to the working directory
#-------------------------------------------------------------------------------------------------------

write.table(tidy_data, "tidy_data.txt", row.name=FALSE)