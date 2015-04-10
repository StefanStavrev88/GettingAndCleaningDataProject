# Getting And Cleaning Data Project - Stefan Stavrev (April, 2015)

## How to produce tidy data from raw data?

* 1. Download raw data from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* 2. Unzip to your R working directory.
* 3. Run the script run_analysis.R (make sure your R working directory is set to where you extracted the raw data).

## How does run_analysis.R work?
Please open run_analysis.R as you read this. It is divided into seven commented parts, and each part is explained below.

### Part 1
Read the files in the train folder: "subject_train.txt", "X_train.txt", "y_train.txt". The following arguments for read.table are set for faster reading: header=F, colClasses=c("integer"), nrows=7352, comment.char="".

### Part 2
Read the files in the test folder (as in Part 1).

### Part 3
Read features.txt and activity_labels.txt (as in Part 1).

### Part 4
Bind by columns, all three train tables. Also, bind by columns all three test tables. Finally, bind by rows the resulting two tables.

### Part 5
Find which feature names contain "std" or "mean". Name all columns in table tableTrainAndTest, except for 1 and 2, to the appropriate feature names from tableFeatures. Finally, select only the wanted features columns.

### Part 6
Name the activities according to the activity names in activity_labels.txt.

### Part 7
Construct the final table with the aggregate function. The first argument is all the data in the resulting table (so far), except for columns 1 and 2, and it specifies all the columns for which we want mean to be computed. The second argument are the columns by which we want to group, that is, "subjectID" and "activity". Finally, the third argument is the mean function, which will be applied to the selected data. Then, proper names are set for the final table. Finally, the tidy table is written to a file.
