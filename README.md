# Getting And Cleaning Data Project
Author: Stefan Stavrev

Date: April, 2015

Contact: stefanstavrev88@gmail.com

## Project Description
This is a course project for the course "Getting and Cleaning Data (Johns Hopkins University)" taught by Jeff Leek, Roger D. Peng, Brian Caffo. It is part of a 10 courses specialization in Data Science. The goal of the project was to take raw data as input and to write an R script that will produce tidy data, that is, data that is ready for analysis.                                                           

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

You should create one R script called run_analysis.R that does the following. 
* 1. Merges the training and the test sets to create one data set.
* 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
* 3. Uses descriptive activity names to name the activities in the data set
* 4. Appropriately labels the data set with descriptive variable names. 
* 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## How to produce tidy data from raw data?

* 1. Download raw data from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* 2. Unzip to your R working directory.
* 3. Run the script run_analysis.R (make sure your R working directory is set to where you extracted the raw data).

## How does run_analysis.R work?
Please open run_analysis.R https://github.com/StefanStavrev88/GettingAndCleaningDataProject/blob/master/run_analysis.R as you read this. It is divided into seven commented parts, and each part is explained below.

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

## Code Book
Please also see the code book for more information on the datasets: https://github.com/StefanStavrev88/GettingAndCleaningDataProject/blob/master/CodeBook.md