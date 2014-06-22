### Introduction 

The run_analysis.R file is intended to work with the Human Activity Recognition 
Using Smartphones Dataset (Version 1.0).   

The Project material is located at 
https://class.coursera.org/getdata-004/human_grading/view/courses/972137/assessments/3/submissions


The material says: 
One of the most exciting areas in all of data science right now is wearable computing - see for example  this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

###  Analysis

The run_analysis.R file does the following

1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive variable names. 
5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

### Step 1 - Merge
The data provided includes a set of folders for training data and a set of folders for test data.

Each folder also includes detailed Inertial Readings data.  This data was not required for the assignment.

Each folder (test & train) has a file for the Subject/Person of each observation, a file for the activity being performed for each observation and a file for the detailed summary statistics computed for each observation.

All files are read into R.  That is, three training files and three test files.

The training set Subject ID, Activity ID/Code and the summary statistics were combined using cbind to make a 561 column and 7353 row data frame.

The test set Subject ID, Activity ID/Code and the summary statistics were combined using cbind to make a 561 column and 2947 row data frame.

These two data frames were then combined using rbind to make a 561 column and 10299 row data frame called dataTrainAndTestCombined.


### Step 2 - Extracts only the measurements on the mean and standard deviation

Columns with features with names including mean() and std() were picked from the dataTrainAndTestCombined data frame.  The Subject and Activity columns were also picked.

This gives a data frame called dataMeanAndStd with 10299 rows and 68 columns

Columns with meanFreq were not included as per discussions on the Project discussion board.


### Step 3 - Uses descriptive activity names to name the activities in the data set

THe activity codes 1 through 6 were replaced by the descriptive names WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING and LAYING.

This was done by making the Activity column a factor column and supplying the levels.


### Step 4 - Appropriately labels the data set with descriptive variable names

The first column is called "Subject".  It contains the ID of the Subject of the observation.  It ranges from 1 to 30.  Example is 2.

The second column is called "Activity".  It contains the ID or code of the Activity observed.  It is a number from 1 to 6 which is configured as a factor (see step 3).  THe data frame shows the number using the layer test.  Example is "Walking".

The remaining columns are taken from the dataFeatures data frame which came from the features.txt file.  Some of the names have been cleaned up.  All commas and parentheses have been removed.

The resulting tidy data set with the variable names is stored in the dataMeanAndStd data frame.

Write.table is used to write this data frame as a comma separated .TXT file with the column names in the header.

You can read back in this file into R using:
dataReadbackin <- read.table("project_step4_tidy_data_mean_and_std.txt",sep=",", header=TRUE)


### Step 5  - Create a second, independent tidy data set with the average of each variable for each activity and each subject

Please note that this new tidy data set was aggregated from the tidy data set from Step 4 (dataMeanAndStd)

Aggregation is on Activity and on Subject

The resulting data frame has 180 x 68 result set

Write.table is used to write this data frame as a comma separated .TXT file with the column names in the header.

You can read back in this file into R using:
dataReadbackin <- read.table(filenameStep4,sep=",", header=TRUE)


