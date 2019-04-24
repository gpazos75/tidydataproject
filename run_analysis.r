#################################################
## GETTING AND CLEANING DATA - COURSE PROJECT ##
################################################
# By Gustavo E. Pazos

## NOTE: The whole source dataset must be unzipped and stored in a sub-folder named UCI_HAR_Dataset

#####################################################
#### READING FILES AND CREATING BASE DATA FRAMES ####
#####################################################

# Required packages
library(data.table)
library(dplyr)

# Names of variables
variables <- fread("UCI_HAR_Dataset\\features.txt")
variables

# Training data
train_data <- fread("UCI_HAR_Dataset\\train\\X_train.txt")
train_data
dim(train_data)	# [1] 7352  561
train_act <- fread("UCI_HAR_Dataset\\train\\y_train.txt")
train_sub <- fread("UCI_HAR_Dataset\\train\\subject_train.txt")

train <- cbind(train_sub, train_act, train_data)
train
colnames(train) <- c("subject","activity_class",variables$V2)
names(train)
dim(train)	#  [1] 7352  563

# Test data
test_data <- fread("UCI_HAR_Dataset\\test\\X_test.txt")
test_data
dim(test_data)	# [1] 2947  561
test_act <- fread("UCI_HAR_Dataset\\test\\y_test.txt")
test_sub <- fread("UCI_HAR_Dataset\\test\\subject_test.txt")

test <- cbind(test_sub, test_act, test_data)
test
colnames(test) <- c("subject","activity_class",variables$V2)
names(test)
dim(test)	#  [1] 2947  563

	# Objects 'train' and 'test' contain the base data frames.
	
##########################
#### PROJECT ACTIVITIES ####
##########################

# 1. Merges the training and the test sets to create one data set.
	
	# Train and test cases are different subjects (rows), so I do a rbind() of both data frames:
	all_data <- rbind(train, test)
	all_data
	dim(all_data) # [1] 10299   563

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
	
	# I perform a column subsetting by logical indexing using grepl():
	mean_std_log <- grepl("subject|activity|mean|std", names(all_data))
	mean_std <- as.data.frame(all_data)[,mean_std_log]
	mean_std
	dim(mean_std) # [1] 10299    81

# 3. Uses descriptive activity names to name the activities in the data set

	# I read the activity-labels file from the source data set and merge it with the above created data frame. The new variable is named 'activity_description' and is movedat the third position:
	act <- fread("UCI_HAR_Dataset\\activity_labels.txt")
	mean_std2 <- merge(mean_std,act,by.x="activity_class",by.y="V1")
	mean_std2
	dim(mean_std2) # [1] 10299    82

	mean_std2 <- rename(mean_std2, activity_description=V2)
	mean_std2 <- mean_std2[,c(2,1,82,3:81)]
	
# 4. Appropriately labels the data set with descriptive variable names.
	
	# Done above. Added variables were named subject, activity_class (for activities' id) and activity_description (for activity names). Original variable names form the source dataset were kept. The tidy data set is printed to the 'mean_std_tidy_dataset.txt' file:
	names(mean_std2)
	write.table(mean_std2, file="mean_std_tidy_dataset.txt", row.names=FALSE)
	
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

	# I use group_by() and summarize_if() to create the data set. Then I add again the 'activity_description' variable, which is lost in the process. Finally, the tidy data set of average values is printed to the 'avg_tidy_dataset.txt' file:
	groups <- mean_std2 %>% group_by(subject,activity_class)
	avg <- summarize_if(groups, is.numeric, mean, na.rm = TRUE)
	avg2 <- merge(avg,act,by.x="activity_class",by.y="V1")
	avg2 <- rename(avg2, activity_description=V2)

	avg_tidy_dataset <- avg2[,c(2,1,82,3:81)]
	dim(avg_tidy_dataset)	# [1] 180  82

	write.table(avg_tidy_dataset, file="avg_tidy_dataset.txt", row.names=FALSE)

#################################################################################
