
======================
=== dataMeanAndStd ===
======================


Subject:
========
THis is stored in column 1.
Each row Identifies the subject who performed the activity for each window sample. Its range is from 1 to 30

Activity:
=========
This is stored in column 2
Each row indentifies the activity performed for each window sample.  Its range is from 1 to 6.  The activity number/id/code and its description are as follows:  
1            WALKING
2   WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4            SITTING
5           STANDING
6             LAYING


Features:
=========
These are stored in columns 3-68.
Features are normalized and bounded within [-1,1].

The features included are (in order):
tBodyAcc-mean-Z
tBodyAcc-std-X
tBodyAcc-std-Y
tBodyAcc-std-Z
tBodyAcc-mad-X
tBodyAcc-mad-Y
tGravityAcc-mean-Z
tGravityAcc-std-X
tGravityAcc-std-Y
tGravityAcc-std-Z
tGravityAcc-mad-X
tGravityAcc-mad-Y
tBodyAccJerk-mean-Z
tBodyAccJerk-std-X
tBodyAccJerk-std-Y
tBodyAccJerk-std-Z
tBodyAccJerk-mad-X
tBodyAccJerk-mad-Y
tBodyGyro-mean-Z
tBodyGyro-std-X
tBodyGyro-std-Y
tBodyGyro-std-Z
tBodyGyro-mad-X
tBodyGyro-mad-Y
tBodyGyroJerk-mean-Z
tBodyGyroJerk-std-X
tBodyGyroJerk-std-Y
tBodyGyroJerk-std-Z
tBodyGyroJerk-mad-X
tBodyGyroJerk-mad-Y
tBodyAccMag-mad
tBodyAccMag-max
tGravityAccMag-mad
tGravityAccMag-max
tBodyAccJerkMag-mad
tBodyAccJerkMag-max
tBodyGyroMag-mad
tBodyGyroMag-max
tBodyGyroJerkMag-mad
tBodyGyroJerkMag-max
fBodyAcc-mean-Z
fBodyAcc-std-X
fBodyAcc-std-Y
fBodyAcc-std-Z
fBodyAcc-mad-X
fBodyAcc-mad-Y
fBodyAccJerk-mean-Z
fBodyAccJerk-std-X
fBodyAccJerk-std-Y
fBodyAccJerk-std-Z
fBodyAccJerk-mad-X
fBodyAccJerk-mad-Y
fBodyGyro-mean-Z
fBodyGyro-std-X
fBodyGyro-std-Y
fBodyGyro-std-Z
fBodyGyro-mad-X
fBodyGyro-mad-Y
fBodyAccMag-mad
fBodyAccMag-max
fBodyBodyAccJerkMag-mad
fBodyBodyAccJerkMag-max
fBodyBodyGyroMag-mad
fBodyBodyGyroMag-max
fBodyBodyGyroJerkMag-mad
fBodyBodyGyroJerkMag-max

Units for the features are:
1) Acceleration -> m/s/s
2) Jerk -> m/s/s/s
3) Frequency -> Hz



============================================================
=== Human Activity Recognition Using Smartphones Dataset ===
============================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 


For more information about the Human Activity Recognition Using Smartphones Dataset contact: activityrecognition@smartlab.ws



License:
========
Use of the Human Activity Recognition Using Smartphones Dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

The Human Activity Recognition Using Smartphones Dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.