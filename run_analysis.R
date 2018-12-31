
run_analysis <- function(){
  #Merges the training and the test sets to create one data set.
  #Extracts only the measurements on the mean and standard deviation for each measurement.
  #Uses descriptive activity names to name the activities in the data set
  #Appropriately labels the data set with descriptive variable names.
  #From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  
  #Read labels
  activity_lable <- read.table("UCI HAR Dataset/activity_labels.txt")
  features <- read.table("UCI HAR Dataset/features.txt")
  
  #Read test data
  x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
  y_test <- read.table("UCI HAR Dataset/test/Y_test.txt")
  subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
  
  #Read train data
  x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
  y_train <- read.table("UCI HAR Dataset/train/Y_train.txt")
  subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
  
  #Give descriptive names to columns
  names(x_test) <- features[, 2]
  names(x_train) <- features[, 2]
  names(subject_test) <- "subject"
  names(subject_train) <- "subject"
  names(y_test) <- "ID"
  names(y_train) <- "ID"
  names(activity_lable) <- c("ID", "activity_label")
  
  #Bind test data and train data into two data sets
  test_bind <- cbind(subject_test, y_test, x_test)
  train_bind <- cbind(subject_train, y_train, x_train)
  
  #Bind test data and train data into one data set
  total_bind <- rbind(test_bind, train_bind)
  
  #Join activity labels with activity IDs
  labelled_total <- merge(activity_lable, total_bind)
  
  #Extract columns with means and standard deviations
  total_mean <- grep("mean()", names(labelled_total), fixed = TRUE)
  total_std <- grep("std()", names(labelled_total), fixed = TRUE)
  
  #Filter out the columns and remove activity ID
  tidy_set <- labelled_total[, sort(c(2, 3, total_mean, total_std))]
  
  #Group the set by parameters set in the project description (exactly the same order) and aggregate the result
  grouped <- group_by(tidy_set, activity_label, subject)
  final_set <- summarise_all(grouped, mean)
  
  write.table(final_set, "final_set.txt", row.name=FALSE)
}
  

  
