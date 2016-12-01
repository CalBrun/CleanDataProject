## Download File
URL<- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(URL, destfile = "HARzip")
unzip("HARzip")
directory<- getwd()
setwd("UCI HAR Dataset")

## Get Training Data
setwd("train")
tempdata1 <- read.table("x_train.txt")
tempdata2 <- read.table("y_train.txt")
tempdata3 <- read.table("subject_train.txt")
datatrain<- cbind(tempdata3, tempdata2, tempdata1)
setwd("..")

## Get Testing Data
setwd("test")
tempdata1 <- read.table("x_test.txt")
tempdata2 <- read.table("y_test.txt")
tempdata3 <- read.table("subject_test.txt")
datatest<- cbind(tempdata3, tempdata2, tempdata1)
setwd("..")

## Combine Training and Testing Data
datafile<- rbind(datatrain, datatest)

## Label the data set with descriptive variable names
features<- read.table("features.txt")
rowcount<-nrow(features)
featurelist<- c("subject", "activity",as.character(features[1:rowcount,2]))
colnames(datafile)<- featurelist

## Extract only the measurements on the mean and standard deviation
meanstd<- grepl("mean|std",features[,2])
meanstd<-as.logical(c("TRUE", "TRUE", meanstd))
datafile<- subset(datafile,select= meanstd)

## Add Activity names
activities<- read.table("activity_labels.txt")
rowcount<- nrow(datafile)
for(row in 1:rowcount){
        x<- datafile[row,2]
        datafile[row,2]<- as.character(activities[x,2])}

## Create a tidy data set with the average of each variable for each activity and each subject
colcount<- ncol(datafile)
tidyfile<- aggregate (datafile[3:colcount], by = list(subject = datafile$subject, activity = datafile$activity),FUN = mean)

## Write Tidy File to starting directory
setwd("..")
write.table(tidyfile, file= "tidyfile.txt", row.names = FALSE)

 

