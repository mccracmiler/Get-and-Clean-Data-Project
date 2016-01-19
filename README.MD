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
 7. Read the test, training and subject data into data.frames
 8. Add column names to the subject and activity data frames
 9. Subset columns of the test data set to leave only the means and standard deviations of each measurement 
 10. Add column names to the test data frame
 11. Merge the test data with the subject and activity data using the cbind() command
 12. Subset columns of the train data set to leave only the means and standard deviations of each measurement 
 13. Add column names to the train data frame
 14. Merge the train data with subject and activity data using the cbind() command
 15. Merge the test and train data frames using the rbind() command
 16. Replace the activity number with an activity name using the mutate dplyr command
 17. Summarize the merged data by subject and activity calculating means for each column and put in a summarized date set  
 18. Add descriptive column names to the summarized data frame
 19. Write the summarized data set to a file as output the data  

======================================,=================================================================================

There are four files in the repository:

 + README.MD  : Desription of the process used to get and clean data, process it and produce output  
 + CodeBook.MD : Descrition of files, data sets and variables in the data sets and output file
 + run_analysis.R : R script used to perform the analysis
 + averages_of_variables.txt : text file containing the mean of each of the mean and standard deviation variables in the test and train data sets 

=======================================================================================================================
 