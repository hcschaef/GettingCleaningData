run_analysis <- function() {
  ## 1. Merges the training and the test sets to create one data set.
  message("Start Part 1A - Loading Training")
  
  ## Start with Training Data
    ## Load the Activity Labels
  labels <- read.table("./activity_labels.txt", check.names = FALSE)
  colnames(labels) <- c("Activity_ID","Activity")
    ## Load the Activity IDs for the Training Data
  y_train <- read.table("./train/y_train.txt")
  colnames(y_train) <- c("Activity_ID")
    ## 3. Uses descriptive activity names to name the activities in the data set
  y_train <- merge(y_train,labels,by="Activity_ID")
  
    ## Load the Feature Lables
  features <- read.table("./features.txt", check.names = FALSE)
  colnames(features) <- c("Feature_ID","Feature")
    ## Load the Data Sets for the Training Data
  x_train <- read.table("./train/x_train.txt")
    ## 4. Appropriately labels the data set with descriptive variable names.
  colnames(x_train) <- features$Feature
  
    ## Load the Person Subject Data
  subject_train <- read.table("./train/subject_train.txt")
    ## Add a Type Column for the Training Data
  subject_train$Type <- "Train"
  colnames(subject_train) <- c("Subject_ID", "Type")
  
  message("Finish Part 1A - Loading Training")
  message("Start Part 1B - Loading Test")
  
  ## Start with Test Data
    ## Load the Activity IDs for the Test Data
  y_test <- read.table("./test/y_test.txt")
  colnames(y_test) <- c("Activity_ID")  
    ## 3. Uses descriptive activity names to name the activities in the data set
  y_test <- merge(y_test,labels,by="Activity_ID")
  
    ## Load the Data Sets for the Training Data
  x_test <- read.table("./test/x_test.txt")
    ## 4. Appropriately labels the data set with descriptive variable names.
  colnames(x_test) <- features$Feature
  
    ## Load the Person Subject Data
  subject_test <- read.table("./test/subject_test.txt")
    ## Add a Type Column for the Test Data
  subject_test$Type <- "Test"
  colnames(subject_test) <- c("Subject_ID", "Type")  
  
  message("Finish Part 1B - Loading Test")
  message("Start Part 1C - Merging")
  
    ## Merging the Training Data in one Data Frame
  df_train = data.frame(subject_train, y_train, x_train, check.names = FALSE)
  write.table(df_train, "./CSV_exports/df_train.csv", sep=";", row.name=FALSE)
  
    ## Merging the Test Data in one Data Frame
  df_test = data.frame(subject_test, y_test, x_test, check.names = FALSE)
  write.table(df_test, "./CSV_exports/df_test.csv", sep=";", row.name=FALSE)
  
    ## Merging both Data Frames into one
  df <- rbind(df_train, df_test)
  write.table(df, "./CSV_exports/df_all.csv", sep=";", row.name=FALSE)
  
  message("Finish Part 1C - Merging")
  message("Start Part 2 - Extrating Mean and Std")
  
  ## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
    ## Get all Standard Columns and the Mean and Std Columns Names
  new_columns <- c("Subject_ID",  "Type",	"Activity", grep("mean|std",names(df),value=TRUE))
  
    ## Create new Data Frame based on the New Column Names
  df <- df[new_columns]
  write.table(df, "./CSV_exports/df_mean_std.csv", sep=";", row.name=FALSE)
  
  message("Finish Part 2 - Extrating Mean and Std")
  message("Start Part 3 - Creating the Average")
  
  ## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    ## Get all Column Names of the mean and std
  new_columns2 <- grep("mean|std",names(df),value=TRUE)
    ## Aggregate the Mean of all mean and std columns based on the column names
  df2 <- aggregate(df[new_columns2], by=df[c("Subject_ID","Activity")], FUN=mean)
  write.table(df2, "./CSV_exports/df_average.csv", sep=";", row.name=FALSE)
  
  message("Finish Part 3 - Creating the Average")
  message("Start Part 4 - Exporting the Tidy Data Set")
  
    ## Export the Tidy Data Set
  write.table(df2, "df_tidy_data.txt", sep=";", row.name=FALSE)
  
  message("Finish Part 4 - Exporting the Tidy Data Set")
}