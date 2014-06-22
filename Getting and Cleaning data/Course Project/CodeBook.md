## Getting and Cleaning Data

### Raw data set

The raw data set contains two sets of data: ```train``` and ```test```. The data included in the zip downloaded has the following structure:

- test
  |__ subject_test.txt
  |__ X_test.txt
  |__ y_test.txt
  |__ Inertial Signals - IGNORED 
- train
  |__ subject_test.txt
  |__ X_test.txt
  |__ y_test.txt
  |__ Inertial Signals - IGNORED 
- activity_labels.txt
- features.txt
- features_info.txt
- README.txt

### Tidy data set

In order to process the raw data set, we need to run several transformations. In the following, I try to point out the major functions used for achieve the final goal.


0. We include the needed dependencies and read the input files using ```require``` and ```read.table``` functions

1. Merges the training and the test sets to create one data set. 
This is done using the functions ```cbind``` (to merge x_test, y_test and subject_test for both train and test data sets) and the ```rbind``` to merge the two data sets together.
The result data will have 10299 rows and 561 columns.

2. Extracts only the measurements on the mean and standard deviation for each measurement. 
This is done by using the ```grep``` function extracting every variable containing "mean" OR "std". The result data frame will contain 10299 rows but only 81 columns (79 containing "mean" or "std" plus the "activity" and "subject" columns, needed later.
It was not clear whether to cut off the "meanFreq()" variable. I have decided to leave it there in case it would be useful.

3. Uses descriptive activity names to name the activities in the data set
It was easy to define the columns names with the function ```colnames```.

4. Appropriately labels the data set with descriptive activity names.
This step was achieved by using the ```gsub``` function. In particular the following transformation were included:
* "-mean" --> "Mean"
* "-std" --> "Std"
* "()"- --> "" (EMPTY_STRING)
* "BodyBody" --> "Body"
For example the variable "fBodyBodyGyroJerkMag-meanFreq()" becomes "fBodyGyroMagMeanFreq"

5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
A combination of the ```melt``` and the ```dcast``` function permits to calculate the mean for every activity/subject couple. 
