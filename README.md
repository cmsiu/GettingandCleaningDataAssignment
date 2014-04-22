README
=========

This readme file explains how all of the scripts work and how they are connected.  

Files
----


* run_analysis.R - R script to generate tidy dataset
* README.md - explain usage of all files
* CodeBook.md - describes the variables, the data, and any transformations or clean up work

Pre-requisite
-----------

Things to be done before executing run_analysis.R

* Download and unzip data file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Open R and set current directory under unzipped folder, i.e. "UCI HAR Dataset"

Execution and output
--------------
Execute the R script by source("run_analysis.R"), it outputs tidy.txt file under the current folder.