# Code book *Getting and Cleaning Data* course project

This document describes the procedure used to download, extract the data file (zip format)

The data set that this code book pertains to is located in the `tidy_data.txt` file of this repository.


## Data <a name="data"></a>

The `tidy_data.txt` data file is a text file, containing space-separated values.

The first row contains the names of the variables, which are listed and described in the [Variables](#variables) section, and the following rows contain the values of these variables. 

## Variables <a name="variables"></a>

The original data contains, for each subject and activity 79 measurments

### Identifiers <a name="identifiers"></a>

- `subject`

	Subject identifier, integer format from 1 to 30, representing the 30 volunteers

- `activity`

	Activity identifier, string format of those possible values values: 
	- `WALKING`: subject was walking
	- `WALKING_UPSTAIRS`: subject was walking upstairs
	- `WALKING_DOWNSTAIRS`: subject was walking downstairs
	- `SITTING`: subject was sitting
	- `STANDING`: subject was standing
	- `LAYING`: subject was laying

## Libraries used <a name="libraries"></a>

The Plyr library is necessary to run the script

## Process <a name="process"></a>

The following actions were processed on the original data:

1. Merging of the training and test data into one single data set (actData)The training and test sets were merged to create one data set.
1. The measurements on the mean and standard deviation (`mean` and `std`) have been extracted for each measurement.
1. The activity identifiers have been renamed by descriptive activity names in this way :
	- The special characters (`(`, `)`, `-`) have been removed
	- `f`, `t`, `mean`, `std` have been renamed as `Frequency`, `Time`, `Mean`, `StandardDeviation`.
	- `BodyBody` corrected with `Body`.
1. The final data set has been generated with the mean of each variable for each activity and for each subject
1. Finally the data has been exported into a text file contained in this depo
1. Finally the data has been exported into a text file contained in this depo
