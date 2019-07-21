library(dplyr)
library(tidyverse)

# Download and unzip data
zipUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipFile <- "UCI HAR Dataset.zip"
if (!file.exists(zipFile)) {
        download.file(zipUrl, zipFile, mode = "wb")
}
dataPath <- "UCI HAR Dataset"
if (!file.exists(dataPath)) {
        unzip(zipFile)
}

#Read all the data and attributing variable names
# training data
trainingSubj <- read.table(file.path(dataPath, "train", "subject_train.txt"))
trainingVal <- read.table(file.path(dataPath, "train", "X_train.txt"))
trainingAct <- read.table(file.path(dataPath, "train", "y_train.txt"))
# test data
testSubj <- read.table(file.path(dataPath, "test", "subject_test.txt"))
testVal <- read.table(file.path(dataPath, "test", "X_test.txt"))
testAct <- read.table(file.path(dataPath, "test", "y_test.txt"))
# read features
features <- read.table(file.path(dataPath, "features.txt"), as.is = TRUE)
# read activity labels
activities <- read.table(file.path(dataPath, "activity_labels.txt"))
# columns of the activities
colnames(activities) <- c("activityId", "activityLabel")


# 1 Merge the data in one dataset
actData <- rbind(
        cbind(trainingSubj, trainingVal, trainingAct), cbind(testSubj, testVal, testAct))
# remove unsed data tables
rm(trainingSubj, trainingVal, trainingAct, testSubj, testVal, testAct)
# column names attribution
colnames(actData) <- c("subject", features[, 2], "activity")


# 2 Extracts only the measurements on the mean and standard deviation for each measurement
# Use grepl to get the columns to keep for the analysis
columnsStudy <- grepl("subject|activity|mean|std", colnames(actData))
actData <- actData[, columnsStudy]


# 3 Uses descriptive activity names to name the activities in the data set
# Use factor function to create a factor variable
actData$activity <- factor(actData$activity, levels = activities[, 1], labels = activities[, 2])


# 4 Appropriately labels the data set with descriptive variable names.
# get column names
actDataCols <- colnames(actData)
# remove special characters
actDataCols <- gsub("[\\(\\)-]", "", actDataCols)
# rename abbreviations
# Correct BodyBody naming error
actDataCols <- gsub("^t", "Time", actDataCols)
actDataCols <- gsub("^f", "Frequency", actDataCols)
actDataCols <- gsub("mean", "Mean", actDataCols)
actDataCols <- gsub("std", "StandardDeviation", actDataCols)
actDataCols <- gsub("BodyBody", "Body", actDataCols)
# Affect new names as column name
colnames(actData) <- actDataCols

# 5 from the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
actDataMeans <- actData %>% group_by(subject, activity) %>% summarise_each(funs(mean))

# generation of "tidy_data.txt"
write.table(actDataMeans, "tidy_data.txt", row.names = FALSE)