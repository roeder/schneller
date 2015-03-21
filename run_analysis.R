# Load training and test data
trn_x <- read.table('data/train/X_train.txt')
trn_y <- read.table('data/train/y_train.txt', col.names = 'activity_id')
trn_sub <- read.table('data/train/subject_train.txt', col.names = 'subject_id')

test_x <- read.table('data/test/X_test.txt')
test_y <- read.table('data/test/y_test.txt', col.names = 'activity_id')
test_sub <- read.table('data/test/subject_test.txt', col.names = 'subject_id')

# Merge subject id, activity id and feature measurements for both data sets
trn_data <- cbind(trn_sub, trn_y, trn_x)
test_data <- cbind(test_sub, test_y, test_x)

# Merge training and test data into one data frame
complete_data <- rbind(test_data, trn_data)

# Read in feature labels and rename columns accordingly
feature_labels <- read.table('data/features.txt', stringsAsFactors = F)[, 2]
names(complete_data)[3:563] <- feature_labels

# Find column names containing mean() and std()
mean_columns <- grep('mean()', names(complete_data), fixed = T)
std_columns <- grep('std()', names(complete_data), fixed = T)
relevant_columns <- sort(c(1, 2, mean_columns, std_columns))

# Keep only the relevant columns
relevant_data <- complete_data[, relevant_columns]

# Read in activity labels and add them to the data frame
activity_labels <- read.table('data/activity_labels.txt', stringsAsFactors = F,
                              col.names = c('activity_id', 'activity'))
relevant_data <- merge(relevant_data, activity_labels)[, -1]

# Variable names
names(relevant_data) <- gsub('()', '', names(relevant_data), fixed = T)
names(relevant_data) <- gsub('-', '_', names(relevant_data), fixed = T)

# Aggregate by activity and subject
report_data <- aggregate(. ~ subject_id + activity, data = relevant_data, 
                         FUN = mean)

write.table(report_data, 'tidy_wide.txt', row.names = F)
