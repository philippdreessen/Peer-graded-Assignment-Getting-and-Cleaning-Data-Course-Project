Code description:
1.	Load dataset files:
a.	Train data x, y, and subject
b.	Test data x, y, and subject
c.	Features
d.	Activities
2.	Merging the train and test files with rbind (x,y, and subject)
3.	Identifying the columns that have mean or std values with a regex, and extract the columns from the merged x-file.
4.	Labelling the extracted columns with the correct labels from step 3.
5.	Matching the activities identifier (1-6) from y-data with according names in activities file.
6.	Merging activities names with merged x-data with cbind function.
7.	Labelling the activities column correctly.
8.	Merging the activities/x-data with subject data
9.	Melting the dataframe by activities and subject
10.	Summarizing the data with activities and subjects on the x-axis, and variables on the y-axis.

Variables:
train_x: Data from dataset for train data x
train_y: Data from dataset for train data y
train_subject: Data from dataset for train data subject
test_x: Data from dataset for test data x
test_y: Data from dataset for test data y
test_subject: Data from dataset for test data subject
features: Data from dataset. Variable names.
activities: Activity names.
merged_x: Merged train and test data for x.
merged_y: Merged train and test data for y.
merged_subjects: Merged train and test data for subjects.
only_std_mean: Merged train and test data only for mean or std variables.
act_var_sub: Merged big dataframe combining activities, variables, and subjects
melt_act_var_sub: Rearranged skinny dataframe (act_var_sub)
mean_data_act_var_sub: Dataframe with mean and std values by tabled by activities/subject and variable. 
