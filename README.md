## Coursera Getting and Cleaning Data course project

### As part of the JHU special course for R in Data Science, I need to submit this project to demonstrate my ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. In this project, data collected from the accelerometer and gyroscope of the Samsung Galaxy S smartphone was retrieved, worked with, and cleaned.

This repository contains the following files:

1. README.md 

This file provides an overview of the data set and how it was created.
tidy_data.txt, which contains the data set.

2. CodeBook.md

The code book describes data, variables and transformations used to generate the data.

3. run_analysis.R 

R script that was used to create the data set.

Study design

One of the most exciting areas in all of data science right now is wearable computing - Companies like 

Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 

years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, 

STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded 

accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a 

constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The 

obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected 

for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then 

sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor 

acceleration signal, which has gravitational and body motion components, was separated using a 

Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to 

have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each 

window, a vector of features was obtained by calculating variables from the time and frequency domain.

Training and test data were first merged together to create one data set, then the measurements on the 

mean and standard deviation were extracted for each measurement (79 variables extracted from the 

original 561), and then the measurements were averaged for each subject and activity, resulting in the 

final data set.

Creating the data set in following steps

1. Download, unzip source data and store it locally.
2. Read & Stage data in R Memory.
3. Merge Training & Test data sets.
4. Filtering out unnecessary columns
5. Assigning descriptive names to activities in the data set
6. Labelling the column of data set with descriptive names
7. Creating a second independent tidy data set
8. Write text file for second independent tidy data set


2nd_tidy_data.txt in this repository was created by running the run_analysis.R.
