==================================================================
# Getting and Cleaning Data Course Project
Version 1.0
26th Oct 2014
==================================================================
Hans-Christian Schaefer
PricewaterhouseCoopers AG
hans-christian.schaefer@ch.pwc.com
www.pwc.ch
==================================================================
## Overview
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set as part of the Getting and Cleaning Data Course. The goal is to prepare tidy data that can be used for later analysis. Therefor the following points will be created:
1. A tidy data set as described below
2. A link to a Github repository with the script for performing the analysis
3. A code book that describes the variables, the data, and any transformations which were used to clean up the data called CodeBook.md.
==================================================================
### Fast Start
To start the Analysis the function "run_analysis" from run_analysis.R in the main directory must be startet. The input files will be consumed and the output files will be created. The function will promt the status of the analysis during the runtime.
### Definition of tify data set used for this project
Depending on the interpretation of a tidy data set, this could support either data in the wide (many columns, less rows) or the long form (less columns, many rows) being in tidy format. I used the wide format. See the codebook for the specific description of the tidy data file contents.
==================================================================
### Input
One of the most exciting areas in all of data science right now is wearable computing. Many Companies are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. The following data sets are nessesary for the analysis to run:
1. ./activity_labels.txt (must be in the root folder of run_analysis.R)
2. ./features.txt (must be in the root folder of run_analysis.R)
3. ./test/subject_test.txt (must be in the test subfolder below run_analysis.R)
4. ./test/X_test.txt (must be in the test subfolder below run_analysis.R)
5. ./test/y_test.txt (must be in the test subfolder below run_analysis.R)
6. ./tain/subject_train.txt (must be in the train subfolder below run_analysis.R)
7. ./train/X_train.txt (must be in the train subfolder below run_analysis.R)
8. ./train/y_train.txt (must be in the train subfolder below run_analysis.R)
==================================================================
### Scripts and other files
The following files are included in this project:
1. ./run_analysis.R (The analysis can be started by running the function "run_analysis" from run_analysis.R in the main directory.)
2. ./README.md (This file, containing an overview and information about the input, scripts, operations and output)
3. ./CodeBook.md (A code book that describes the variables, the data, and any transformations or work that you performed to clean up the data)
No other scripts are necessary to run the analysis.
==================================================================
### Operations
The following operations will be performed on the input data:
1. The training and the test sets will be merged to create one data set.
2. Only the measurements on the mean and standard deviation for each measurement will be extracted. 
3. Descriptive activity names will be used to name the activities in the data set
4. The data set will be labeled with descriptive variable names. 
5. From the data set in step 4, a second, independent tidy data set with the average of each variable for each activity and each subject will be created.
==================================================================
### Output
The following output files will be created:
1. ./df_tidy_data.txt (Tidy data set with the average of each variable for each activity and each subject)
2. ./CSV_exports/df_test.csv (Data frame containing all test data sets)
3. ./CSV_exports/df_train.csv (Data frame containing all training data sets)
4. ./CSV_exports/df_all.csv (Data frame containing the merged test and training data sets)
5. ./CSV_exports/df_mean_std.csv (Same data frame as the tidy data set)
6. ./CSV_exports/df_average.csv