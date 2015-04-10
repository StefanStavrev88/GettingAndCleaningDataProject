## PART 1: Read tables in train folder.
filepathDataset <- paste0(getwd(), "/UCI HAR Dataset/")
tableTrainSubject <- read.table(paste0(filepathDataset, "train/subject_train.txt"),
  header=F, colClasses=c("integer"), nrows=7352, comment.char="")
tableTrainX <- read.table(paste0(filepathDataset, "train/X_train.txt"), header=F,
  colClasses=c("numeric"), nrows=7352, comment.char="")
tableTrainY <- read.table(paste0(filepathDataset, "train/y_train.txt"), header=F,
  colClasses=c("integer"), nrows=7352, comment.char="")

## PART 2: Read tables in test folder.
tableTestSubject <- read.table(paste0(filepathDataset, "test/subject_test.txt"),
  header=F, colClasses=c("integer"), nrows=2947, comment.char="")
tableTestX <- read.table(paste0(filepathDataset, "test/X_test.txt"), header=F,
  colClasses=c("numeric"), nrows=2947, comment.char="")
tableTestY <- read.table(paste0(filepathDataset, "test/y_test.txt"), header=F,
  colClasses=c("integer"), nrows=2947, comment.char="")

## PART 3: Read features and activities tables.
tableFeatures <- read.table(paste0(filepathDataset, "features.txt"),
  header=F, colClasses=c("integer", "character"), nrows=561, comment.char="")
tableActivities <- read.table(paste0(filepathDataset, "activity_labels.txt"),
  header=F, colClasses=c("integer", "character"), nrows=6, comment.char="")

## PART 4: Bind train/test tables by columns. Bind train and test by rows.
tableTrain <- cbind(tableTrainSubject, tableTrainY, tableTrainX)
tableTest <- cbind(tableTestSubject, tableTestY, tableTestX)
tableTrainAndTest <- rbind(tableTrain, tableTest)
colnames(tableTrainAndTest)[1:2] <- c("subjectID", "activity")

## PART 5: Select only the wanted features/columns. Name feature variables.
wantedFeatures <- tableFeatures[grep("std|mean", tableFeatures[,2]), 2]
colnames(tableTrainAndTest)[-c(1,2)] <- tableFeatures[,2]
tableTrainAndTest <- tableTrainAndTest[, c("subjectID", "activity", wantedFeatures)]

## PART 6: Use descriptive activity names.
tableTrainAndTest$activity <- factor(tableTrainAndTest$activity,
  levels = tableActivities[,1], labels = tableActivities[,2])

## PART 7: Construct final table. Group by subject and activity. Compute feature means.
result <- aggregate(tableTrainAndTest[,3:81],
  by = list(tableTrainAndTest$subjectID, tableTrainAndTest$activity), FUN = mean)
colnames(result)[c(1,2)] <- c("subjectID", "activity")
write.table(result, file="tidyData.txt", row.names = FALSE)