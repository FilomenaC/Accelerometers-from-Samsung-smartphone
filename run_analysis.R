# R script created by Filomena Ciccarelli as part of the Getting and Cleaning (Coursera) course data project. 
# The run_analysis.R script executes the end-to-end tidy data analysis on the Human Activity Recognition Using Smartphones Data Set.
# For more information see README.md and CodeBook.md files


# Step 1 
# 1.1.Read the data with read.table()

x_test<-read.table("test/X_test.txt")
y_test<-read.table("test/y_test.txt")
x_train<-read.table("train/X_train.txt")
y_train<-read.table("train/y_train.txt")
features<-read.table("features.txt")
labels<-read.table("activity_labels.txt")
subject_test<-read.table("test/subject_test.txt")
subject_train<-read.table("train/subject_train.txt")


# Step 2
# 2.1 Extract variable names from features (as vector) and create more descriptive variable names with gsub()
# 2.2 Create more descriptive variable names for labels

features<-t(features[2])
features<-gsub("-","",features)
features<-gsub(",","",features)
features<-gsub("\\(","",features)
features<-gsub("\\)","",features)
features<-gsub("^t","time",features)
features<-gsub("^f","freq",features)
features<-tolower(features)

labels<-t(labels[2])
labels<-as.character(labels)
labels<-sub("_","",labels)
labels<-tolower(labels)


# Step 3 
# 3.1 Label observations columns with features column names
# 3.2 Map activity labels on y_test and y_train values and create more descriptive variable names
# 3.3 Rename both subject_test and subject_train column with a more descriptive variable name

names(x_test)<-features
names(x_train)<-features

y_test<-as.data.frame(factor(y_test$V1,levels=c(1,2,3,4,5,6),labels))
y_train<-as.data.frame(factor(y_train$V1,levels=c(1,2,3,4,5,6),labels))
names(y_test)<-"activity"
names(y_train)<-"activity"

names(subject_test)<-"subject"
names(subject_train)<-"subject"


# Step 4
# 4.1 Merge test and train data sets
# 4.2 Create the merged data frame with rbind() - dim(merged_df): 10299 x 563

test_df<-as.data.frame(c(subject_test,y_test,x_test))
train_df<-as.data.frame(c(subject_train,y_train,x_train))

merged_df<-rbind(test_df,train_df)
 

# Step 5
# 5.1 Load dplyr package. Filter merged data to extract only variable names containing mean or std
# 5.2 Subset on logical created filter to get the relevant observation data.
# 5.3 Add subject and activity columns as needed for group_by

library(dplyr)
mean_std_filter<-grep("mean|std",names(merged_df)) 

filtered_df<-subset(merged_df,select=mean_std_filter)

final_df<-cbind(subject=merged_df$subject,activity=merged_df$activity,filtered_df)


# Step 6
# 6.1 Group_by subject and activity columns
# 6.1 Average of each variable as per project requirement - dim(output_tidy_data): 180x88

grouped_data<-group_by(final_df,subject,activity)

output_tidy_data<- summarize_each(grouped_data,funs(mean))
 

# Step 7
# Export the final tidy data frame

write.table(output_tidy_data,file="output_tidy_data.txt",sep="\t",row.names= FALSE)
