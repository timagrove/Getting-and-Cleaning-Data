# Introduction

The script `run_analysis.R`performs the 5 steps described in the course project's definition.

* First, all of the training data, test data, activities, and Features are loaded into data frames.  Then the Training and Test data is merged using the `rbind()` function. The y_data is merged with the activities data and only the name column is preserved by selecting V2, which is renamed to 'activity' The subject_data column is renamed from V1 to subject
* Then, only those columns with the mean and standard deviation measures are taken from the whole dataset. After extracting these columns, they are given the correct names, taken from `features.txt`.
* then a combined dataset is generated 'all_data' which is created by column binding x_data, y_data, and subject_data
* Finally, we generate a new dataset with all the average measures grouped by subject and activity using the dplyr summarise_each function using the function mean and excluding activity and subject (30 subjects * 6 activities = 180 rows). The output file is called `tidy_data.txt`, and uploaded to the GitHub repository.

# Variables

* `x_train`, `y_train`, `x_test`, `y_test`, `subject_train` and `subject_test` contain the data from the downloaded files.
* `x_data`, `y_data` and `subject_data` merge the previous datasets to further analysis.
* `features` contains the correct names for the `x_data` dataset, which are applied to the column names stored in `mean_and_std_features`, a numeric vector used to extract the desired data.
* 'activities' contains the activity names read from the activity_labels.txt file.
* `all_data` merges `x_data`, `y_data` and `subject_data` in a big dataset.
* `tidy_data` contains the relevant averages which will be later stored in a `.txt` file.

