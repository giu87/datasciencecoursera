if (!require("data.table"))
  install.packages("data.table")

if (!require("reshape2")) 
  install.packages("reshape2")

require("data.table")
require("reshape2")

features <- read.table("./data/features.txt")
activities <- read.table("./data/activity_labels.txt")

colnames(activities) <- c("activity", "activityType")

##READ FILES
test_s <- read.table("./data/test/subject_test.txt")
test_y <- read.table("./data/test/y_test.txt")
test_x <- read.table("./data/test/X_test.txt")

colnames(test_s) <- "subject"
colnames(test_y) <- "activity"
colnames(test_x) <- features[,2]

train_s <- read.table("./data/train/subject_train.txt")
train_y <- read.table("./data/train/y_train.txt")
train_x <- read.table("./data/train/X_train.txt")

colnames(train_s) <- "subject"
colnames(train_y) <- "activity"
colnames(train_x) <- features[,2]

##INCLUDE ACTIVITIES INFO AND SUBJECT TO DATASETS
test <- cbind(test_x, test_y, test_s)
train <- cbind(train_x, train_y, train_s)

##MERGING OF THE TWO DATASETS
data <- rbind(train, test)

##FILTER VARIABLES AND GET NAMES
data <- data[grep("mean|std|activity|subject", colnames(data))]

# take activity type name from activities table and replace the id in the data data frame with it
data <- merge(data, activities, by="activity", all.x=T)

## formatting column names
colnames <- colnames(data)
colnames <- gsub('-mean', 'Mean', colnames)
colnames <- gsub('-std', 'Std', colnames)
colnames <- gsub('[()-]', '', colnames)
colnames <- gsub('BodyBody', 'Body', colnames)
colnames(data) <- colnames

finalData <- data[, colnames(data) != "activity"]

id_labels <- c("subject", "activityType")
melt_data <- melt(finalData, id = id_labels, measure.vars = setdiff(colnames(finalData),id_labels))
tidy_data <- dcast(melt_data, subject + activityType ~ variable, mean)

write.table(tidy_data, file = "./data/tidy_data.txt")