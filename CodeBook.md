Getting and Cleaning Data - Course Project
================
Gustavo E. Pazos

Code Book
---------

### Data source

The data source for this project is the **Human Activity Recognition Using Smartphones Dataset, Version 1.0** and was obtained from the UCI Machine Learning Repository. It represents data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

The database can be downloaded from:

<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

The database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors. Each person performed six activities (walking, walking upstairs, walking dwonstairs, sitting, standing and laying) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity were captured at a constant rate of 50Hz. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data (Anguita et al. 2012).

The database contains multiple files, of which the following are used for this project:

-   'features.txt': List of all features.

-   'activity\_labels.txt': Links the class labels with their activity name.

-   'train/X\_train.txt': Training set.

-   'train/y\_train.txt': Training activity class labels.

-   'train/subject\_train.txt': Each row identifies the subject who performed the activity for each window sample.

-   'test/X\_test.txt': Test set.

-   'test/y\_test.txt': Test activity class labels.

-   'test/subject\_test.txt': Each row identifies the subject who performed the activity for each window sample.

Refer to files *README.txt* and *features\_info.txt* of the database for more information about the experiments, measurements, calculated variables (features) and credits.

### Tidy data subsets

Through this project, I provide two tidy data sets which represent a subset of the complete database. The objective was to extract and work with the measurements on the mean and standard deviation for each variable for the whole set of subjects (train+test sets combined). The data sets are:

**mean\_std\_tidy\_dataset.txt**: a 10299 x 82 table containing the following variables:
\* 'subject': subject id.

-   'activity\_class': activity id.

-   'activity\_description': activity name (according to *activity\_labels.txt*).

-   a subset consisting of the 79 variables containing the mean and standard deviation of the measurements.

**avg\_tidy\_dataset.txt**: a 180 x 82 table containing the average values of each of the 79 variables for each subject and activity. Column names are the same as the above data set.

### R code

The R scripts used for this project are also provided in file **run\_analysis.R**, with explanatory comments at each step in the analysis. *NOTE:* to run the code, the HAR dataset must be unzipped and stored in a subfolder named 'UCI\_HAR\_Dataset'.

### References

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
