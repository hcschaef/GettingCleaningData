run_analysis <- function() {
  message("Start Part 1A - Loading Training")
  
  ##Training
  labels <- read.table("./activity_labels.txt")
  colnames(labels) <- c("Activity_ID","Activity")
  y_train <- read.table("./train/y_train.txt")
  colnames(y_train) <- c("Activity_ID")
  
  y_train <- merge(y_train,labels,by="Activity_ID")
  
  features <- read.table("./features.txt")
  colnames(features) <- c("Feature_ID","Feature")
  x_train <- read.table("./train/x_train.txt")
  colnames(x_train) <- features$Feature
  
  subject_train <- read.table("./train/subject_train.txt")
  subject_train$Type <- "Train"
  colnames(subject_train) <- c("Subject_ID", "Type")
  
  message("Finish Part 1A - Loading Training")
  message("Start Part 1B - Loading Test")
  
  ##Test
  y_test <- read.table("./test/y_test.txt")
  colnames(y_test) <- c("Activity_ID")
  
  y_test <- merge(y_test,labels,by="Activity_ID")
  
  x_test <- read.table("./test/x_test.txt")
  colnames(x_test) <- features$Feature
  
  subject_test <- read.table("./test/subject_test.txt")
  subject_test$Type <- "Test"
  colnames(subject_test) <- c("Subject_ID", "Type")  
  
  message("Finish Part 1B - Loading Test")
  message("Start Part 1c - Merging")
  
  df_train = data.frame(subject_train, y_train, x_train)
  ##write.table(df_train, "df_all_train.csv", sep=";")
  
  df_test = data.frame(subject_test, y_test, x_test)
  ##write.table(df_test, "df_all_test.csv", sep=";")
  
  df <- rbind(df_train, df_test)
  
  message("Finish Part 1c - Merging")
  message("Start Part 2 - Extrating Mean and Std")
  
  new_columns <- c("Subject_ID",  "Type",	"Activity", grep("mean|std",names(df),value=TRUE))
  
  df <- df[new_columns]
  ##write.table(df, "df_mean_std.csv", sep=";")
  
  message("Finish Part 2 - Extrating Mean and Std")
}