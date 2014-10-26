# Tidy Data Set
==================================================================
## Overview
The input data selected for this project come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). These signals were used to estimate variables of the feature vector for each pattern - '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
==================================================================
### Definition of tify data set used for this project
Depending on the interpretation of a tidy data set, this could support either data in the wide (many columns, less rows) or the long form (less columns, many rows) being in tidy format. I used the wide format.
==================================================================
## Variables and Transformations used in the script
The following tasks are performed in the script:
1. The Activity labels will be read from the file system and saved in the "labels" variable. Then the column names "Activity_ID" and "Activity" will be set for the labels.
2. The Y-Data of the test and training data will be loaded into two variables and the column name "Activity_ID" will be set.
3. The Y-Data data frames of the test and training data will be merged with the labels on the "Activity_ID" column to set the descriptive activity names to name the activities in the data set.
4. The Feature labels will be read from the file system saved in the "features" variable. Then the column names "Feature_ID" and "Feature" will be set for the features.
5. The X-Data of the test and training data will be loaded into two variables and the column names will be set based on the features by Appropriately labels the data set with descriptive variable names.
6. The person subject data will be read from the file system saved in the "subject_train" variable. An additional column with the value "Test" for the test data and "Train" for the train data will be added. Then the column names "Subject_ID" and "Type" will be set for the subjects.
7. All test and train data will be merged into one data fram for test and train. Both data frame will be exported into the "CSV_export" folder.
8. Both data frames will be merged into one main data frame with the name "df". The frame will also be exported into the "CSV_export" folder.
9. With the grep function, all column names containing mean and std will be saved in a variable. Also the standard names "Subject_ID", "Type" and "Activity" will be added.
10. Based on these column names only the measurements on the mean and standard deviation for each measurement will be extracted from the df data frame and saved under the same name.
11. Withe the aggreate function (FUN=mean), all columns containing mean and std the average of each variable for each activity and each subject will be calculated. The result will be saved in the df2 data frame.
12. The tidy data will be exported in the root folder as a txt file and in the "CSV_export" as csv.
==================================================================
## Output data columns
Subject_ID - INTEGER - Identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
Activity - STRING - Identifies the performed activitiy (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
The following columns contain the average of each variable for each activity and each subject from the original data set. The data type is NUMERIC with up to 15 position after decimal point, 1 position before the decimal point and the minus sign if negative:
tBodyAcc-mean()-X
tBodyAcc-mean()-Y
tBodyAcc-mean()-Z
tBodyAcc-std()-X
tBodyAcc-std()-Y
tBodyAcc-std()-Z
tGravityAcc-mean()-X
tGravityAcc-mean()-Y
tGravityAcc-mean()-Z
tGravityAcc-std()-X
tGravityAcc-std()-Y
tGravityAcc-std()-Z
tBodyAccJerk-mean()-X
tBodyAccJerk-mean()-Y
tBodyAccJerk-mean()-Z
tBodyAccJerk-std()-X
tBodyAccJerk-std()-Y
tBodyAccJerk-std()-Z
tBodyGyro-mean()-X
tBodyGyro-mean()-Y
tBodyGyro-mean()-Z
tBodyGyro-std()-X
tBodyGyro-std()-Y
tBodyGyro-std()-Z
tBodyGyroJerk-mean()-X
tBodyGyroJerk-mean()-Y
tBodyGyroJerk-mean()-Z
tBodyGyroJerk-std()-X
tBodyGyroJerk-std()-Y
tBodyGyroJerk-std()-Z
tBodyAccMag-mean()
tBodyAccMag-std()
tGravityAccMag-mean()
tGravityAccMag-std()
tBodyAccJerkMag-mean()
tBodyAccJerkMag-std()
tBodyGyroMag-mean()
tBodyGyroMag-std()
tBodyGyroJerkMag-mean()
tBodyGyroJerkMag-std()
fBodyAcc-mean()-X
fBodyAcc-mean()-Y
fBodyAcc-mean()-Z
fBodyAcc-std()-X
fBodyAcc-std()-Y
fBodyAcc-std()-Z
fBodyAccJerk-mean()-X
fBodyAccJerk-mean()-Y
fBodyAccJerk-mean()-Z
fBodyAccJerk-std()-X
fBodyAccJerk-std()-Y
fBodyAccJerk-std()-Z
fBodyGyro-mean()-X
fBodyGyro-mean()-Y
fBodyGyro-mean()-Z
fBodyGyro-std()-X
fBodyGyro-std()-Y
fBodyGyro-std()-Z
fBodyAccMag-mean()
fBodyAccMag-std()
fBodyBodyAccJerkMag-mean()
fBodyBodyAccJerkMag-std()
fBodyBodyGyroMag-mean()
fBodyBodyGyroMag-std()
fBodyBodyGyroJerkMag-mean()
fBodyBodyGyroJerkMag-std()
