# Readme

This file is meant to explain what the project is and how run_analysis.R works

## The Project

This project is meant to take a collection of data taken from the accelerometer
from the Samsung Galaxy S smartphone, and make it "tidy." To do this, I had to 
merge all of the seperate data sets together, which included:
- y_test.txt
- X_test.txt
- subject_test.txt
- y_train.txt
- X_train.txt
- subject_train.txt

More information about the data can be found at [This Link](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
and the data can be downloaded at [This Link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
For more information about each file and the variables, please refer to Code_Book.md
in the GitHub repository.

## run_analysis.R

run_analysis.R does the following:
- 1) Merges the training and the test sets to create one data set, named data.
- 2) Extracts only the measurements on the mean and standard deviation for each measurement. 
- 3) Uses descriptive activity names to name the activities in the data set
- 4) Appropriately labels the data set with descriptive variable names. 
- 5) From the data set in step 4, creates a second, independent tidy data set named tidyData with the average of each variable for each activity and each subject.

run_analysis.R does not use the traditional merge function, but instead uses cbinds and rbinds to 
merge the data finles together. This required keeping excellent tabs on the positioning
of the data. The other "benefit" of this method is that it does not reorder the data.
Reordering is done at the very end with the melt and dcast functions.

The end result is a tidy dataset that has first the Subject_ID, the Activity_Label, and then the
associated mean of each measurement from the accelerometer in a readable format.

