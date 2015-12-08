#course project
#Here are the data for the project: 
#https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
#  You should create one R script called run_analysis.R that does the following. 
#1.	Merges the training and the test sets to create one data set.
#2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
#3.	Uses descriptive activity names to name the activities in the data set
#4.	Appropriately labels the data set with descriptive variable names. 
#5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.



#The script to complete the assignment above follows

#Step 1. Download the data for the project
library(downloader)
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download(fileurl, dest="dataset.zip", mode="wb") 
unzip ("dataset.zip", exdir = ".")  # this command creates a directory "UCI HAR Dataset" that contains the data and extracts the files 

#Step 2. Read the files into a data frame
testfileurl  <- "./UCI HAR Dataset/test/X_test.txt"
trainfileurl <- "./UCI HAR Dataset/train/X_train.txt"

testdata <- read.table(testfileurl, header = FALSE)   #read the test data into a data frame
traindata <- read.table(trainfileurl, header = FALSE)  #read the train data into a data frame

#Step 3. Create a subset of only the mean and standard deviation columns of the data set
testdata_meanstd  <- testdata[c(1:6,41:46,81:86,121:126,161:166,201:202,214:215,227:228,240:241,253:254,266:271,345:350,424:429,503:504,516:517,529:530,542:543)] 
traindata_meanstd <- traindata[c(1:6,41:46,81:86,121:126,161:166,201:202,214:215,227:228,240:241,253:254,266:271,345:350,424:429,503:504,516:517,529:530,542:543)] 

#Step 4. Combine the data into one file
testtraindata_meanstd <- rbind(testdata_meanstd, traindata_meanstd)

#Step 5. Add column names to the data frame
names(testtraindata_meanstd)  <- c("time_Body_Accelerometer_X_axis_mean","time_Body_Accelerometer_Y_axis_mean","time_Body_Accelerometer_Z_axis_mean",
                                   "time_Body_Accelerometer_X_axis_std","time_Body_Accelerometer_Y_axis_std","time_Body_Accelerometer_Z_axis_std",
                                   "time_Gravity_Accelerometer_X_axis_mean","time_Gravity_Accelerometer_Y_axis_mean","time_Gravity_Accelerometer_Z_axis_mean",
                                   "time_Gravity_Accelerometer_X_axis_std","time_Gravity_Accelerometer_Y_axis_std","time_Gravity_Accelerometer_Z_axis_std",
                                   "time_Body_Accelerometer_Jerk_X_axis_mean","time_Body_Accelerometer_Jerk_Y_axis_mean","time_Body_Accelerometer_Jerk_Z_axis_mean",
                                   "time_Body_Accelerometer_Jerk_X_axis_std","time_Body_Accelerometer_Jerk_Y_axis_std","time_Body_Accelerometer_Jerk_Z_axis_std",
                                   "time_Body_Gryoscope_X_axis_mean","time_Body_Gryoscope_Y_axis_mean","time_Body_Gryoscope_Z_axis_mean","time_Body_Gryoscope_X_axis_std",
                                   "time_Body_Gryoscope_Y_axis_std","time_Body_Gryoscope_Z_axis_std","time_Body_Gryoscope_Jerk_X_axis_mean","time_Body_Gryoscope_Jerk_Y_axis_mean",
                                   "time_Body_Gryoscope_Jerk_Z_axis_mean","time_Body_Gryoscope_Jerk_X_axis_std","time_Body_Gryoscope_Jerk_Y_axis_std",
                                   "time_Body_Gryoscope_Jerk_Z_axis_std","time_Body_Accelerometer_Magnitude_mean","time_Body_Accelerometer_Magnitude_std",
                                   "time_Gravity_Accelerometer_Magnitude_mean","time_Gravity_Accelerometer_Magnitude_std","time_Body_Accelerometer_Jerk_Magnitude_mean",
                                   "time_Body_Accelerometer_Jerk_Magnitude_std","time_Body_Gryoscope_Magnitude_mean","time_Body_Gryoscope_Magnitude_std",
                                   "time_Body_Gryoscope_Jerk_Magnitude_mean","time_Body_Gryoscope_Jerk_Magnitude_Std","fft_Body_Accelerometer_X_axis_mean",
                                   "fft_Body_Accelerometer_Y_axis_mean","fft_Body_Accelerometer_Y_axis_mean","fft_Body_Accelerometer_X_axis_std","fft_Body_Accelerometer_Y_axis_std",
                                   "fft_Body_Accelerometer_Z_axis_std","fft_Body_Accelerometer_Jerk_X_axis_mean","fft_Body_Accelerometer_Jerk_Y_axis_mean",
                                   "fft_Body_Accelerometer_Jerk_Z_axis_mean","fft_Body_Accelerometer_Jerk_X_axis_std","fft_Body_Accelerometer_Jerk_Y_axis_std",
                                   "fft_Body_Accelerometer_Jerk_Z_axis_std","fft_Body_Gryoscope_X_axis_mean","fft_Body_Gryoscope_Y_axis_mean","fft_Body_Gryoscope_Y_axis_mean",
                                   "fft_Body_Gryoscope_X_axis_std","fft_Body_Gryoscope_Y_axis_std","fft_Body_Gryoscope_Z_axis_std","fft_Body_Accelerometer_Magnitude_mean",
                                   "fft_Body_Accelerometer_Magnitude_std","fft_Body_Accelerometer_Jerk_Magnitude_mean","fft_Body_Accelerometer_Jerk_Magnitude_std",
                                   "fft_Body_Gryoscope_Magnitude_mean","fft_Body_Gryoscope_Magnitude_std",
                                   "fft_Body_Gryoscope_Jerk_Magnitude_mean","fft_Body_Gryoscope_Jerk_Magnitude_std")
                                    
#Step 6. calculate the mean and standard deviation of each column and place it in a new tidy data set

average_test_train <- colMeans(testtraindata_meanstd, na.rm = FALSE, dims = 1) #calculate means
avg_test_train <- as.data.frame(average_test_train) #convert to data frame

Step 7. Write data to csv files for future use

#write.csv(testtraindata_meanstd, "./test_and_train_meansstd.csv") #if you wanted to write the subset of means and standard deviations to a file use this command                
#write.csv(avg_test_train, "./averages_of_variables.csv") #this would be used if you wanted to output a .csv file
write.table(avg_test_train, "./averages_of_variables.txt",row.name=FALSE)