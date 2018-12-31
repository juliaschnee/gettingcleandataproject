---
title: "CodeBook"
output: html_document
---
# CodeBook for a course project "Getting and Cleaning Data"

## Raw data

The raw data includes following sets:

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

## Process

The Script run_analysis.R does the following:

1) Reads the raw data
2) Gives descriptive names to the raw data columns
3) Binds test data values, test subjects and activity IDs
4) Binds train data values, train subjects and activity IDs
5) Binds together test and train data
6) Replaces activity ID with descriptive activity lable
7) Extract columns with means and standard deviations
8) Groups the set by activity and subject
9) Aggregates the data set by groups (activity and subject) calculating mean value of all the observations
10) Writes the file


  