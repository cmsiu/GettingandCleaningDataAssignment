library(plyr)

##retrieve features.txt for getting required data column information
featuresFile <- read.table("features.txt")

##extract std() or mean() columns
extractCol <- sapply(featuresFile[,2], function(x) { if(grepl("std|mean[^Freq]", x)) "numeric" else "NULL"})
featureColName <- grep("std|mean[^Freq]", featuresFile[,2],value=TRUE)

##load activity labels
label <- read.table("activity_labels.txt", col.names=c("activity_id", "activity_name"))

##load test activities, dataset
teda <- read.table("test/y_test.txt", col.names="activity_id")
te_activity_name <- join(teda,label,by="activity_id",type="inner")[,"activity_name"]

##load test subject, dataset
teds <- read.table("test/subject_test.txt", col.names="subject_id")
tedd <- read.table("test/X_test.txt", colClasses=extractCol)
colnames(tedd) <- featureColName
testds <- cbind(teds,te_activity_name,tedd)

##load train activities, dataset
trda <- read.table("train/y_train.txt", col.names="activity_id")
tr_activity_name <- join(trda,label,by="activity_id",type="inner")[,"activity_name"]

##load train subject, dataset
trds <- read.table("train/subject_train.txt", col.names="subject_id")
trdd <- read.table("train/X_train.txt", colClasses=extractCol)
colnames(trdd) <- featureColName
trainds <- cbind(trds,tr_activity_name,trdd)

##combine test and train dataset
colnames(testds)[2] <- "activity_name"
colnames(trainds)[2] <- "activity_name"
ds <- rbind(testds,trainds)

##reshape dataframe to be a tidy dataset
molten = melt(ds, id=c("subject_id", "activity_name"), na.rm = TRUE)
tidyds <- dcast(molten, subject_id + activity_name ~ variable,mean)

##output tidyds
write.csv(tidyds, file = "tidy.csv", row.names=FALSE)