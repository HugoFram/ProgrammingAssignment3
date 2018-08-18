library(dplyr)

## Extract feature names from the feature.txt file (second column of the file)
colNames <- read.table("UCI HAR Dataset/features.txt")[, 2]

## Extract the data sets
trainSet <- tbl_df(read.table("UCI HAR Dataset/train/X_train.txt", col.names = colNames))
testSet <- tbl_df(read.table("UCI HAR Dataset/test/X_test.txt", col.names = colNames))