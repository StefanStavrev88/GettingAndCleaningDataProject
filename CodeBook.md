# Code Book

## Raw Data
Raw data is available at: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip For more information: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Tidy Data
Tidy data is available at: https://github.com/StefanStavrev88/GettingAndCleaningDataProject/blob/master/tidyData.txt

## Data transformations from raw data to tidy data
* 1. One table was created from the tables/files in the train folder: "subject_train.txt", "X_train.txt", "y_train.txt". All three files/tables have the same number of rows, and so they were simply column binded with cbind() in R.
* 2. Another table was created from the tables/files in the test folder (as in step 1).
* 3. The tables from steps 1 and 2 were row binded with rbind in R.
* 4. Columns from table in step 3, were removed. The columns kept, were specified by the file features.txt in the original dataset.
* 5. Columns from table in step 4, were appropriately named, according to the file activity_labels.txt in the original dataset.
* 6. Finally, in the table from step 6, the data was grouped by the columns "subjectID" and "activity", and then the mean function was applied to the other columns.
* 7. The table was written to a file with: write.table(result, file="tidyData.txt", row.names = FALSE)
 