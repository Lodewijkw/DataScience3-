# DataScience3-
Final assignment for the cleaning data part of data science specialization

Take note that this .R file only works when the working directory is set to the UCI HAR Dataset folder

The script that created the new ... file from the data in this folder is called run_analysis.R. 
This is the only R script required to run.

Not all files are included in this repository since it only is meant to verify my input for the Coursera course.

The run_analysis.R file is fully commented

These are the steps (comments) without actual R commands:


# Step 1 read files
# Read train tables:

# Read test tables:

# Read features:
features <- read.table('features.txt')

# Read activity labels:

# Step 2 Combine data to include column names
# Asign column names to the training data:

# Asign column names to the test data:

# assign column names to activitylabels table

# combine x and y columns for test and train set
# combine train and test rows 

#save all column names, in order to validate them later

#look for columnnames with the words "mean" and "std", plus the activity and subject IDs 

#Create the new vector
#use the labels instead of the numbers to identify the different activities

#Aggregate data by subjectID and Activity id, do this by the method of taking the mean
#Order the new set based on subjectID and afterwards on activityId


#Write the newe data set to a .txt file called CleanSet.txt

