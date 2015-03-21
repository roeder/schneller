## 1. Reading in and merging data

We start out by reading in all three training set files in the directory `data/train`.
Column names are provided for the files `y_train.txt` and `subject_train.txt`
via the `col.names` argument:

```r
trn_x <- read.table('data/train/X_train.txt')
trn_y <- read.table('data/train/y_train.txt', col.names = 'activity_id')
trn_sub <- read.table('data/train/subject_train.txt', col.names = 'subject_id')
```

Next up, we merge the three data frames into one. Note the order of the arguments
provided to `cbind()` - the first two columns of `trn_data` will be `subject_id`
and `activity_id`:

```r
trn_data <- cbind(trn_sub, trn_y, trn_x)
``` 

The test set is initiated in the same way:

```r
test_x <- read.table('data/test/X_test.txt')
test_y <- read.table('data/test/y_test.txt', col.names = 'activity_id')
test_sub <- read.table('data/test/subject_test.txt', col.names = 'subject_id')
test_data <- cbind(test_sub, test_y, test_x)
```

There are 7352 records in the training set and 2947 records in the test set. We
combine them into one data frame:

```r
complete_data <- rbind(test_data, trn_data)
```

This data frame contains 10299 records and 563 variables (`subject_id`, 
`activity_id` and 561 measurement variables).

## 2. Extract mean and s.d. measurements

We want to proceed only using the variables containing mean values or standard
deviation values. The dataset includes a file named `features.txt`, which lists
the 561 measurement variable names. We read in those variable names and assign
them to the corresponding column names of `complete_data`:

```r
feature_labels <- read.table('data/features.txt', stringsAsFactors = F)[, 2]
names(complete_data)[3:563] <- feature_labels
```

The provided file `features_info.txt` describes the naming scheme used in our 
data set. We are interested in variables containing the string `mean()` (for mean
values) or the string `std()` (for standard deviations). We use `grep()` to find
the indices of these columns:

```r
mean_columns <- grep('mean()', names(complete_data), fixed = T)
std_columns <- grep('std()', names(complete_data), fixed = T)
```
This identifies 33 variables containing `mean()` and 33 variables containing `std()`.
We concatenate their indices (also including `1` and `2` for `subject_id` and 
`activity_id`) and sort them:

```r
relevant_columns <- sort(c(1, 2, mean_columns, std_columns))
```

Sorting keeps the mean and standard deviation columns 
of one measurement next to each other, which is nice when inspecting the
data set. We can then extract the 68 relevant columns.

```r
relevant_data <- complete_data[, relevant_columns]
```

## 3. Descriptive activity names

The data set includes a file named `activity_labels.txt`. It contains a table 
mapping the six activity IDs to a string describing each activity. We read it 
into R with column names `activity_id` and `activity`:

```r
activity_labels <- read.table('data/activity_labels.txt', stringsAsFactors = F,
                              col.names = c('activity_id', 'activity'))
```

Merging our data set `relevant_data` with this data frame `activity_labels` 
effectively adds a column named `activity` to the data set. The `activity_id` 
column is now redundant, we remove it with `[, -1]`:

```r
relevant_data <- merge(relevant_data, activity_labels)[, -1]
```

## 4. Descriptive variable names

Before aggregating and reporting a tidy data set, we modify the variable (column)
names slightly. First, we delete all `()` substrings from the column names:

```r
names(relevant_data) <- gsub('()', '', names(relevant_data), fixed = T)
```

Furthermore, we replace hyphen characters (`-`) with
underscores (`_`):

```r
names(relevant_data) <- gsub('-', '_', names(relevant_data), fixed = T)
```

This results in reasonably clean variable names without abandoning the original
naming scheme. The variables are described in more detail in the codebook.
## 5. Aggregated tidy data

We calculate the mean value of each variable for each subject and each activity
using the base R function `aggregate()`.

```r
report_data <- aggregate(. ~ subject_id + activity, data = relevant_data, 
                         FUN = mean)
```

This data frame is written to a text file (`'tidy_wide.txt'`):

```r
write.table(report_data, 'tidy_wide.txt', row.names = F)
```

It can be loaded into R using `read.table()` with `header = T`:

```r
d <- read.table('tidy_wide.txt', header = T)
```