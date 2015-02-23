
setwd("/Users/PullingCarrot/Documents/StudyR/hw/UCI HAR Dataset")
X_train<-read.table("./train/X_train.txt")
train_subject<-read.table("./train/subject_train.txt")
train_activity<-read.table("./train/y_train.txt")

df_train = data.frame(train_subject,train_activity,X_train)

X_test<-read.table("./test/X_test.txt")
test_subject<-read.table("./test/subject_test.txt")
test_activity<-read.table("./test/y_test.txt")

df_test = data.frame(test_subject,test_activity,X_test)


#step 1 merge train and test
df_total=rbind(df_train,df_test)

feature_names <- read.table('./features.txt')

#step 4 descriptive names
names(df_total)=c("subject","activity",as.character(feature_names$V2))

	columns=names(df_total)

	mean_index=grep("mean()",columns,fixed=TRUE)
	std_index=grep("std()",columns)

	names_extract = sort(c(mean_index,std_index))

#step 2 extract
df_extract = df_total[columns[c(1,2,names_extract)]]


#step 3 activity names
activity_names <- read.table('./activity_labels.txt')
names(activity_names)=c("activity","activity_name")
df_extract=merge(x = df_extract, y = activity_names, by = "activity", all.x=TRUE)

#step 5 Group by
df_tidy=aggregate( df_extract[columns[c(names_extract)]], by=df_extract[c('subject','activity','activity_name')], FUN=mean)

write.table(df_tidy,"tidy.txt",row.names=FALSE)







