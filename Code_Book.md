# Data Code Book
## Original description of the data
 The features selected for this dataset come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

 The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

 The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 
 
 For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

## The "tidy" data set

 For this project, I had to merge the 30% test data sets with the remaining 70% train data sets to complete the data set. I only took the data from measurements that had to do with a mean or standard deviation. I also converted variable names to be more readable. Also, the mean was applied to each subject and activity to condense the data. 


## Conversions of variable names

 To make things more readable, I converted original variable names to exclude nasty syntax like "()" and prefixes like "t" and "f". I decided to change "t" to "Time" to indicate the signal was a frequency domain signal. I also decided to change the "f" prefix to "Frequency" to indicate the signal was a frequency domain signal. Although some of the original data was subject to a Fast Fourier Transform, all of that data was stripped out in run_analysis.R. 

 I also decided to extend the names of the following: 
- "Acc" to "Acceleration", to indicate that the signal was a linear acceleration derived from the accelerometer.
- "Mag" to "Magnitude", to indicate that the Euclidean norm was used in calculation of this signal.


## Variables and descriptions

 In addition to the above information, the name "Gyro" used in some variable names refers to the measurement being derived from the gyroscope.    
 The suffixes "-X", "-Y", and "-Z" are used to denote the 3-axial signals in the X, Y, and Z directions, respectively.
 "Subject_ID" is a numerical label in the range [1,30] that corresponds to the subject of the measurements
 "Activity_Label": A character string indicating what activity the subject was doing when the measurements were taken, such as "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING",  or "LAYING". This was added in because the original activity labels were numerical labels in the range [1:6].
	
 Variables containing the name "mean" are estimated from the mean value of the original measurement. Values containing the name "std" are values estimated from the standard deviation of the original signal. Variables containing the name "meanFreq" were estimated using the weighted average of the frequency components to obtain a mean frequency.

## List of variables

#### Note: Each measurement is normalized and bounded within the [-1,1] range. 
- "Subject_ID"
- "Activity_Label"
- "TimeBodyAcceleration-mean-X"
- "TimeBodyAcceleration-mean-Y"
- "TimeBodyAcceleration-mean-Z" 
- "TimeBodyAcceleration-std-X" 
- "TimeBodyAcceleration-std-Y" 
- "TimeBodyAcceleration-std-Z" 
- "TimeGravityAcceleration-mean-X" 
- "TimeGravityAcceleration-mean-Y" 
- "TimeGravityAcceleration-mean-Z" 
- "TimeGravityAcceleration-std-X" 
- "TimeGravityAcceleration-std-Y" 
- "TimeGravityAcceleration-std-Z" 
- "TimeBodyAccelerationJerk-mean-X" 
- "TimeBodyAccelerationJerk-mean-Y" 
- "TimeBodyAccelerationJerk-mean-Z" 
- "TimeBodyAccelerationJerk-std-X" 
- "TimeBodyAccelerationJerk-std-Y" 
- "TimeBodyAccelerationJerk-std-Z" 
- "TimeBodyGyro-mean-X"
- "TimeBodyGyro-mean-Y" 
- "TimeBodyGyro-mean-Z"
- "TimeBodyGyro-std-X"
- "TimeBodyGyro-std-Y" 
- "TimeBodyGyro-std-Z"
- "TimeBodyGyroJerk-mean-X"
- "TimeBodyGyroJerk-mean-Y"
- "TimeBodyGyroJerk-mean-Z"
- "TimeBodyGyroJerk-std-X"
- "TimeBodyGyroJerk-std-Y"
- "TimeBodyGyroJerk-std-Z"
- "TimeBodyAccelerationMagnitude-mean"
- "TimeBodyAccelerationMagnitude-std"
- "TimeGravityAccelerationMagnitude-mean"
- "TimeGravityAccelerationMagnitude-std"
- "TimeBodyAccelerationJerkMagnitude-mean"
- "TimeBodyAccelerationJerkMagnitude-std"
- "TimeBodyGyroMagnitude-mean"
- "TimeBodyGyroMagnitude-std"
- "TimeBodyGyroJerkMagnitude-mean"
- "TimeBodyGyroJerkMagnitude-std"
- "FrequencyBodyAcceleration-mean-X"
- "FrequencyBodyAcceleration-mean-Y"
- "FrequencyBodyAcceleration-mean-Z"
- "FrequencyBodyAcceleration-std-X"
- "FrequencyBodyAcceleration-std-Y"
- "FrequencyBodyAcceleration-std-Z"
- "FrequencyBodyAcceleration-meanFreq-X"
- "FrequencyBodyAcceleration-meanFreq-Y"
- "FrequencyBodyAcceleration-meanFreq-Z"
- "FrequencyBodyAccelerationJerk-mean-X"
- "FrequencyBodyAccelerationJerk-mean-Y"
- "FrequencyBodyAccelerationJerk-mean-Z"
- "FrequencyBodyAccelerationJerk-std-X"
- "FrequencyBodyAccelerationJerk-std-Y"
- "FrequencyBodyAccelerationJerk-std-Z"
- "FrequencyBodyAccelerationJerk-meanFreq-X"
- "FrequencyBodyAccelerationJerk-meanFreq-Y"
- "FrequencyBodyAccelerationJerk-meanFreq-Z"
- "FrequencyBodyGyro-mean-X"
- "FrequencyBodyGyro-mean-Y"
- "FrequencyBodyGyro-mean-Z"
- "FrequencyBodyGyro-std-X"
- "FrequencyBodyGyro-std-Y"
- "FrequencyBodyGyro-std-Z"
- "FrequencyBodyGyro-meanFreq-X"
- "FrequencyBodyGyro-meanFreq-Y"
- "FrequencyBodyGyro-meanFreq-Z"
- "FrequencyBodyAccelerationMagnitude-mean"
- "FrequencyBodyAccelerationMagnitude-std"
- "FrequencyBodyAccelerationMagnitude-meanFreq"
- "FrequencyBodyBodyAccelerationJerkMagnitude-mean"
- "FrequencyBodyBodyAccelerationJerkMagnitude-std"
- "FrequencyBodyBodyAccelerationJerkMagnitude-meanFreq"
- "FrequencyBodyBodyGyroMagnitude-mean"
- "FrequencyBodyBodyGyroMagnitude-std"
- "FrequencyBodyBodyGyroMagnitude-meanFreq"
- "FrequencyBodyBodyGyroJerkMagnitude-mean"
- "FrequencyBodyBodyGyroJerkMagnitude-std"
- "FrequencyBodyBodyGyroJerkMagnitude-meanFreq"
