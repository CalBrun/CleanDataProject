<b>CODE BOOK FOR TIDY DATA PROJECT TO CREATE SCRIPT “run_analysis.R”  </b> 

Variables

tempdata1 – used to temporarily store “x” data
tempdata2 – used to temporarily store “y” data
tempdata3 – used to temporarily store “subject” data

datatrain – used to combine “x”, “y” and “subject data from the Training data in a single table
datatest - used to combine “x”, “y” and “subject data from the Test data in a single table

features – used to store the features for the data set
rowcount – used to store the number of rows
featurelist – list of descriptions for data elements in the table

meanstd – contains a vector indicating if column names contain either “mean” or “std”
datafile – the datafile that contains the subject, activity and “mean” or “std” columns

activities – activity labels
row – used as an incremented variable 
x – used to temporarily store the number associated with an activity

colcount – used to store number of columns
tidyfile – used to store the tidy data
 

Data

Data for this project was obtained from:
 https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The zip file contains a “README.txt” file that describes the data in detail.


Transformations and Work Performed by Script to Clean Data

The script takes the combines the X, Y and Subject data for each of the two databases, “train” and “test” into a single database for each.  These two databases are then combined using rbind, into a single datafile.

The column names of the data files are modified to reflect that the first two columns are subject, and activity.  The name of each of the data elements are then added from the “feature.txt” file.

A datafile is created by subsettung only the columns having features incorporating either “mean” or “std” within their names, representing means and standard deviations.

Activities from the activity_labels.txt file are then added to each of the rows in the second column of the file, by replacing the corresponding activity number in the column with the activity label.

The final stage of cleaning the data is to obtain the average of each variable, based on subject, and activities.
