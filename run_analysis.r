#course project
#Here are the data for the project: 
#https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
#  Create one R script called run_analysis.R that does the following: 
#1.	Merges the training and the test sets to create one data set.
#2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
#3.	Uses descriptive activity names to name the activities in the data set
#4.	Appropriately labels the data set with descriptive variable names. 
#5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.



packages<-function(x){    #function to detemine if needed packages are installed
  x<-as.character(match.call()[[2]])
  if (!require(x,character.only=TRUE)){
    install.packages(pkgs=x,repos="http://cran.r-project.org")
    require(x,character.only=TRUE)
  }
}

packages(dplyr)         #install dplyr if not installed and load it if it installed
packages (downloader)   #install downloader if not installed and load it if it installed


#The script to complete the assignment above follows

#Step 1. Download the data for the project

fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download(fileurl, dest="dataset.zip", mode="wb") 
unzip ("dataset.zip", exdir = ".")  # this command creates a directory "UCI HAR Dataset" that contains the data and extracts the files 

#Step 2. Read the files into data frames
testfileurl  <- "./UCI HAR Dataset/test/X_test.txt"
testsubjectfileurl <- "./UCI HAR Dataset/test/subject_test.txt"
testactvityfileurl <- "./UCI HAR Dataset/test/y_test.txt"

testdata <- read.table(testfileurl, header = FALSE)   #read the test data into a data frame
testsubject <- read.table(testsubjectfileurl, header = FALSE)   #read the test data into a data frame
testactivity <- read.table(testactvityfileurl, header = FALSE)   #read the test data into a data frame

trainfileurl <- "./UCI HAR Dataset/train/X_train.txt"
trainsubjectfileurl <- "./UCI HAR Dataset/train/subject_train.txt"
trainactivityfileurl <- "./UCI HAR Dataset/train/y_train.txt"

traindata <- read.table(trainfileurl, header = FALSE)  #read the train data into a data frame
trainsubject <- read.table(trainsubjectfileurl, header = FALSE)  #read the train data into a data frame
trainactivity <- read.table(trainactivityfileurl, header = FALSE)  #read the train data into a data frame

#Step 2A:  Add column names to subject and activity files
names(testsubject) <- c("subject")
names(testactivity) <- c("activity")
names(trainsubject) <- c("subject")
names(trainactivity) <- c("activity")

columnnames <- c("time_Body_Accelerometer_X_axis_mean","time_Body_Accelerometer_Y_axis_mean","time_Body_Accelerometer_Z_axis_mean",
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
                                   "fft_Body_Accelerometer_Y_axis_mean","fft_Body_Accelerometer_Z_axis_mean","fft_Body_Accelerometer_X_axis_std","fft_Body_Accelerometer_Y_axis_std",
                                   "fft_Body_Accelerometer_Z_axis_std","fft_Body_Accelerometer_Jerk_X_axis_mean","fft_Body_Accelerometer_Jerk_Y_axis_mean",
                                   "fft_Body_Accelerometer_Jerk_Z_axis_mean","fft_Body_Accelerometer_Jerk_X_axis_std","fft_Body_Accelerometer_Jerk_Y_axis_std",
                                   "fft_Body_Accelerometer_Jerk_Z_axis_std","fft_Body_Gryoscope_X_axis_mean","fft_Body_Gryoscope_Y_axis_mean","fft_Body_Gryoscope_Z_axis_mean",
                                   "fft_Body_Gryoscope_X_axis_std","fft_Body_Gryoscope_Y_axis_std","fft_Body_Gryoscope_Z_axis_std","fft_Body_Accelerometer_Magnitude_mean",
                                   "fft_Body_Accelerometer_Magnitude_std","fft_Body_Accelerometer_Jerk_Magnitude_mean","fft_Body_Accelerometer_Jerk_Magnitude_std",
                                   "fft_Body_Gryoscope_Magnitude_mean","fft_Body_Gryoscope_Magnitude_std",
                                   "fft_Body_Gryoscope_Jerk_Magnitude_mean","fft_Body_Gryoscope_Jerk_Magnitude_std")
                                

#Step 2B. Create a subset of only the mean and standard deviation columns of the test data set
testdata_meanstd  <- testdata[c(1:6,41:46,81:86,121:126,161:166,201:202,214:215,227:228,240:241,253:254,266:271,345:350,424:429,503:504,516:517,529:530,542:543)] 
names(testdata_meanstd) <- columnnames    #  add names to mean and standard deviation subset

#Step 3. Combine test actvity data subset with test subject and test activity
testdata_meanstd <- cbind(testsubject, testactivity, testdata_meanstd)
 
#Step 4. Create a subset of only the mean and standard deviation columns of the train data set
traindata_meanstd <- traindata[c(1:6,41:46,81:86,121:126,161:166,201:202,214:215,227:228,240:241,253:254,266:271,345:350,424:429,503:504,516:517,529:530,542:543)] 
names(traindata_meanstd) <- columnnames     #  add names to mean and standard deviation subset

#Step 5. Combine train activity data subset with train subject and train activity
traindata_meanstd <- cbind(trainsubject, trainactivity, traindata_meanstd)

#Step 6. Combine the training data set and test data sets into one file
testtraindata_meanstd <- rbind(testdata_meanstd, traindata_meanstd)

#Step 7 convert the activity into a label

library(dplyr)

testtraindata_meanstd <- mutate(testtraindata_meanstd, activity = ifelse(activity == 1, "WALKING", ifelse(activity == 2, "WALKING_UPSTAIRS",
                                ifelse(activity == 3, "WALKING_DOWNSTAIRS", ifelse(activity == 4, "SITTING", 
                                ifelse(activity == 5, "STANDING", ifelse(activity == 6, "LAYING", NA)))))))


#Step 8 summarize the data by subject and activity calculating averages for each of the variables and rename the columns to reflect averages

average_test_train  <- testtraindata_meanstd %>%
    group_by(subject,activity) %>% 
    summarise_each(funs(mean)) #create average            


#revise column names to reflect averages
names(average_test_train) <- c("subject","activity","time_Body_Accelerometer_X_axis_mean_average","time_Body_Accelerometer_Y_axis_mean_average",
                                "time_Body_Accelerometer_Z_axis_mean_average","time_Body_Accelerometer_X_axis_std_average","time_Body_Accelerometer_Y_axis_std_average",
                                "time_Body_Accelerometer_Z_axis_std_average","time_Gravity_Accelerometer_X_axis_mean_average","time_Gravity_Accelerometer_Y_axis_mean_average",
                                "time_Gravity_Accelerometer_Z_axis_mean_average","time_Gravity_Accelerometer_X_axis_std_average","time_Gravity_Accelerometer_Y_axis_std_average",
                                "time_Gravity_Accelerometer_Z_axis_std_average","time_Body_Accelerometer_Jerk_X_axis_mean_average","time_Body_Accelerometer_Jerk_Y_axis_mean_average",
                                "time_Body_Accelerometer_Jerk_Z_axis_mean_average","time_Body_Accelerometer_Jerk_X_axis_std_average","time_Body_Accelerometer_Jerk_Y_axis_std_average",
                                "time_Body_Accelerometer_Jerk_Z_axis_std_average","time_Body_Gryoscope_X_axis_mean_average","time_Body_Gryoscope_Y_axis_mean_average",
                                "time_Body_Gryoscope_Z_axis_mean_average","time_Body_Gryoscope_X_axis_std_average","time_Body_Gryoscope_Y_axis_std_average",
                                "time_Body_Gryoscope_Z_axis_std_average","time_Body_Gryoscope_Jerk_X_axis_mean_average","time_Body_Gryoscope_Jerk_Y_axis_mean_average",
                                "time_Body_Gryoscope_Jerk_Z_axis_mean_average","time_Body_Gryoscope_Jerk_X_axis_std_average","time_Body_Gryoscope_Jerk_Y_axis_std_average",
                                "time_Body_Gryoscope_Jerk_Z_axis_std_average","time_Body_Accelerometer_Magnitude_mean_average","time_Body_Accelerometer_Magnitude_std_average",
                                "time_Gravity_Accelerometer_Magnitude_mean_average","time_Gravity_Accelerometer_Magnitude_std_average",
                                "time_Body_Accelerometer_Jerk_Magnitude_mean_average","time_Body_Accelerometer_Jerk_Magnitude_std_average","time_Body_Gryoscope_Magnitude_mean_average",
                                "time_Body_Gryoscope_Magnitude_std_average","time_Body_Gryoscope_Jerk_Magnitude_mean_average","time_Body_Gryoscope_Jerk_Magnitude_Std_average",
                                "fft_Body_Accelerometer_X_axis_mean_average","fft_Body_Accelerometer_Y_axis_mean_average","fft_Body_Accelerometer_Z_axis_mean_average",
                                "fft_Body_Accelerometer_X_axis_std_average","fft_Body_Accelerometer_Y_axis_std_average","fft_Body_Accelerometer_Z_axis_std_average",
                                "fft_Body_Accelerometer_Jerk_X_axis_mean_average","fft_Body_Accelerometer_Jerk_Y_axis_mean_average","fft_Body_Accelerometer_Jerk_Z_axis_mean_average",
                                "fft_Body_Accelerometer_Jerk_X_axis_std_average","fft_Body_Accelerometer_Jerk_Y_axis_std_average","fft_Body_Accelerometer_Jerk_Z_axis_std_average",
                                "fft_Body_Gryoscope_X_axis_mean_average","fft_Body_Gryoscope_Y_axis_mean_average","fft_Body_Gryoscope_Z_axis_mean_average",
                                "fft_Body_Gryoscope_X_axis_std_average","fft_Body_Gryoscope_Y_axis_std_average","fft_Body_Gryoscope_Z_axis_std_average",
                                "fft_Body_Accelerometer_Magnitude_mean_average","fft_Body_Accelerometer_Magnitude_std_average","fft_Body_Accelerometer_Jerk_Magnitude_mean_average",
                                "fft_Body_Accelerometer_Jerk_Magnitude_std_average","fft_Body_Gryoscope_Magnitude_mean_average","fft_Body_Gryoscope_Magnitude_std_average",
                                "fft_Body_Gryoscope_Jerk_Magnitude_mean_average","fft_Body_Gryoscope_Jerk_Magnitude_std_average")

#Step 7. Write data to txt files as per course requirments

#write.csv(avg_test_train, "./averages_of_variables.csv")  #use this command to output to a .csv file inlcuding the row names
write.table(average_test_train, "./averages_of_variables.txt",row.name=FALSE)
