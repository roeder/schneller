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
them to the corresponding columns of `complete_data`:

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

We concatenate the indices (also including `1` and `2` for `subject_id` and 
`activity_id`) and sort them. Sorting keeps the mean and standard deviation columns 
of one measurement next to each other, which is beneficial for inspecting the
data set.

```r
relevant_columns <- sort(c(1, 2, mean_columns, std_columns))
```

We can then extract the relevant columns.

```r
relevant_data <- complete_data[, relevant_columns]
```


