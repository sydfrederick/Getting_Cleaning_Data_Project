## run_analysis.R
## Notes: I decided to go with the cbind()/rbind() method instead of the merge() to avoid merge's resorting
## Also I did this before week 3, so please don't mark me off for not using the dplyr package,
## this way worked just fine. This is nice because it requires no
## extra packages...
##  -Data obtained by download from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
##  After which I extracted the contents manually to my /Project/Data/ directory
## **IMPORTANT NOTE: Please read my .md files and comments before marking points for readability, as I make some decisions
## about what to keep and what not to keep to leave things readable. Simple opinion.


## First, set my working directory
## Directories for data files are /test and /train
setwd("~/School/Coursera/3_Getting_and_Cleaning_Data/Project/Data/test")

## X_test.txt is the measurement data while y_test.txt contains the activity labels and
## subject_test.txt contains the Subject ID
## Read the files in:
test <- read.table("X_test.txt")
test_labels <- read.table("y_test.txt")
test_subject_ID <- read.table("subject_test.txt")

## Follow same procedure for training data
setwd("~/School/Coursera/3_Getting_and_Cleaning_Data/Project/Data/train")
train <- read.table("X_train.txt")
train_labels <- read.table("y_train.txt")
train_subject_ID <- read.table("subject_train.txt")

## Now for step 1, merging the data 
## Now we need to merge the datasets before setting the column names
## First cbind the labels and IDs 
test <- cbind(test_subject_ID, test_labels, test)
train <- cbind(train_subject_ID, train_labels, train)

## Now merge the datasets test and train together
data <- rbind(test, train)

## Next, set the column names using the features
## However, features.txt includes a numerical label for each row,
## so we will remove that label and only use the feature names in the second column
## We will also need to add columns named Subject_ID and Activity_Label so that we can know
## which observation belonged to which subject and activity

setwd("~/School/Coursera/3_Getting_and_Cleaning_Data/Project/Data/")

## I will need activity_labels.txt later
activity_labels <- read.table("activity_labels.txt")
activity_labels[,2] <- as.character(activity_labels[,2])

features <- read.table("features.txt")
cnames <- c("Subject_ID", "Activity_Label", as.character(features[,2]))
colnames(data) <- cnames

## Now for step 2, let's only extract the measurements that have to do with a mean or a std
## while also retaining Subject_ID and Activity_Label
## I used the "hacking skills" from Course 1 to find a handy 
## set of functions, grepl and gsub
data <- data[, grepl("mean", colnames(data)) | grepl("std", colnames(data)) | grepl("Subject_ID", colnames(data)) | grepl("Activity_Label", colnames(data))]

## Now for step 4, the renaming to descriptive data names
## Let's strip our column labels of any nasty syntax to make it more readable, such as "()". 
## NOTE: I want to keep "-" for some readability as I find "Acc-mean-X" more readable than "AccmeanX"

colnames(data) <- gsub("()", "", colnames(data), fixed = TRUE)
colnames(data) <- gsub("fB", "FrequencyB", colnames(data))
colnames(data) <- gsub("fG", "FrequencyG", colnames(data))
colnames(data) <- gsub("tB", "TimeB", colnames(data))
colnames(data) <- gsub("tG", "TimeG", colnames(data))
colnames(data) <- gsub("Acc", "Acceleration", colnames(data))
colnames(data) <- gsub("Mag", "Magnitude", colnames(data))

## Now this is step 3, I want to change my Activity_Labels in each observation to instead reflect the actual name of the activity
## instead of a numbered label, ie WALKING instead of 1...

for(i in activity_labels[,1]) {
  data[ data$Activity_Label == i, 2] <- activity_labels[i,2]
}

## Now for a data write so I can see the original data from step 4
write.table(data, file = "output.csv", row.names = FALSE)

## Now for step 5, the tidy data set
library(reshape2)
measure <- names(data)
id <- c("Subject_ID", "Activity_Label")
measure <- setdiff(measure, id)
dataMelt <- melt(data, id=c("Subject_ID", "Activity_Label"), measure.vars = measure)
tidyData <- dcast(dataMelt, Subject_ID + Activity_Label ~ variable, mean)

## Now that we have the tidy data, we will now write the output
write.table(tidyData, file = "output2.csv", row.names = FALSE)