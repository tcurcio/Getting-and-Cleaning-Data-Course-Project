##Author: Tony Curcio
##Course: Getting and cleaning data - course
##Github Repo: 

##1.You should create one R script called run_analysis.R that does the following. 
##2.Merges the training and the test sets to create one data set.
library(plyr)

##load test data
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
s_test <- read.table("test/subject_test.txt")


##load training data
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
s_train <- read.table("train/subject_train.txt")

##merge data set
x_dataMerge <- rbind(x_train, x_test)
y_dataMerge <- rbind(y_train, y_test)
s_dataMerge <- rbind(s_train, s_test)


##3.Extracts only the measurements on the mean and standard deviation for each measurement. 

f <- read.table("features.txt")

##get appropriate columns using grep to match column names, use "|" to match more than one column
mean__std_features <- grep("-(mean|std)\\(\\)", f[, 2])


##subset X
x_dataMerge <- x_dataMerge[, mean__std_features]

##try correcting column names to match f data frame
names(x_dataMerge) <- f[mean__std_features, 2]

##fix activities
a <- read.table("activity_labels.txt")

##subset y
y_dataMerge[,1] <- a[y_dataMerge[,1],2]



##5.Appropriately labels the data set with descriptive variable names. 
names(y_dataMerge) <- "activity"

##4.Uses descriptive activity names to name the activities in the data set
names(s_dataMerge) <- "subject"

##bind data into one dataset

data <- cbind(x_dataMerge, y_dataMerge, s_dataMerge)


##6.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
a_data <- ddply(data, .(subject, activity), function(x) colMeans(x[,1:66]))

write.table(a_data, "averages_data.txt", row.name=FALSE)