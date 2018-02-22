library("reshape2")
library("dplyr")
setwd("C:/Users/Philipp/Desktop/Coursera/DSS - Getting and cleaning data/Week4/project_data")

#Loading train data
train_x<-read.table("./train/X_train.txt")
train_y<-read.table("./train/y_train.txt")
train_subject<-read.table("./train/subject_train.txt")

#Loading test data
test_x<-read.table("./test/X_test.txt")
test_y<-read.table("./test/y_test.txt")
test_subject<-read.table("./test/subject_test.txt")


#loading features
features<-read.table("features.txt")

#loading activities
activities<-read.table("activity_labels.txt")

###########################################################################

#1: Merges the training and the test sets to create one data set.
merged_x<-rbind(train_x,test_x)
merged_y<-rbind(train_y,test_y)
merged_subjects<-rbind(subject_train,subject_test)

###########################################################################

#2: Extracts only the measurements on the mean and standard deviation for each measurement.
only_std_mean<-merged_x[,grep("-(mean|std)\\(\\)",features$V2)]

#correcting column names
names(only_std_mean)<-grep("-(mean|std)\\(\\)",features$V2,value=T)

###########################################################################

#3: Uses descriptive activity names to name the activities in the data set
merged_y[,1]<-activities[merged_y[,1],2]
names(merged_y)<-"activities"


###########################################################################

#4: Appropriately labels the data set with descriptive variable names.
only_std_mean<-cbind(merged_y,only_std_mean)

###########################################################################

#5:From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
names(merged_subjects)<-"subject"
act_var_sub<-cbind(only_std_mean,merged_subjects)
melt_act_var_sub<-melt(act_var_sub, id.vars=c("activities","subject"))
mean_data_act_var_sub<-summarise(group_by(melt_act_var_sub,activities,subject,variable),mean=mean(value))
write.table(mean_data_act_var_sub,file="output.txt", sep="\t")