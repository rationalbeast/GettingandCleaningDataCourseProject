url1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url1, destfile = "./Coursera_DS3_Final.zip", method = "curl")
unzip("Coursera_DS3_Final.zip")
setwd("./UCI HAR Dataset")

activities <- read.table("./activity_labels.txt", col.names = c("class_label", "activity_name"))
features <- read.table("./features.txt", col.names = c("s_no", "features"))

X_test <- read.table("./test/X_test.txt", col.names = features$features)
Y_test <- read.table("./test/y_test.txt", col.names = "class_label")
subject_test <- read.table("./test/subject_test.txt", col.names = "volunteer_no")
test_data <- cbind(subject_test, Y_test, X_test)

X_train <- read.table("./train/X_train.txt", col.names = features$features)
Y_train <- read.table("./train/y_train.txt", col.names = "class_label")
subject_train <- read.table("./train/subject_train.txt", col.names = "volunteer_no")
train_data <- cbind(subject_train, Y_train, X_train)

merged_dataset <- rbind(train_data, test_data)

maindata <- select(merged_dataset, volunteer_no, class_label, contains("mean"), contains("std"))

maindata$class_label <- activities[maindata$class_label,2]
names(maindata)[1] <- "Subject"
names(maindata)[2] <- "Activity"
names(maindata)<-gsub("Acc", "Accelerometer", names(maindata))
names(maindata)<-gsub("Gyro", "Gyroscope", names(maindata))
names(maindata)<-gsub("BodyBody", "Body", names(maindata))
names(maindata)<-gsub("Mag", "Magnitude", names(maindata))
names(maindata)<-gsub("^t", "Time", names(maindata))
names(maindata)<-gsub("^f", "Frequency", names(maindata))
names(maindata)<-gsub("tBody", "TimeBody", names(maindata))
names(maindata)<-gsub("meanFreq", "MeanFrequency", names(maindata))
names(maindata)<-gsub("std", "STD", names(maindata))
names(maindata)<-gsub("mean", "Mean", names(maindata))
names(maindata)<-gsub("angle", "Angle", names(maindata))
names(maindata)<-gsub("gravity", "Gravity", names(maindata))

Tidy_Data <- maindata %>% group_by(Subject, Activity) %>% summarise_all(.funs = mean)
write.table(Tidy_Data, "Tidy_Data.txt", row.name = FALSE)