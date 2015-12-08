#Getting and Cleaning Data Course Project Read Me File

=======================================================================================================================

##Process Overview 

Here are the steps I used to complete the project:

 1. Install  "downloader" package from CRAN
 2. Download course project and extract the data to local file folders
 3. Review the read me to determine where to find field names
 4. Obtain basis for field names from "features_info.txt"
 5. Obtain columns numbers with means and standard deviations from the "features.txt" file 
 6. Use word to create descriptive variable names with it's powerful change and replace capabilities 
 7. Read the test and training data into data.frames
 8. Subset columns the data to leave only the means and standard deviations of each measurement 
 9. Merger the training and test data using the rbind() command
 10. Add column names in the data frame to be descriptive
 11. Create  a second, independent tidy data set with the average of each variable for each activity and each subject
 12. Write the second data set to a file as output using "," to seperate the data  

=======================================================================================================================

There are five files in the repository:

 + README.MD  : Desription of the process used to get and clean data, process it and produce output  
 + README.HTML : HTML version of markdown document   
 + CodeBook.MD : Descrition of files, data sets and variables in the data sets and output file
 + run_analysis.R : R script used to perform the analysis
 + averages_of_variables.txt : text file containing the mean of each of the mean and standard deviation variables in the test and train data sets 

=======================================================================================================================
 
