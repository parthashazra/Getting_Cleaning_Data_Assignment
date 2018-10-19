# Code book for *Getting and Cleaning Data* course project

See the `README.md` file of this repository for background information on this data set.

## Data

The 2nd_tidy_data.txt data file is a space-separated text file. Details of the data set is explained below in multiple sections.

### Variables

Total of 81 variables in each row and hence for a given subject and activity, data set has 79 averaged signal measurements.

### Identifiers

I)  subject

	Subject identifier, integer, ranges from 1 to 30.

II) activity

	Activity identifier, with 6 possible values, string
	1. WALKING
	2. WALKING_UPSTAIRS
	3. WALKING_DOWNSTAIRS
	4. SITTING
	5. STANDING
	6. LAYING

### Average of measurements

All measurements are floating-point values. There are 2 classified domains

(i)  Time-domain signals (`timeDomain` prefix)
(ii) Frequency-domain signals (`frequencyDomain` prefix)

There are multiple types of measurement of different aspects from device are recorded.

*For Time Domain Signals*

- Mean of body acceleration in the X, Y and Z directions which contains *BodyAccelerometerMean*
- Standard deviation of body acceleration in the X, Y and Z directions which contains *BodyAccelerometerStandardDeviation*
- Mean of gravity acceleration in the X, Y and Z directions which contains *GravityAccelerometerMean*
- Standard deviation of gravity acceleration in the X, Y and Z directions which contains *GravityAccelerometerStandardDeviation*
- Mean of body acceleration jerk in the X, Y and Z directions which contains *BodyAccelerometerJerk*
- Standard deviation of body acceleration jerk in the X, Y and Z directions which contains *BodyAccelerometerJerkStandardDeviation*
- Mean of body angular velocity in the X, Y and Z directions which contains *BodyGyroscopeMean*
- Standard deviation of body angular velocity in the X, Y and Z directions which contains *BodyGyroscopeStandardDeviation*
- Mean of time-domain body angular velocity jerk in the X, Y and Z directions which contains *BodyGyroscopeJerkMean*
- Standard deviation of body angular velocity jerk in the X, Y and Z directions which contains *BodyGyroscopeJerkStandardDeviation*
- Mean and standard deviation of the time-domain magnitude of body acceleration termed as *timeDomainBodyAccelerometerMagnitudeMean* & *timeDomainBodyAccelerometerMagnitudeStandardDeviation*
- Mean and standard deviation of the time-domain magnitude of gravity acceleration termed as *timeDomainGravityAccelerometerMagnitudeMean* & *timeDomainGravityAccelerometerMagnitudeStandardDeviation*
- Mean and standard deviation of the time-domain magnitude of body acceleration jerk termed as *timeDomainBodyAccelerometerJerkMagnitudeMean* & *timeDomainBodyAccelerometerJerkMagnitudeStandardDeviation*
- Mean and standard deviation of the time-domain magnitude of body angular velocity termed as *timeDomainBodyGyroscopeMagnitudeMean* & *timeDomainBodyGyroscopeMagnitudeStandardDeviation*
- Mean and standard deviation of the time-domain magnitude of body angular velocity jerk termed as *timeDomainBodyGyroscopeJerkMagnitudeMean* & *timeDomainBodyGyroscopeJerkMagnitudeStandardDeviation*

*For Frequency-domain signals*

- Mean body acceleration in the X, Y and Z directions which contains *BodyAccelerometerMean*
- Standard deviation of body acceleration in the X, Y and Z directions which contains *BodyAccelerometerStandardDeviation*
- Weighted mean of the frequency components of the frequency-domain body acceleration in the X, Y and Z directions whcih contains *BodyAccelerometerMeanFrequency*
- Mean body acceleration jerk in the X, Y and Z directions which contains *BodyAccelerometerJerkMean*
- Standard deviation of body acceleration jerk in the X, Y and Z directions *BodyAccelerometerJerkStandardDeviation*
- Weighted average of the frequency components of the frequency-domain body acceleration jerk in the X, Y and Z directions which contains *BodyAccelerometerJerkMeanFrequency*
- Mean body angular velocity in the X, Y and Z directions *BodyGyroscopeMean*
- Standard deviation of body angular velocity in the X, Y and Z directions *BodyGyroscopeStandardDeviation*
- Weighted mean of the frequency components of the frequency-domain body angular velocity in the X, Y and Z directions *BodyGyroscopeMeanFrequency*
- Mean, standard deviation and weighted mean of the frequency components of the frequency-domain magnitude of body acceleration termed as *frequencyDomainBodyAccelerometerMagnitudeMean*, *frequencyDomainBodyAccelerometerMagnitudeStandardDeviation* and *frequencyDomainBodyAccelerometerMagnitudeMeanFrequency*
- Mean, standard deviation and weighted mean of the frequency components of the frequency-domain magnitude of body acceleration jerk  termed as *frequencyDomainBodyAccelerometerJerkMagnitudeMean*, *frequencyDomainBodyAccelerometerJerkMagnitudeStandardDeviation* & *frequencyDomainBodyAccelerometerJerkMagnitudeMeanFrequency*
- Mean, standard deviation and weighted mean of the frequency components of the frequency-domain magnitude of body angular velocity termed as  *frequencyDomainBodyGyroscopeMagnitudeMean*, *frequencyDomainBodyGyroscopeMagnitudeStandardDeviation* & *frequencyDomainBodyGyroscopeMagnitudeMeanFrequency*
- Mean, standard deviation and weighted mean of the frequency components of the frequency-domain magnitude of body angular velocity jerk termed as *frequencyDomainBodyGyroscopeJerkMagnitudeMean*, *frequencyDomainBodyGyroscopeJerkMagnitudeStandardDeviation* & *frequencyDomainBodyGyroscopeJerkMagnitudeMeanFrequency*

## Code - Step Details

Source data is extracted from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

The following transformations were applied to the source data:

1. Training &  Test data sets were merged to create one data set - *merged_Data*
2. Columns related to mean and standard deviation were extracted for each measurement, and the others were discarded.
3. Activity identifiers (an integer between 1 and 6 which is stored in column 'Activity ID') were replaced with descriptive activity names see in *Identifiers* section.
4. The variable (column from column index #3 to #81) names were replaced with descriptive variable names using the following set of rules:
	- Special characters `(`, `)`, and `-` were removed
	- The initial `f` and `t` were expanded to `frequencyDomain` and `timeDomain` respectively.
	- `Acc`, `Gyro`, `Mag`, `Freq`, `mean`, and `std` were replaced with `Accelerometer`, `Gyroscope`, `Magnitude`, `Frequency`, `Mean`, and `StandardDeviation` respectively.
5. From the data set in step 4, the final data set (*Second_Tidy_Data*) was created with the mean of each variable grouped by each activity and each subject.
6. Final data set (*Second_Tidy_Data*) was wrote in *2nd_tidy_data.txt* - Please check the file in the repository.

#*End of CODEBOOK*
