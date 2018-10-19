suppressWarnings(library(dplyr)) 

##############################################################################
# STEP 1 - Download & Store data
##############################################################################

if (!dir.exists("./JHU_R_dataset")) {
        dir.create("./JHU_R_dataset")        
} 
setwd("./JHU_R_dataset")

zipfileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipfilename <- "UCI HAR Dataset.zip"

if (!file.exists(zipfilename)){
        download.file(zipfileURL,zipfilename,mode = "wb")
} else{
        file.remove(zipfilename)
        download.file(zipfileURL,zipfilename,mode = "wb")
}

unzFolder <- "UCI HAR Dataset"

if (!dir.exists(unzFolder)){
        unzip(zipfilename)
} else{
        unzip(zipfilename,overwrite = TRUE)
}

##############################################################################
# STEP 2 - Read & Stage data in R Memory
##############################################################################

training_sub <- read.table(file.path(unzFolder, "train", "subject_train.txt"))
training_val_X <- read.table(file.path(unzFolder, "train", "X_train.txt"))
training_act_Y <- read.table(file.path(unzFolder, "train", "y_train.txt"))

test_sub <- read.table(file.path(unzFolder, "test", "subject_test.txt"))
test_val_X <- read.table(file.path(unzFolder, "test", "X_test.txt"))
test_act_Y <- read.table(file.path(unzFolder, "test", "y_test.txt"))

features <- read.table(file.path(unzFolder,"features.txt"),stringsAsFactors = FALSE)


##############################################################################
# STEP 3 - Data Merging
##############################################################################

merged_Data <- rbind(cbind(training_sub,training_act_Y,training_val_X),cbind(test_sub,test_act_Y,test_val_X))
colnames(merged_Data) <- c("Subject ID","Activity ID",features[,2])

##############################################################################
# STEP 4 - Data Filtering
##############################################################################

# filtered_ColName <- grep("Subject|Activity|[mM]ean|[sS]td",colnames(merged_Data))
# Above expression is not required as unnecessary 6 columns will be added due to 'Mean' word in the formula used for angle calculation

filtered_ColName <- grep("Subject|Activity|mean|std",colnames(merged_Data))

# Merged data filtered with required columns only

merged_Data_F <- merged_Data[,filtered_ColName]

######################################################################################
# STEP 5 - Assigning descriptive activity names to name the activities in the data set
######################################################################################

activitiy <- read.table(file.path(unzFolder, "activity_labels.txt"), col.names = c("ActivityId", "ActivityLabel"))

merged_Data_F$`Activity ID` <- factor(merged_Data_F$`Activity ID`,activitiy[,1],activitiy[,2])

######################################################################################
# STEP 6 - Appropriately labelling the data set with descriptive variable names
######################################################################################

merged_Data_F_ColName <- colnames(merged_Data_F)

# Column name cleaning for special characters (,),-
merged_Data_F_ColName <- gsub("[-\\(\\)]","",merged_Data_F_ColName)

# Expanding column name

merged_Data_F_ColName <- gsub("^f", "frequencyDomain", merged_Data_F_ColName)
merged_Data_F_ColName <- gsub("^t", "timeDomain", merged_Data_F_ColName)
merged_Data_F_ColName <- gsub("Acc", "Accelerometer", merged_Data_F_ColName)
merged_Data_F_ColName <- gsub("Gyro", "Gyroscope", merged_Data_F_ColName)
merged_Data_F_ColName <- gsub("Mag", "Magnitude", merged_Data_F_ColName)
merged_Data_F_ColName <- gsub("Freq", "Frequency", merged_Data_F_ColName)
merged_Data_F_ColName <- gsub("mean", "Mean", merged_Data_F_ColName)
merged_Data_F_ColName <- gsub("std", "StandardDeviation", merged_Data_F_ColName)

# Assign expanded column name to Merged Data

colnames(merged_Data_F) <- merged_Data_F_ColName


######################################################################################
# STEP 7 - Following steps creates a second independent tidy data set, from above 
# data set, with the average of each variable for each activity and each subject.
######################################################################################

Second_Tidy_Data <- aggregate(. ~`Subject ID`+`Activity ID`, merged_Data_F, mean)

######################################################################################
# STEP 8 - Create a file from above second tidy data set.
######################################################################################

write.table(Second_Tidy_Data, "2nd_tidy_data.txt", row.names = FALSE,quote = FALSE)




