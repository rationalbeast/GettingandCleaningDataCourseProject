The file `run_analysis.R` is a R script that performs the data preparation as per the 5 steps described in the course project’s definition.

## Downloading the dataset

        First the zip file is downloaded by storing its url in **url1**. Then the zip file is downloaded and unzipped as `UCI HAR Dataset`.

## Reading .txt files as tables and assigning variables to datasets

        1. **activities <- ./activity_labels.txt** : [6 rows, 2 columns]
           List of activities performed when the corresponding measurements were taken and its codes (labels)
        2. **features <- ./features.txt** : [561 rows, 2 columns]
           The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
        3. **X_test <- test/X_test.txt** : [2947 rows, 561 columns]
           contains recorded features test data
        4. **Y_test <- test/y_test.txt** : [2947 rows, 1 columns]
           contains test data of activities’code labels
        5. **subject_test <- test/subject_test.txt** : [2947 rows, 1 column]
           contains test data of 9/30 volunteer test subjects being observed
        6. **X_train <- test/X_train.txt** : [7352 rows, 561 columns]
           contains recorded features train data
        7. **Y_train <- test/y_train.txt** : [7352 rows, 1 columns]
           contains train data of activities’code labels
        8. **subject_train <- test/subject_train.txt** : [7352 rows, 1 column]
           contains train data of 21/30 volunteer subjects being observed

## Creating Test/Train datasets and then Merging both Test Data & Train Data

        1. `test_data`[2947 rows, 563 columns] created by column binding **cbind()** `subject_test`, `Y_test` & `X_test`
        2. `train_data`[7352 rows, 563 columns] created by column binding **cbind()** `subject_train`, `Y_train` & `X_train`
        3. `merged_dataset`[10299 rows, 563 columns] created by row binding **rbind()** `test_data` & `train_data`

## Extracting only mean & standard deviation measurements for each observation
        
        `maindata`[10299 rows, 88 columns] is created by subsetting merged_dataset, selecting (dplyr) only columns: 
        volunteer_no, class_label and the measurements on the mean and standard deviation (std) for each measurement.
        
## Assigning descriptive activity names to name the activities in the data set
        
        Entire numbers in `class_label` column of the `maindata` replaced with corresponding 
        activity taken from `activity_name` column of the `activities` variable
        
## Appropriately labels the data set with descriptive variable names
        
        * `volunteer_no` column in `maindata` renamed into `Subject`
        * `class_label` column in `maindata` renamed into `Activity`
        * All `Acc` in column names replaced by `Accelerometer`
        * All `Gyro` in column names replaced by `Gyroscope`
        * All `BodyBody` in column names replaced by `Body`
        * All `Mag` in column names replaced by `Magnitude`
        * All starting with character `f` in column names replaced by `Frequency`
        * All starting with character `t` in column names replaced by `Time`
        * All `tBody` in column names replaced by `TimeBody`
        * All `meanFreq` in column names replaced by `MeanFrequency`
        * All `std` in column names replaced by `STD`
        * All `mean` in column names replaced by `Mean`
        * All `angle` in column names replaced by `Angle`
        * All `gravity` in column names replaced by `Gravity`
        
## Creating a second independent data set with the average of each variable for each activity and each subject.

        1. `Tidy_Data` is created by using pipeline property of dplyr package, grouping `maindata` by `Subject` & `Activity` 
           and then summarising all (`summarise_all`) by taking mean of each variable.
        2. Exporting `Tidy_Data` into `Tidy_Data.txt` file.