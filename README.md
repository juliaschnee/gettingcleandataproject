---
title: "README"
output: html_document
---
# This is a README file for a course project for "Getting and Cleaning Data"

Script run_analysis.R includes one function, which performs manipulation with project data. The script merges test and train data, selects mean() and std() observations, labels the data set with descriptive names and uses descriptive activity labels and aggregates the final data set by activity and subjects. 

## Data

Before executing the script, data must be downloaded and extracted in the working directory into folder "UCI HAR Dataset".

Data can be downloaded here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Output

Output of the script is a .txt file written into the working directory. Use the following code to read the file:

```R
data <- read.table("final_set.txt", header = TRUE)
```

## Tidy data

The data is tidy because the values are descriptively labelled, no data is duplicated and every row represents one observation. The data is ready for further analysis.

## More information

A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones