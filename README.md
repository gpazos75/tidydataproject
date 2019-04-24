Getting and Cleaning Data - Course Project
================
Gustavo E. Pazos

Introduction
------------

This repository contains files associated with my solution to the Course Project of the Coursera's Getting and Cleaning Data course. The goal is to prepare tidy data (that can be used for later analysis) from the [Human Activity Recognition Using Smartphones Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). Refer to the Code Book here provided for information about this database.

R code
------

The R scripts are provided in the file **run\_analysis.R**, which performs the required activities and outputs the tidy data. The code uses functions from the *data.table* and *dplyr* packages and inputs a set of files from the source data base, which must be unzipped and stored in a subfolder named *UCI\_HAR\_Dataset* of the working directory (see the Code Book provided for more information about the database, variables and files used).
This first part of the code reads the train and test data files, as well as the label files for subjects and activities. Then two data frames are created to be used as base tables for subsequent commands. The first two columns contain subject and activity id's and the rest are the 561 measurements (features). Then the following project activities are performed:

1.  *Merges the training and the test sets to create one data set.* Train and test cases are different subjects (rows), so I do a *rbind()* of both data frames to get the whole 30-subjects data set.
2.  *Extracts only the measurements on the mean and standard deviation for each measurement.* I perform a column subsetting by logical indexing using *grepl()*. It searches for the expresion 'subject|activity|mean|std' through the vector of names. A new data frame containing the id's and the subset of variables is created.
3.  *Uses descriptive activity names to name the activities in the data set.* The *activity\_labels.txt* file is read from the source data set and merged with the above created data frame. The merging is performed through the acitvity id column. The new variable is named 'activity\_description' and is moved at the third position.
4.  *Appropriately labels the data set with descriptive variable names.* This was already done in the base data frames. The added variables were named subject, activity\_class (for activities' id) and activity\_description (for activity names). Original variable names from the source dataset were kept (see Code Book). This tidy data set is printed to the **mean\_std\_tidy\_dataset.txt** file, provided in this repo.
5.  *From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.* The *group\_by()* and *summarize\_if()* functions are used to create the data set. Then the 'activity\_description' variable is added again, beacuse it is lost in the process. Finally, the tidy data set of average values is printed to the **avg\_tidy\_dataset.txt** file, also provided here.

Provided files
--------------

-   **run\_analysis.R**. Contains the (self-explained) R code.
-   **mean\_std\_tidy\_dataset.txt**. A table containing the measurements on the mean and standard deviation of the measurements.
-   **avg\_tidy\_dataset.txt**. A table containing the average values of the variables for each subject and activity.
-   **CodeBook.md**. Contains the Code Book of the datasets.
