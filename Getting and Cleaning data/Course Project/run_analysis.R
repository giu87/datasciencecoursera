#########################################################################
#				   Course : Getting and Cleaning Data					#
#						Author : Giuliano Vesci							#
#	 					   Date : 22/06/2014							#
#########################################################################

# include data.table and reshape libraries in case they are not installed
if (!require("data.table"))
  install.packages("data.table")

if (!require("reshape2")) 
  install.packages("reshape2")

require("data.table")
require("reshape2")

# read features and activities files
features <- read.table("./data/features.txt")
activities <- read.table("./data/activity_labels.txt")
colnames(activities) <- c("activity", "activityType")

# read test files with read.table function
test_s <- read.table("./data/test/subject_test.txt")
test_y <- read.table("./data/test/y_test.txt")
test_x <- read.table("./data/test/X_test.txt")

# define headers, that will be useful for binding purposes
colnames(test_s) <- "subject"
colnames(test_y) <- "activity"
colnames(test_x) <- features[,2]

# read train files with read.table function
train_s <- read.table("./data/train/subject_train.txt")
train_y <- read.table("./data/train/y_train.txt")
train_x <- read.table("./data/train/X_train.txt")

# define headers, that will be useful for binding purposes
colnames(train_s) <- "subject"
colnames(train_y) <- "activity"
colnames(train_x) <- features[,2]

# merging the subjects and labels with the observations data sets. 
test <- cbind(test_x, test_y, test_s)
train <- cbind(train_x, train_y, train_s)

# merging the two data sets in one, containing the observetions of both
data <- rbind(train, test)

# filtering the "mean" and "std" variables (plus subject and label) and exclude the others
data <- data[grep("mean|std|activity|subject", colnames(data))]

# take activity type name from activities table and replace the id in the data data frame with it
data <- merge(data, activities, by="activity", all.x=T)

# formatting column names
colnames <- colnames(data)
colnames <- gsub('-mean', 'Mean', colnames)
colnames <- gsub('-std', 'Std', colnames)
colnames <- gsub('[()-]', '', colnames)
colnames <- gsub('BodyBody', 'Body', colnames)
colnames(data) <- colnames

# exclude "activity" column since we do not need the id, but the type (i.e. STANDING, ...)
finalData <- data[, colnames(data) != "activity"]

# generate the tidy data set
id_labels <- c("subject", "activityType")
melt_data <- melt(finalData, id = id_labels, measure.vars = setdiff(colnames(finalData),id_labels))
tidy_data <- dcast(melt_data, subject + activityType ~ variable, mean)

# write the tidy data set to a file
write.table(tidy_data, file = "./data/tidy_data.txt")