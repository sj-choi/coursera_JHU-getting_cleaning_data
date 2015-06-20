###################################################
### Coursera Project: Getting and Cleaning Data ###
### Seongjin Choi                               ###
### June 2015                                   ###
###################################################

### Step 1. ###
# Read features.txt file, which contains the variable names in the data set to be read.
setwd("/Users/user_name/Desktop/coursera/get_clean/prj/UCI_HAR_Dataset")
features <- read.table("features.txt", sep="", col.names=c("number", "features"))

# Set the working directory for train data set.
setwd("/Users/user_name/Desktop/coursera/get_clean/prj/UCI_HAR_Dataset/train")
# Read-in 'subject ids' from the 'subject_train.txt'.
subject_train <- read.table("subject_train.txt", col.names=c("subject"))
# Contents of the Second column in the feature.txt were used as variable names. 
X_train <- read.table("X_train.txt", sep="", col.names=t(features)[2,])
# Read-in 'activity types' from the 'y_train.txt'.
y_train <- read.table("y_train.txt", sep="", col.names=c("activity_type"))
# Data frame for the train set, which includes all variables, subejct IDs, and activity types. 
df.train <- data.frame(subject_train, y_train, X_train)

# Set the working directory for test data set.
setwd("/Users/user_name/Desktop/coursera/get_clean/prj/UCI_HAR_Dataset/test") 
# Read-in 'subject ids' from the 'subject_test.txt'.
subject_test <- read.table("subject_test.txt", col.names=c("subject"))
# Contents of the Second column in the feature.txt were used as variable names.
X_test <- read.table("X_test.txt", sep="", col.names=t(features)[2,])
# Read-in 'activity types' from the 'y_test.txt'.
y_test <- read.table("y_test.txt", sep="", col.names=c("activity_type"))
# Data frame for the test set.
df.test <- data.frame(subject_test, y_test, X_test)

# Merge two data sets using 'bind_rows' function and reorder the resulting data frame using 'arrange' function.
library(dplyr)
df.merged <- bind_rows(df.train, df.test)
df.merged.ordered <- arrange(df.merged, subject, activity_type)


### Step 2. ###
# 'select' function was used to choose the columns contains means and standard deviations.
df.merged.mean <- df.merged.ordered %>% select(subject, activity_type, contains("mean"))
df.merged.std <- df.merged.ordered %>% select(contains("std"))
df.merged.mean.std <- bind_cols(df.merged.mean, df.merged.std)


### Step 3. ###
# Coverting activity codes to desctriptive activity type names using combination of 'for loop' and 'if statement'.
for (i in 1:length(df.merged.mean.std[,1])) {
  if(df.merged.mean.std[i,]$activity_type == 1) {
    df.merged.mean.std[i,]$activity_type = "WALKING"
  } else if(df.merged.mean.std[i,]$activity_type == 2) {
    df.merged.mean.std[i,]$activity_type = "WALKING_UPSTAIRS"
  } else if(df.merged.mean.std[i,]$activity_type == 3) {
    df.merged.mean.std[i,]$activity_type = "WALKING_DOWNSTAIRS"
  } else if(df.merged.mean.std[i,]$activity_type == 4) {
    df.merged.mean.std[i,]$activity_type = "SITTING"
  } else if(df.merged.mean.std[i,]$activity_type == 5) {
    df.merged.mean.std[i,]$activity_type = "STANDING"
  }
  else {
    df.merged.mean.std[i,]$activity_type = "LAYING"
  }
}      


### Step 4. ###
# This was already taken care of in the step 1. 


### Step 5. ###
# 'aggregate' function was used to get the average of each variable for each activity and each subject.
tidy.2nd <- aggregate(df.merged.mean.std[, 3:ncol(df.merged.mean.std)], by=list(subject=df.merged.mean.std$subject, activity_type=df.merged.mean.std$activity_type ), FUN = mean)
# Save the result in a text file in the following directory.
setwd("/Users/user_name/Desktop/coursera/get_clean/prj")
write.table(tidy.2nd, file="tidy2nd.txt", sep=" ", row.name=FALSE)



