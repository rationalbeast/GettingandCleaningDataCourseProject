# Getting and Cleaning Data Course Project
This repository is created by Anurag Mishra for submission of "Getting and Cleaning Data Course Project". It contains instructions on how to run analysis on dataset of "Human Activity Recognition".

## Dataset
The data linked represents data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

## Files

- `run_analysis.R` : that prepares the data and does the data cleaning part in steps described in the course project. The steps are -
  1. Merges the training and the test sets to create one data set.
  2. Extracts only the measurements on the mean and standard deviation for each measurement.
  3. Uses descriptive activity names to name the activities in the data set
  4. Appropriately labels the data set with descriptive variable names.
  5. A Tidy dataset created from above dataset with the average of each variable for each activity and each subject.

- `Tidy_Data.txt` : The exported final tidy dataset file obtained at the end of `run_analysis.R`.

- Code Book : `codebook.md` : a code book indicating all the variables and summaries calculated, along with units, and any other relevant information.