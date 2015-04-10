# Code Book
Author: Stefan Stavrev

Date: April, 2015

Contact: stefanstavrev88@gmail.com

## Project Description
This is a course project for the course "Getting and Cleaning Data (Johns Hopkins University)" taught by Jeff Leek, Roger D. Peng, Brian Caffo. It is part of a 10 courses specialization in Data Science. The goal of the project was to take raw data as input and to write an R script that will produce tidy data, that is, data that is ready for analysis.                                                           

## Raw Data
Raw data is available at: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip For more information: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Raw Data Dimensions
* subject_test.txt:    2947 x 1
* X_test.txt:          2947 x 561
* y_test.txt:          2947 x 1
* subject_train.txt:   7352 x 1
* X_train.txt:         7352 x 561
* y_train.txt:         7352 x 1

### Raw Data Variables
* subject_test.txt:    One integer column/variable in range 2-24. Each value represents a unique individual.
* X_test.txt:          There are 561 numeric columns/variables. For a complete list see https://github.com/StefanStavrev88/GettingAndCleaningDataProject/blob/master/UCI%20HAR%20Dataset/features.txt. For more information on the variables see https://github.com/StefanStavrev88/GettingAndCleaningDataProject/blob/master/UCI%20HAR%20Dataset/features_info.txt.
* y_test.txt:          One integer column/variable in range 1-6. Each value represents an activity (WALKING=1, WALKING_UPSTAIRS=2, WALKING_DOWNSTAIRS=3, SITTING=4, STANDING=5, LAYING=6).
* subject_train.txt:   One integer column/variable in range 1-30. Each row (one integer) represents a unique individual.
* X_train.txt:         There are 561 numeric columns/variables. For a complete list see https://github.com/StefanStavrev88/GettingAndCleaningDataProject/blob/master/UCI%20HAR%20Dataset/features.txt. For more information on the variables see https://github.com/StefanStavrev88/GettingAndCleaningDataProject/blob/master/UCI%20HAR%20Dataset/features_info.txt.
* y_train.txt:         One integer column/variable in range 1-6. Each value represents an activity (WALKING=1, WALKING_UPSTAIRS=2, WALKING_DOWNSTAIRS=3, SITTING=4, STANDING=5, LAYING=6).

## Tidy Data
Tidy data is available at: https://github.com/StefanStavrev88/GettingAndCleaningDataProject/blob/master/tidyData.txt

## How to produce tidy data from raw data?

* 1. Download raw data from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* 2. Unzip to your R working directory.
* 3. Run the script run_analysis.R (make sure your R working directory is set to where you extracted the raw data).

## Data transformations from raw data to tidy data
* 1. One table was created from the tables/files in the train folder: "subject_train.txt", "X_train.txt", "y_train.txt". All three files/tables have the same number of rows, and so they were simply column binded with cbind() in R.
* 2. Another table was created from the tables/files in the test folder (as in step 1).
* 3. The tables from steps 1 and 2 were row binded with rbind in R.
* 4. Columns from table in step 3, were removed. The columns kept, were specified by the file features.txt in the original dataset.
* 5. Columns from table in step 4, were appropriately named, according to the file activity_labels.txt in the original dataset.
* 6. Finally, in the table from step 6, the data was grouped by the columns "subjectID" and "activity", and then the mean function was applied to the other columns.
* 7. The table was written to a file with: write.table(result, file="tidyData.txt", row.names = FALSE)
For more information see the README.md file: https://github.com/StefanStavrev88/GettingAndCleaningDataProject/blob/master/README.md

