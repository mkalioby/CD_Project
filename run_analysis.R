library("plyr")

# Generate the header from the features file
test_header=read.table('features.txt')
test_header<-t(test_header)
header<-test_header[2,]

#Load Activites
activities<-read.table('activity_labels.txt')
activities<-activities$V2

#Load Test set and add header to it
print("Going to read test file")
test_set<-read.table('test/X_test.txt' )
print("Test file is read")
names(test_set)<-header
print("Filtering columns of test set")
#Filter Unwanted columns out.
for (col in names(test_set))
{
        if (!((grepl('mean()',col) & !grepl('meanFreq()',col)) | grepl("std()",col)))
        {
                test_set[[col]]<-NULL
        }
}


#Add Activites to test_set
print("Adding Activies to the test dataset")
test_labels<-read.table('test/y_test.txt')
test_set<-cbind(test_labels,test_set)
names(test_set)[1]<-"Activity"
print("Adding Activities done")

#Add Subject name to test_set
print ("Adding Subjects to the test dataset")
test_sub_names<-read.table('test/subject_test.txt')
test_set<-cbind(test_sub_names,test_set)
names(test_set)[1]<-"Subject"
print("Adding subjects done")

final_header=vector()
#Load Train set and add header to it
print ("Going to read Train File")
train_set<-read.table('train/X_train.txt')
print("Train file is read")
names(train_set)<-header
print("Filtering columns of train set")
i<-1
for (col in names(train_set))
{
        if (!((grepl('mean()',col) & !grepl('meanFreq()',col)) | grepl("std()",col)))
        {
                train_set[[col]]<-NULL
                
        }
        else   #This is a wanted header
        {
                final_header[i]<-col
                i<-i+1
        }
}

#Add Activites to test_set
print("Adding Activies to the test dataset")
train_labels<-read.table('train/y_train.txt')
train_set<-cbind(train_labels,train_set)
names(train_set)[1]<-"Activity"
print("Adding Activities done")

#Add Subject name to test_set
print ("Adding Subjects to the train dataset")
train_sub_names<-read.table('train/subject_train.txt')
train_set<-cbind(train_sub_names,train_set)
names(train_set)[1]<-"Subject"
print("Adding subjects done")

#Merge both sets as full sets
print("Merging sets")
full_Set<-rbind(train_set,test_set)

#Create Group Based on Subject and Activity
full_Set<-transform(full_Set,Group=paste(Subject,Activity,sep='_'))

#Calculate the mean for each group
activity_means<-ddply(full_Set,~Group,colwise(mean,is.numeric))

#Replace activity numbers by names
activity_means<-transform(activity_means, Activity=activities[Activity])
#Remove Group Column
activity_means$Group<-NULL
#Add Final Header
names(activity_means)<-c("Subject","Activity",final_header)
#Write file
write.table(activity_means,'tidyset.txt',row.names=FALSE)
