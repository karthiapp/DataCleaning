# Coursera *Getting and Cleaning Data* course project

Assignment : 
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

The repository contains 4 files

- `CodeBook.md` : Describes the function and variables used to process the analysis
- `README.md` (this file) : presents an overview of the project
- `run_analysis.R` : The R script that operates the functions and write the tidy_data.txt 
- `tidy_data.txt` : Contains a tidy export of the dataset 


## Elements of study <a name="study-elements"></a>

The data set of this project has been obtained from : 
[Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#),

> Records the experiments results from a group of 30 volunteers performing multiple physical activities while wearing a Samsung smartphone which records measurements


> From these measurements resulted the traning and test data that will be merged in this project in one dataset. From each measurement has been extracted the mean and standard deviation.
> Then the measurements have been averaged for each subject and activity. This will provide the final data set

## Creating the data set <a name="creating-dataset"></a>

The R script `run_analysis.R` creates the dataset. After the zip files being downoloaded, and extracted, the procedure follows those steps 

- Merges the training and the test sets to create one data set.
- Extract only the measurements on the mean and standard deviation for each measurement.
- Use descriptive activity names to name the activities in the data set.
- Appropriately label the data set with descriptive variable names.
- Create a second, independent tidy set with the average of each variable for each activity and each subject.
- Write the data set to the `tidy_data.txt` file.

The CodeBook.md file describes the functions, library and variables used to obtain this final dataset