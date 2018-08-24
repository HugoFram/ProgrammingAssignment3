require(dplyr)

## Extract feature names from the feature.txt file (second column of the file)
colNames <- read.table("UCI HAR Dataset/features.txt")[, 2]

## Extract activity names from the activity_labels.txt file (second column of the file)
activityNames <- read.table("UCI HAR Dataset/activity_labels.txt")[, 2]

## Extract the data sets
trainSet <- tbl_df(read.table("UCI HAR Dataset/train/X_train.txt", col.names = colNames))
testSet <- tbl_df(read.table("UCI HAR Dataset/test/X_test.txt", col.names = colNames))

## Extract activity type indices
trainActivityTypes <- read.table("UCI HAR Dataset/train/Y_train.txt")
testActityTypes <- read.table("UCI HAR Dataset/test/Y_test.txt")

## Extract subject indices
trainSubjectIndices <- read.table("UCI HAR Dataset/train/subject_train.txt")
testSubjectIndices <- read.table("UCI HAR Dataset/test/subject_test.txt")

## Merge the two data sets, activity types and subject indices
fullInertialMeasurements <- rbind(trainSet, testSet)
activityTypes <- rbind(trainActivityTypes, testActityTypes)
subjectIndices <- rbind(trainSubjectIndices, testSubjectIndices)


## Extract only mean and standard deviations measurements (= variables containing either the word "mean" or the word "std")
reducedInertialMeasurements <- select(fullInertialMeasurements, matches(".+mean.*|.+std.*"))

## Add variables with the activity names and subject index
reducedInertialMeasurements$activityName <- activityNames[as.numeric(activityTypes[,])]
reducedInertialMeasurements$subjectIndex <- as.numeric(subjectIndices[,])

## Compute the average of each variable for each activity and each subject
averagedInertialMeasurements <- reducedInertialMeasurements %>%
                                    group_by(activityName, subjectIndex) %>%
                                        summarize_at(vars(tBodyAcc.mean...X:angle.Z.gravityMean.), mean)

## Save the tidy dataset
write.table(x = averagedInertialMeasurements, file = "tidyDataset.txt", row.name = FALSE)