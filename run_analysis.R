## Import libraries

library(here)
library(dplyr)


## Import metadata

activity_labels <- read.csv(here("UCI HAR Dataset","activity_labels.txt"),
                            sep = "",
                            header = FALSE,
                            col.names = c("id","labels"))

features <- read.csv(here("UCI HAR Dataset","features.txt"),
                     sep = "",
                     header = FALSE,
                     col.names = c("id","varname"))


## Import training data

subject_train <- read.csv(here("UCI HAR Dataset","train","subject_train.txt"),
                          header = FALSE,
                          col.names = c("subject"))

X_train <- read.csv(here("UCI HAR Dataset","train","X_train.txt"),
                    sep = "",
                    header = FALSE,
                    ## Appropriately labels the data set with descriptive variable names.
                    col.names = features$varname)

y_train <- read.csv(here("UCI HAR Dataset","train","y_train.txt"),
                    sep = "",
                    header = FALSE,
                    col.names = c("activity"))


## Import test data

subject_test <- read.csv(here("UCI HAR Dataset","test","subject_test.txt"),
                         header = FALSE,
                         col.names = c("subject"))

X_test <- read.csv(here("UCI HAR Dataset","test","X_test.txt"),
                   sep = "",
                   header = FALSE,
                   ## Appropriately labels the data set with descriptive variable names.
                   col.names = features$varname)

y_test <- read.csv(here("UCI HAR Dataset","test","y_test.txt"),
                   sep = "",
                   header = FALSE,
                   col.names = c("activity"))


## Merges the training and the test sets to create one data set.

subject <- rbind(subject_train,subject_test)
X <- rbind(X_train,X_test)
y <- rbind(y_train,y_test)


## Extracts only the measurements on the mean and standard deviation for each measurement. 

subfeatures <- grep("*mean\\(\\)|std\\(\\)*",features$varname)
X_sub <- X[,subfeatures]


## Uses descriptive activity names to name the activities in the data set.

y$activity <- factor(y$activity,
                     levels = activity_labels$id,
                     labels = activity_labels$labels)

dat_merged <- cbind(subject,y,X_sub)


## Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

dat <- dat_merged  %>% 
  group_by(subject,activity) %>% 
  summarize(across(names(X_sub),mean))
write.table(dat, file = "dat.csv", row.name=FALSE, sep = ",") 
