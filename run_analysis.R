## The code should have a file run_analysis.R in the main directory 
## that can be run as long as the Samsung data is in your working directory. 
##
## QUERY: In zip file format or as extracted files and folders?
##
##
## You will be required to submit: 1) a tidy data set as described below, 
## 2) a link to a Github repository with your script for performing the analysis, and 
## 3) a code book that describes the variables, the data, and any transformations 
## or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo##
##
## You should include a README.md in the repo describing how the script works. 
##
##
## You should create one R script called run_analysis.R that does the following. 
##    1.Merges the training and the test sets to create one data set.
##    2.Extracts only the measurements on the mean and standard deviation for each measurement. 
##    3.Uses descriptive activity names to name the activities in the data set
##    4.Appropriately labels the data set with descriptive variable names. 
##    5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
##
##
##
## 0. load data fr
##

setwd("C:/Devel/R/Data Cleaning/CourseProject/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset")

fileFeatures <- "features.txt"
dataFeatures <- read.table(fileFeatures)

fileActivityLabels <- "activity_labels.txt"
dataActivityLabels <- read.table(fileActivityLabels)

fileTrain_Subject_train <- "train/Subject_train.txt"
dataTrain_Subject_train <- read.table(fileTrain_Subject_train)

fileTrain_X_train <- "train/X_train.txt"
dataTrain_X_train <- read.table(fileTrain_X_train)

fileTrain_Y_train <- "train/Y_train.txt"
dataTrain_Y_train <- read.table(fileTrain_Y_train)


fileTest_Subject_test <- "test/Subject_test.txt"
dataTest_Subject_test <- read.table(fileTest_Subject_test)

fileTest_X_test <- "test/X_test.txt"
dataTest_X_test <- read.table(fileTest_X_test)

fileTest_Y_test <- "test/Y_test.txt"
dataTest_Y_test <- read.table(fileTest_Y_test)


## Check the dimensions of the data
dim(dataActivityLabels)        ## 6 2
dim(dataFeatures)              ## 561 2

dim(dataTrain_X_train)         ## 7352 561
dim(dataTrain_Y_train)         ## 7352 1
dim(dataTrain_Subject_train)   ## 7352 1

dim(dataTest_X_test)         ## 2947 561
dim(dataTest_Y_test)         ## 2947 1
dim(dataTest_Subject_test)   ## 2947 1



##
##    1.Merge the training and the test sets to create one data set.
##

## Combine columns from dataTrain_Subject_train, dataTrain_Y_train and dataTrain_X_train 
dataTrainCombined <- cbind(dataTrain_Subject_train, dataTrain_Y_train, dataTrain_X_train)

## Combine columns from dataTest_Subject_test, dataTest_Y_test and dataTest_X_test 
dataTestCombined <- cbind(dataTest_Subject_test, dataTest_Y_test, dataTest_X_test)

## Combine rows from dataTrainCombined and dataTestCombined
dataTrainAndTestCombined <- rbind(dataTrainCombined, dataTestCombined)

## Set up column names
## -- strip commas
dataFeaturesCleaned <- apply(dataFeatures, 2, gsub, pattern="[\\,]", replacement="")
dataColnames <- c("Subject", "Activity", dataFeaturesCleaned[,2] )
colnames(dataTrainAndTestCombined) <- dataColnames
dim(dataTrainAndTestCombined)  ## 10299 x 563

##
##    2.Extracts only the measurements on the mean and standard deviation for each measurement. 
##

## All columns with mean or std are selected 
##  - This includes mean(), std() columns but does not include meanFreq columns
## Also need Subject and Activity
colsMeanAndStd <- c(TRUE,TRUE, grepl('mean\\(\\)|std\\(\\)',names(dataTrainAndTestCombined)))
dataMeanAndStd <- dataTrainAndTestCombined[,colsMeanAndStd]
dim(dataMeanAndStd)  ## 10299 x 68

##
##    3.Uses descriptive activity names to name the activities in the data set
##

dataMeanAndStd$Activity <- as.factor(dataMeanAndStd$Activity)
levels(dataMeanAndStd$Activity) <- dataActivityLabels[,2]

##
##    4.Appropriately labels the data set with descriptive variable names. 
##

## Set up column names
## Strip parentheses and commas from features names
dataFeaturesCleaned <- apply(dataFeatures, 2, gsub, pattern="[\\,\\(\\)]", replacement="")
dataColnames <- c("Subject", "Activity", dataFeaturesCleaned[,2] )
colnames(dataMeanAndStd) <- dataColnames[colsMeanAndStd]

## NOTE: dataMeanAndStd is the first tidy data set

## Output the tidy dataset to file
filenameStep4 <- "project_step4_tidy_data_mean_and_std.txt"
write.table(dataMeanAndStd, filenameStep4, sep=",", col.names=TRUE, row.names=FALSE)

## You can read back in this file using:
## dataReadbackin <- read.table(filenameStep4,sep=",", header=TRUE)

##
##    5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
##


dataAverages <- aggregate(.~Subject+Activity, FUN=mean, data=dataMeanAndStd)
dim(dataAverages)   # 180 x 68

## NOTE: dataAverages is the second tidy data set

## Output the tidy dataset to file
filenameStep5 <- "project_step5_tidy_data_mean_and_std_aggregated.txt"
write.table(dataMeanAndStd, filenameStep5, sep=",", col.names=TRUE, row.names=FALSE)

## You can read back in this file using:
## dataReadbackin <- read.table(filenameStep5,sep=",", header=TRUE)
