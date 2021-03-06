#CodeBook
#### Filomena Ciccarelli
The file describes all the steps undertaken to make the results presented in the *output_tidy_data.txt* data set replicable.
##How to get the data for the project
The first step is to download the correct underlying data set, available here (in a .zip format):

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The files need to be manually unzipped and placed in the working directory where *run_analysis.R* script is executed (this is a pre-requisite).
## Data set information
Human Activity Recognition Using Smartphones Dataset - database built from the recordings of 30 subjects performing activities of daily living while carrying a smartphone with embedded sensors on the waist.

Each subject (aged between 19-40) performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). The embedded smartphone (Samsung Galaxy S II) accelerometer and gyroscope, captured 3-axial linear acceleration (acc) and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer, acc in variable names, and gyroscope, gyro in variable names) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

####For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

####The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

**NOTE: The Inertial Signals data sets were outside the scope of the project requirement and hence ignored in the tidy data process.**

####Variables
=========================================
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

- mean(): Mean value
- std(): Standard deviation
- mad(): Median absolute deviation 
- max(): Largest value in array
- min(): Smallest value in array
- sma(): Signal magnitude area
- energy(): Energy measure. Sum of the squares divided by the number of values. 
- iqr(): Interquartile range 
- entropy(): Signal entropy
- arCoeff(): Autorregresion coefficients with Burg order equal to 4
- correlation(): correlation coefficient between two signals
- maxInds(): index of the frequency component with largest magnitude
- meanFreq(): Weighted average of the frequency components to obtain a mean frequency
- skewness(): skewness of the frequency domain signal 
- kurtosis(): kurtosis of the frequency domain signal 
- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
- angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'

**NOTE:As per assignment instructions, only the measuraments on the mean() and std() were extracted. These are listed in the tidy data variables section below.**


## Data transformations

In this section we explain the transformations carried out on the data project. Below are the numbered steps as noted in the comment lines of the *run_analysis.R* script.

1. Read the data. The Inertial Signals data sets were not imported.
2. The *features* variable names are extracted from data table and text/character manipulation is carried out with gsub().
The same is applied to the *labels* variable names
3. *x_test* and *x_train* data observation columns are named after *features* columnn names. Activity labels are also mapped onto *y-test* and *y_train* column names. *Subject_test* and *subjest_train* column varaiable were also named with a more descriptive variable name
4. Train and Test data sets are merged in a single data frame using rbind(). The *merged_df* has 10299 rows and 563 columns 
5. A filter (*mean_std_filter*) is applied to the above data frame to select only the measuraments on the mean() and std(). The filter is used to subset the data, the resulting data frame is named *filtered_df*. Columns *subject* and *activity* are cbind() to this data frame. The resulting data set is called *final_df*
6. A group_by function on *subject* and *activity* is used to create *grouped_data*. The output tidy data is obtained applying summarise_each() with function = mean() as requested. Dim(output_tidy_data): 180x88.
7. Export the final tidy data frame and save it as *output_tidy_data.txt* file.



##Tidy data variables
- Features are normalized and bounded within [-1,1]

#####> str(output_tidy_data)

 Variable | properties
------------ | -------------
 $ subject|: int  1 1 1 1 1 1 2 2 2 2 ... 
 $ activity|: Factor w/ 6 levels "walking","walkingupstairs",..: 1 2 3 4 5 6 1 2 3 4 ...
 $ timebodyaccmeanx|: num  0.277 0.255 0.289 0.261 0.279 ...
$ timebodyaccmeany|: num  -0.01738 -0.02395 -0.00992 -0.00131 -0.01614 ...
$ timebodyaccmeanz|: num  -0.1111 -0.0973 -0.1076 -0.1045 -0.1106 ...
$ timebodyaccstdx|: num  -0.284 -0.355 0.03 -0.977 -0.996 ...
 $ timebodyaccstdy|: num  0.11446 -0.00232 -0.03194 -0.92262 -0.97319 ...
 $ timebodyaccstdz|: num  -0.26 -0.0195 -0.2304 -0.9396 -0.9798 ...
$ timegravityaccmeanx|: num  0.935 0.893 0.932 0.832 0.943 ...
$ timegravityaccmeany|: num  -0.282 -0.362 -0.267 0.204 -0.273 ...
$ timegravityaccmeanz|: num  -0.0681 -0.0754 -0.0621 0.332 0.0135 ...
$ timegravityaccstdx|: num  -0.977 -0.956 -0.951 -0.968 -0.994 ...
$ timegravityaccstdy|: num  -0.971 -0.953 -0.937 -0.936 -0.981 ...
$ timegravityaccstdz|: num  -0.948 -0.912 -0.896 -0.949 -0.976 ...
$ timebodyaccjerkmeanx|: num  0.074 0.1014 0.0542 0.0775 0.0754 ...
$ timebodyaccjerkmeany|: num  0.028272 0.019486 0.02965 -0.000619 0.007976 ...
$ timebodyaccjerkmeanz|: num  -0.00417 -0.04556 -0.01097 -0.00337 -0.00369 ...
$ timebodyaccjerkstdx|: num  -0.1136 -0.4468 -0.0123 -0.9864 -0.9946 ...
$ timebodyaccjerkstdy|: num  0.067 -0.378 -0.102 -0.981 -0.986 ...
$ timebodyaccjerkstdz|: num  -0.503 -0.707 -0.346 -0.988 -0.992 ...
$ timebodygyromeanx |: num  -0.0418 0.0505 -0.0351 -0.0454 -0.024 ...
 $ timebodygyromeany |:num  -0.0695 -0.1662 -0.0909 -0.0919 -0.0594 ...
$ timebodygyromeanz|: num  0.0849 0.0584 0.0901 0.0629 0.0748 ...
$ timebodygyrostdx|:num  -0.474 -0.545 -0.458 -0.977 -0.987 ...
$ timebodygyrostdy|: num  -0.05461 0.00411 -0.12635 -0.96647 -0.98773 ...
 $ timebodygyrostdz|: num  -0.344 -0.507 -0.125 -0.941 -0.981 ...
$ timebodygyrojerkmeanx|: num  -0.09 -0.1222 -0.074 -0.0937 -0.0996 ...
$ timebodygyrojerkmeany|: num  -0.0398 -0.0421 -0.044 -0.0402 -0.0441 ...
$ timebodygyrojerkstdx|:num  -0.207 -0.615 -0.487 -0.992 -0.993 ...
$ timebodygyrojerkstdy   |          : num  -0.304 -0.602 -0.239 -0.99 -0.995 ...
$ timebodygyrojerkstdz  |            : num  -0.404 -0.606 -0.269 -0.988 -0.992 ...
$ timebodyaccmagmean      |          : num  -0.137 -0.1299 0.0272 -0.9485 -0.9843 ...
$ timebodyaccmagstd         |        : num  -0.2197 -0.325 0.0199 -0.9271 -0.9819 ...
$ timegravityaccmagmean       |      : num  -0.137 -0.1299 0.0272 -0.9485 -0.9843 ...
$ timegravityaccmagstd             | : num  -0.2197 -0.325 0.0199 -0.9271 -0.9819 ...
 $ timebodyaccjerkmagmean |           : num  -0.1414 -0.4665 -0.0894 -0.9874 -0.9924 ...
$ timebodyaccjerkmagstd    |         : num  -0.0745 -0.479 -0.0258 -0.9841 -0.9931 ...
$ timebodygyromagmean  |             : num  -0.161 -0.1267 -0.0757 -0.9309 -0.9765 ...
$ timebodygyromagstd  |              : num  -0.187 -0.149 -0.226 -0.935 -0.979 ...
$ timebodygyrojerkmagmean |          : num  -0.299 -0.595 -0.295 -0.992 -0.995 ...
$ timebodygyrojerkmagstd   |         : num  -0.325 -0.649 -0.307 -0.988 -0.995 ...
$ freqbodyaccmeanx        |          : num  -0.2028 -0.4043 0.0382 -0.9796 -0.9952 ...
 $ freqbodyaccmeany        |        : num  0.08971 -0.19098 0.00155 -0.94408 -0.97707 ...
$ freqbodyaccmeanz        |          : num  -0.332 -0.433 -0.226 -0.959 -0.985 ...
$ freqbodyaccstdx          |         : num  -0.3191 -0.3374 0.0243 -0.9764 -0.996 ...
$ freqbodyaccstdy           |        : num  0.056 0.0218 -0.113 -0.9173 -0.9723 ...
$ freqbodyaccstdz             |      : num  -0.28 0.086 -0.298 -0.934 -0.978 ...
$ freqbodyaccmeanfreqx |             : num  -0.2075 -0.4187 -0.3074 -0.0495 0.0865 ...
$ freqbodyaccmeanfreqy   |           : num  0.1131 -0.1607 0.0632 0.0759 0.1175 ...
$ freqbodyaccmeanfreqz    |          : num  0.0497 -0.5201 0.2943 0.2388 0.2449 ...
$ freqbodyaccjerkmeanx     |         : num  -0.1705 -0.4799 -0.0277 -0.9866 -0.9946 ...
 $ freqbodyaccjerkmeany      |        : num  -0.0352 -0.4134 -0.1287 -0.9816 -0.9854 ...
$ freqbodyaccjerkmeanz      |        : num  -0.469 -0.685 -0.288 -0.986 -0.991 ...
$ freqbodyaccjerkstdx        |       : num  -0.1336 -0.4619 -0.0863 -0.9875 -0.9951 ...
 $ freqbodyaccjerkstdy       |        : num  0.107 -0.382 -0.135 -0.983 -0.987 ...
 $ freqbodyaccjerkstdz        |       : num  -0.535 -0.726 -0.402 -0.988 -0.992 ...
 $ freqbodyaccjerkmeanfreqx   |       : num  -0.209 -0.377 -0.253 0.257 0.314 ...
$ freqbodyaccjerkmeanfreqy   |       : num  -0.3862 -0.5095 -0.3376 0.0475 0.0392 ...
 $ freqbodyaccjerkmeanfreqz    |      : num  -0.18553 -0.5511 0.00937 0.09239 0.13858 ...
 $ freqbodygyromeanx |                : num  -0.339 -0.493 -0.352 -0.976 -0.986 ...
$ freqbodygyromeany   |              : num  -0.1031 -0.3195 -0.0557 -0.9758 -0.989 ...
$ freqbodygyromeanz     |            : num  -0.2559 -0.4536 -0.0319 -0.9513 -0.9808 ...
$ freqbodygyrostdx        |          : num  -0.517 -0.566 -0.495 -0.978 -0.987 ...
$ freqbodygyrostdy         |         : num  -0.0335 0.1515 -0.1814 -0.9623 -0.9871 ...
$ freqbodygyrostdz           |       : num  -0.437 -0.572 -0.238 -0.944 -0.982 ...
$ freqbodygyromeanfreqx        |     : num  0.0148 -0.1875 -0.1005 0.1892 -0.1203 ...
 $ freqbodygyromeanfreqy          |   : num  -0.0658 -0.4736 0.0826 0.0631 -0.0447 ...
 $ freqbodygyromeanfreqz            | : num  0.000773 -0.133374 -0.075676 -0.029784 0.100608 ...
 $ freqbodyaccmagmean|                : num  -0.1286 -0.3524 0.0966 -0.9478 -0.9854 ...
 $ freqbodyaccmagstd   |              : num  -0.398 -0.416 -0.187 -0.928 -0.982 ...
$ freqbodyaccmagmeanfreq|            : num  0.1906 -0.0977 0.1192 0.2367 0.2846 ...
$ freqbodybodyaccjerkmagmean|        : num  -0.0571 -0.4427 0.0262 -0.9853 -0.9925 ...
$ freqbodybodyaccjerkmagstd  |       : num  -0.103 -0.533 -0.104 -0.982 -0.993 ...
 $ freqbodybodyaccjerkmagmeanfreq|    : num  0.0938 0.0854 0.0765 0.3519 0.4222 ...
 $ freqbodybodygyromagmean         |  : num  -0.199 -0.326 -0.186 -0.958 -0.985 ...
 $ freqbodybodygyromagstd |           : num  -0.321 -0.183 -0.398 -0.932 -0.978 ...
 $ freqbodybodygyromagmeanfreq|       : num  0.268844 -0.219303 0.349614 -0.000262 -0.028606 ...
$ freqbodybodygyrojerkmagstd    |    : num  -0.382 -0.694 -0.392 -0.987 -0.995 ...
 $ freqbodybodygyrojerkmagmeanfreq |  : num  0.191 0.114 0.19 0.185 0.334 ...
 $ angletbodyaccmeangravity        |  : num  0.060454 0.096086 -0.002695 0.027442 -0.000222 ...
 $ angletbodyaccjerkmeangravitymean | : num  -0.00793 -0.06108 0.08993 0.02971 0.02196 ...
 $ angletbodygyromeangravitymean    | : num  0.0131 -0.1947 0.0633 0.0677 -0.0338 ...
 $ angletbodygyrojerkmeangravitymean| : num  -0.0187 0.0657 -0.04 -0.0649 -0.0279 ...
 $ anglexgravitymean                | : num  -0.729 -0.647 -0.744 -0.591 -0.743 ...
$ angleygravitymean                | : num  0.277 0.3348 0.2672 -0.0605 0.2702 ...
 $ anglezgravitymean                | : num  0.0689 0.0742 0.065 -0.218 0.0123 ...
