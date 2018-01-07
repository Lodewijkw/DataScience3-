
# Step 1 read files
# Read train tables:
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

# Read test tables:
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

# Read features:
features <- read.table('features.txt')

# Read activity labels:
activitylabels = read.table('activity_labels.txt')

# Step 2 Combine data to include column names
# Asign column names to the training data:
colnames(x_train) <- features[,2] 
colnames(y_train) <-"activityId"
colnames(subject_train) <- "subjectId"

# Asign column names to the test data:
colnames(x_test) <- features[,2] 
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"

# assign column names to activitylabels table
colnames(activitylabels) <- c('activityId','activityType')

# combine x and y columns for test and train set
xy_train <- cbind(y_train, subject_train, x_train)
xy_test <- cbind(y_test, subject_test, x_test)
# combine train and test rows 
completedata <- rbind(xy_train, xy_test)

#save all column names, in order to validate them later
ColumnNames <- colnames(completedata)

#look for columnnames with the words "mean" and "std", plus the activity and subject IDs 
mean_and_std <- (grepl("activityId" , ColumnNames) |grepl("subjectId" , ColumnNames) | grepl("mean.." , ColumnNames) | grepl("std.." , ColumnNames) 
)

#Create the new vector
setMeanAndStd <- completedata[ , mean_and_std == TRUE]

#use the labels instead of the numbers to identify the different activities
setWithActivityNames <- merge(setMeanAndStd, activitylabels, by='activityId', all.x=TRUE)

#Aggregate data by subjectID and Activity id, do this by the method of taking the mean
CleanSet <- aggregate(. ~subjectId + activityId, setWithActivityNames, mean)
#Order the new set based on subjectID and afterwards on activityId
CleanSet <- CleanSet[order(CleanSet$subjectId, CleanSet$activityId),]

#Write the newe data set to a .txt file called CleanSet.txt
write.table(CleanSet, "CleanSet.txt", row.name=FALSE)

