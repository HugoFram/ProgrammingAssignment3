# ProgrammingAssignment3_CodeBook

# The run_analysis.R script performs the following tasks:
#   - Load the training set values from UCI HAR Dataset/train/X_train.txt
#   - Load the test set values from UCI HAR Dataset/test/X_test.txt
#   (Theses sets contain 561 variables whose names are extracted from UCI HAR Dataset/features.txt)
#   - Merge the training and test sets in a table with one named column per variable and one row per observation.
#   - Extract only the measurements on the mean and standard deviation for each observation, that is,
#   only the columns whose name contain the words "mean" and/or "std. --> 86 variables extracted.
#   - Load the type of activity corresponding to each observation (one value per row) from:
#       - UCI HAR Dataset/train/Y_train.txt
#       - UCI HAR Dataset/train/Y_test.txt
#   - Load the index of the subject that performed the activity for each observation (one value per row) from:
#       - UCI HAR Dataset/train/subject_train.txt
#       - UCI HAR Dataset/train/subject_test.txt
#   - Create an independent tidy dataset containing the average of each variable extracted grouped by:
#       - Activity type
#       - Subject index
#   (The two first columns correspond to the activity type and the subject index respectively, and
#   the 86 next columns correspond to the 86 variables extracted previously. The values reported are
#   the average of the variable of the corresponding column for the activity type and subject in dex
#   of the current row.)

# Variables:
 [1] "activityNames"
  Names of the different activities.
 [2] "activityTypes"
  Indices of the different activities.
 [3] "averagedInertialMeasurements"
  Tidy dataset produced by the process described above.
 [4] "colNames"
  Feature names of the originale data.
 [5] "fullInertialMeasurements"   
  Samsung data merged with all the original features.
 [6] "reducedInertialMeasurements" 
  Samsung data merged with only the features containing the words "mean" or "std".
 [7] "subjectIndices"
  Indices of the different subjects who performed the study.
