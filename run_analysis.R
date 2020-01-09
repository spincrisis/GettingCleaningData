
## Getting and Cleaning Data Project
## Author: Ross Lockwood
## Date: January 6, 2020

library(tidyverse)

setwd("~/R/Coursera/GettingCleaningData")

# Load data into memory
train_set <- read.table("./UCI\ HAR\ Dataset\\train\\X_train.txt", stringsAsFactors = FALSE, strip.white = TRUE)
train_labels <- read.table("./UCI\ HAR\ Dataset\\train\\y_train.txt", stringsAsFactors = FALSE, strip.white = TRUE)
train_subject <-  read.table("./UCI\ HAR\ Dataset\\train\\subject_train.txt", stringsAsFactors = FALSE, strip.white = TRUE)

test_set <- read.table("./UCI\ HAR\ Dataset\\test\\X_test.txt", stringsAsFactors = FALSE, strip.white = TRUE)
test_labels <- read.table("./UCI\ HAR\ Dataset\\test\\y_test.txt", stringsAsFactors = FALSE, strip.white = TRUE)
test_subject <- read.table("./UCI\ HAR\ Dataset\\test\\subject_test.txt", stringsAsFactors = FALSE, strip.white = TRUE)

features <- read.table("./UCI\ HAR\ Dataset\\features.txt", stringsAsFactors = FALSE, strip.white = TRUE)
activity_labels <- read.table("./UCI\ HAR\ Dataset\\activity_labels.txt", stringsAsFactors = FALSE, strip.white = TRUE)


# Apply Naming Conventions
train_labels <- left_join(train_labels,activity_labels) # Map the activity names to dataset
test_labels <- left_join(test_labels,activity_labels) # Map the activity names to dataset

colnames(train_set) <- features$V2 
colnames(test_set) <- features$V2

colnames(train_labels) <- c("label","activity") # descriptive column names
colnames(test_labels) <- c("label","activity") # descriptive column names

colnames(train_subject) <- c("subject") # descriptive column names
colnames(test_subject) <- c("subject")  # descriptive column names

# Creates a merged dataset from the training and testing components
training <- cbind(train_subject, train_labels, train_set)
testing <- cbind(test_subject, test_labels, test_set)

complete_set <- rbind(training,testing)

# Search column names for matches with "mean()" and "std()"
column_names <- colnames(complete_set)

logical_columns <- grepl("std\\(\\)|mean\\(\\)|subject|activity", column_names)

complete_set_mean_std <- complete_set[logical_columns]

# Create an tidy dataset
tidy_dataset <- complete_set_mean_std %>% group_by(subject,activity) %>% summarize_each(mean)

write.csv(tidy_dataset,"tidy dataset.csv")
