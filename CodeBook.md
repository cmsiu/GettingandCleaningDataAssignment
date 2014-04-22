CODEBOOK
=========

This codebook file describes the variables, the data, and any transformations or clean up work in run_analysis.R

Input Parameter
----
No input parameters is required in order to run the run_analysis.R

Program rundown and transformation
----
* Form required columns using features.txt file by applying regular expression to get the column names which contain std() or mean()
* Load and combine subject id, activity name and test dataset into testds
* Load and combine subject id, activity name and train dataset into trainds
* Combine testds and trainds using rbind
* Reshape the data using melt and dcast functions, in order to output mean values of each std() and mean() measurements by subject id and activity name
* tidy dataset (tidy.csv) will be generated under current folder

Variables
-----------

* featuresFile - retrieve features.txt for getting required data column information
* extractCol - form extracting column list where columns contain std() or mean() in featuresFile
* featureColName - extract column names from featuresFile
* label - store activity label from activity_labels.txt
* teda - store test subject_id from test/y_test.txt
* te_activity_name - store test activity name by joining teda 
* teds - store test subject id from test/subject_test.txt
* tedd - store test data set from test/X_test.txt
* testds - store combined dataset with teds, te_activity_name and tedd
* trda - store train subject_id from train/y_train.txt
* tr_activity_name - store train activity name by joining trda
* trds - store train subject id from train/subject_train.txt
* trdd - store train data set from train/X_train.txt
* trainds - store combined dataset with trds, tr_activity_name and trdd
* ds - store combine data set with testds and trainds
* molten - store reshaped data set using melt function by subject_id and activity_name
* tidyds - generate tidy dataset with mean values of each std() and mean() measurements by subject_id and activity_name