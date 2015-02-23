CodeBook
I have cleaned the raw data set following the steps below:
Step 1:
1.	Read all the features data from ¡°./train/X_train.txt¡± to be a 7532*561 data frame;
2.	Read the subjects and activities data from ¡°./train/subject_train.txt¡± and ¡°./train/y_train.txt¡±;
3.	Merge subject, activities and features into one data frame called ¡°df_train¡±;
4.	Read the complete names of features from ¡°./features.txt¡± and assign them to  ¡°df_train¡±;
5.	Repeat above to the sector of ¡°test¡± and combine data of ¡°train¡± and ¡°test¡± into one data frame called ¡°df_total¡±.
Step 2:
1.	Assign names ¡°subject¡±, ¡°activity¡± to the first two columns of ¡°df_total¡±;
2.	Use function ¡°grep¡± to select columns with names containing ¡°mean¡± and ¡°std¡±;
3.	Extract columns selected from the step above and ¡°subject¡± ¡°activity¡± columns into data frame called ¡°df_extract¡±.
Step 3:
1.	Read the activity names from ¡°./activity_labels.txt¡±;
2.	Merge descriptive activity names into ¡°df_extract:.
Step 4:
       Within step 1, we have already read the features names and assigned to the data frame we are working on.
Step 5: 
1.	Group ¡°df_extract¡± by each subject and each activity into a new data frame called ¡°df_tidy¡± via using function ¡°aggregate¡±;
2.	Write the final tidy data into the working directory.

