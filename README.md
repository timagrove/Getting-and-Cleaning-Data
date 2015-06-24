# Getting-and-Cleaning-Data
Coursera Data Science Class 3 - Getting and Cleaning Data


This repository hosts the R code and documentation files for the Data Science's track course "Getting and Cleaning data", available in coursera.

The dataset being used is: [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Files

The code takes for granted the run_analysis.R code is in the users' in the root folder, and that the data is un-compressed and without names altered in the ~/UCI HAR Dataset folder

`CodeBook.md` describes the variables, the data, and any transformations or work that was performed to clean up the data.

`run_analysis.R` contains all the code to perform the analyses. The code can be launched in RStudio by just importing the file.

The output of the 5th step is called `tidy_data.txt`, and it is located in the ~/ folder by default.

The requirement for the course was to submit a program that would be able to be called from the root working directory, which in my environment that is:
     C:\Users\Timothy\Documents\					which equals ~/
So, the run_analysis.R will be located in this folder, and the data will reside in:
     C:\Users\Timothy\Documents\UCI HAR Dataset		which equals ~/UCI HAR Dataset/

In practice, I have set working directory to GitHub/Getting-and-Cleaning-Data/ so that the tidy_data.txt file is located in the folder to sync back up to GitHub/Getting-and-Cleaning-Data/
This will be commented out in the final uploaded copy
	setwd("~/GitHub/Getting-and-Cleaning-Data/")

In reviewing the data in Excel, prior to producing my tidy dataset, I found that there were subjects who only performed a single type of activity, whil eothers performed multiple.  In my tidy dataset that is represented.  I found other people's code on the internet where they had produced averages for all activities for all subjects, which is not represented in the full dataset.
