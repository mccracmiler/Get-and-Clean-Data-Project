#Getting and Cleaning Data Course Project - Code Book

=======================================================================================================================
 
###Course Project CODE Book

___UCI HAR DATASET___

####The dataset includes the following files:

 + 'README.txt'
 + 'features_info.txt': Shows information about the variables used on the feature vector.
 + 'features.txt': List of all features.
 + 'activity_labels.txt': Links the class labels with their activity name.
 + 'train/X_train.txt': Training set.
 + 'train/y_train.txt': Training labels.
 + 'test/X_test.txt': Test set.
 + 'test/y_test.txt': Test labels.

=======================================================================================================================

####The following files are available for the train and test data. Their descriptions are equivalent. 

 + 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
 + 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. 
    Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y 
    and Z axis. 
 + 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
 + 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are 
    radians/second. 

=======================================================================================================================
    
####Following is a description of the data found in the data sets as contained in features_info.txt that cam with the data

__Feature Selection__ 

 + The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These 
    time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter
    and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then 
    separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner 
    frequency of 0.3 Hz. 

 + Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals 
    (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm 
    (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

 + Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, 
    fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

####These signals were used to estimate variables of the feature vector for each pattern:  

    '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

=======================================================================================================================

####The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal  
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.

####Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

####The complete list of variables of each feature vector is available in 'features.txt'

==============================================================================================================================

####Descriptive variable names for analysis script are as follows: 

|Variable Name	                             |Type        |Description                           |  
|--------------------------------------------|:----------:|:------------------------------------:|
|time_Body_Accelerometer_X_axis_mean	    |integer     |Mean of variable name                  |
|time_Body_Accelerometer_Y_axis_mean	    |integer     |Mean of variable name                  |
|time_Body_Accelerometer_Z_axis_mean	    |integer     |Mean of variable name                  |
|time_Body_Accelerometer_X_axis_std	        |integer     |Standard Deviation of Varible Name     | 
|time_Body_Accelerometer_Y_axis_std	        |integer     |Standard Deviation of Varible Name     | 
|time_Body_Accelerometer_Z_axis_std	        |integer     |Standard Deviation of Varible Name     | 
|time_Gravity_Accelerometer_X_axis_mean	    |integer     |Mean of variable name                  |
|time_Gravity_Accelerometer_Y_axis_mean	    |integer     |Mean of variable name                  |
|time_Gravity_Accelerometer_Z_axis_mean	    |integer     |Mean of variable name                  |
|time_Gravity_Accelerometer_X_axis_std	    |integer     |Standard Deviation of Varible Name     | 
|time_Gravity_Accelerometer_Y_axis_std	    |integer     |Standard Deviation of Varible Name     | 
|time_Gravity_Accelerometer_Z_axis_std	    |integer     |Standard Deviation of Varible Name     | 
|time_Body_Accelerometer_Jerk_X_axis_mean	|integer     |Mean of variable name                  |
|time_Body_Accelerometer_Jerk_Y_axis_mean	|integer     |Mean of variable name                  |
|time_Body_Accelerometer_Jerk_Z_axis_mean	|integer     |Mean of variable name                  |
|time_Body_Accelerometer_Jerk_X_axis_std	|integer     |Standard Deviation of Varible Name     | 
|time_Body_Accelerometer_Jerk_Y_axis_std	|integer     |Standard Deviation of Varible Name     | 
|time_Body_Accelerometer_Jerk_Z_axis_std	|integer     |Standard Deviation of Varible Name     | 
|time_Body_Gryoscope_X_axis_mean	        |integer     |Mean of variable name                  |
|time_Body_Gryoscope_Y_axis_mean	        |integer     |Mean of variable name                  |
|time_Body_Gryoscope_Z_axis_mean	        |integer     |Mean of variable name                  |
|time_Body_Gryoscope_X_axis_std	            |integer     |Standard Deviation of Varible Name     | 
|time_Body_Gryoscope_Y_axis_std	            |integer     |Standard Deviation of Varible Name     | 
|time_Body_Gryoscope_Z_axis_std	            |integer     |Standard Deviation of Varible Name     | 
|time_Body_Gryoscope_Jerk_X_axis_mean	    |integer     |Mean of variable name                  |
|time_Body_Gryoscope_Jerk_Y_axis_mean	    |integer     |Mean of variable name                  |
|time_Body_Gryoscope_Jerk_Z_axis_mean	    |integer     |Mean of variable name                  |
|time_Body_Gryoscope_Jerk_X_axis_std	    |integer     |Standard Deviation of Varible Name     | 
|time_Body_Gryoscope_Jerk_Y_axis_std	    |integer     |Standard Deviation of Varible Name     | 
|time_Body_Gryoscope_Jerk_Z_axis_std	    |integer     |Standard Deviation of Varible Name     | 
|time_Body_Accelerometer_Magnitude_mean	    |integer     |Mean of variable name                  |
|time_Body_Accelerometer_Magnitude_std	    |integer     |Standard Deviation of Varible Name     | 
|time_Gravity_Accelerometer_Magnitude_mean	|integer     |Mean of variable name                  |
|time_Gravity_Accelerometer_Magnitude_std	|integer     |Standard Deviation of Varible Name     | 
|time_Body_Accelerometer_Jerk_Magnitude_mean|integer     |Mean of variable name                  |
|time_Body_Accelerometer_Jerk_Magnitude_std	|integer     |Standard Deviation of Varible Name     | 
|time_Body_Gryoscope_Magnitude_mean	        |integer     |Mean of variable name                  |
|time_Body_Gryoscope_Magnitude_std	        |integer     |Standard Deviation of Varible Name     | 
|time_Body_Gryoscope_Jerk_Magnitude_mean	|integer     |Mean of variable name                  |
|time_Body_Gryoscope_Jerk_Magnitude_Std	    |integer     |Standard Deviation of Varible Name     | 
|fft_Body_Accelerometer_X_axis_mean	        |integer     |Mean of variable name                  |
|fft_Body_Accelerometer_Y_axis_mean	        |integer     |Mean of variable name                  |
|fft_Body_Accelerometer_Z_axis_mean	        |integer     |Mean of variable name                  |
|fft_Body_Accelerometer_X_axis_std	        |integer     |Standard Deviation of Varible Name     | 
|fft_Body_Accelerometer_Y_axis_std	        |integer     |Standard Deviation of Varible Name     | 
|fft_Body_Accelerometer_Z_axis_std	        |integer     |Standard Deviation of Varible Name     | 
|fft_Body_Accelerometer_Jerk_X_axis_mean	|integer     |Mean of variable name                  |
|fft_Body_Accelerometer_Jerk_Y_axis_mean	|integer     |Mean of variable name                  |
|fft_Body_Accelerometer_Jerk_Z_axis_mean	|integer     |Mean of variable name                  |
|fft_Body_Accelerometer_Jerk_X_axis_std	    |integer     |Standard Deviation of Varible Name     | 
|fft_Body_Accelerometer_Jerk_Y_axis_std	    |integer     |Standard Deviation of Varible Name     | 
|fft_Body_Accelerometer_Jerk_Z_axis_std	    |integer     |Standard Deviation of Varible Name     | 
|fft_Body_Gryoscope_X_axis_mean	            |integer     |Mean of variable name                  |
|fft_Body_Gryoscope_Y_axis_mean	            |integer     |Mean of variable name                  |
|fft_Body_Gryoscope_Z_axis_mean	            |integer     |Mean of variable name                  |
|fft_Body_Gryoscope_X_axis_std	            |integer     |Standard Deviation of Varible Name     | 
|fft_Body_Gryoscope_Y_axis_std	            |integer     |Standard Deviation of Varible Name     | 
|fft_Body_Gryoscope_Z_axis_std	            |integer     |Standard Deviation of Varible Name     | 
|fft_Body_Accelerometer_Magnitude_mean	    |integer     |Mean of variable name                  |
|fft_Body_Accelerometer_Magnitude_std	    |integer     |Standard Deviation of Varible Name     | 
|fft_Body_Accelerometer_Jerk_Magnitude_mean	|integer     |Mean of variable name                  |
|fft_Body_Accelerometer_Jerk_Magnitude_std	|integer     |Standard Deviation of Varible Name     | 
|fft_Body_Gryoscope_Magnitude_mean	        |integer     |Mean of variable name                  |
|fft_Body_Gryoscope_Magnitude_std	        |integer     |Standard Deviation of Varible Name     | 
|fft_Body_Gryoscope_Jerk_Magnitude_mean	    |integer     |Mean of variable name                  |
|fft_Body_Gryoscope_Jerk_Magnitude_std	    |integer     |Standard Deviation of Varible Name     | 

==============================================================================================================================

####These variable names are replicated after the averages are calculated with "_average" added to reflect averages vs. raw numbers 