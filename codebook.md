# Introduction

The script `run_analysis.R`performs the following steps as outlined in the course project's definition.

* 1.Merges the training and the test sets to create one data set.
* 2.Extracts only the measurements on the mean and standard deviation for each measurement.
* 3.Uses descriptive activity names to name the activities in the data set
* 4.Appropriately labels the data set with descriptive variable names. 
* 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


# Description
* All data is merged using the "rbind()" function. Assumption that files have same number of columns and same descriptive values. 
* Any column containing words "mean" or "std" are subsetted from the whole dataset. Once extracted, column names are corrected by using "features.txt" file

* As activity data is addressed with values 1:6, we take the activity names and IDs from `activity_labels.txt` and they are substituted in the dataset.
* On the whole dataset, those columns with vague column names are corrected.
* Finally, we generate a new dataset with all the average measures for each subject and activity type (30 subjects * 6 activities = 180 rows). The output file is called `averages_data.txt`, and uploaded to this repository.

# Variables

* x_train = contains data from x_train.txt file
* y_train = contains data from y_train.txt file
* s_train = contains data from subject_train.txt file
* x_test = contains data from x_test.txt file
* y_test = contains data from y_test.txt file
* s_test = contains data from subject_test.txt 
* x_dataMerge = merge dataset from x_train and x_test
* y_dataMerge = merge dataset from y_train and y_test
* s_dataMerge = merge dataset from s_train and s_test
* "f" contains data loaded from features.txt data set. Data in file contains corrected column names for x_dataMerge  * dataset. This data is extracted using means__std_features vector which contains *only* applicable means and   standard deviation column names
* "a" is similar as "f" using corrected column names
* A similar approach is taken with activity names through the `activities` variable.
* "data" merges "x_dataMerge"", "y_dataMerge" and "s_dataMerge" in a big dataset.
* "a_data" contains averages to be stored in "averages_data.txt"
* "ddply()" was used to calculate colMeans.