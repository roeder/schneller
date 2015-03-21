## Tidy data code book

This document is a code book describing the variables in the provided tidy data 
set `tidy_wide.txt`
([link here](https://github.com/roeder/schneller/blob/master/tidy_wide.txt)).
Variable descriptions for the original data set can be found in the file 
`data/features_info.txt`
([link here](https://github.com/roeder/schneller/blob/master/data/features_info.txt)).

The provided data set is an aggregated and tidy version of the original data set.
It contains mean values of 66 measurements aggregated by test subject and activity.
There were 30 test subjects performing six activities.

### Identifying variables

* `subject`
  * integer
  * encodes the thirty test subjects
  
* `activity`
  * character string
  * describes six activities
    * LAYING
    * SITTING
    * STANDING
    * WALKING
    * WALKING_DOWNSTAIRS
    * WALKING_UPSTAIRS
    
### Measurement variables

All variables contain numeric values representing the aggregated mean for each
test subject and activity.

##### tBodyAcc 

* `tBodyAcc_mean_X`
* `tBodyAcc_mean_Y`
* `tBodyAcc_mean_Z`
* `tBodyAcc_std_X`
* `tBodyAcc_std_Y`
* `tBodyAcc_std_Z`

##### tGravityAcc 

* `tGravityAcc_mean_X`
* `tGravityAcc_mean_Y`
* `tGravityAcc_mean_Z`
* `tGravityAcc_std_X`
* `tGravityAcc_std_Y`
* `tGravityAcc_std_Z`

##### tBodyAccJerk 

* `tBodyAccJerk_mean_X`
* `tBodyAccJerk_mean_Y`
* `tBodyAccJerk_mean_Z`
* `tBodyAccJerk_std_X`
* `tBodyAccJerk_std_Y`
* `tBodyAccJerk_std_Z`

##### tBodyGyro 

* `tBodyGyro_mean_X`
* `tBodyGyro_mean_Y`
* `tBodyGyro_mean_Z`
* `tBodyGyro_std_X`
* `tBodyGyro_std_Y`
* `tBodyGyro_std_Z`

##### tBodyGyroJerk 

* `tBodyGyroJerk_mean_X`
* `tBodyGyroJerk_mean_Y`
* `tBodyGyroJerk_mean_Z`
* `tBodyGyroJerk_std_X`
* `tBodyGyroJerk_std_Y`
* `tBodyGyroJerk_std_Z`

##### tBodyAccMag 

* `tBodyAccMag_mean`
* `tBodyAccMag_std`

##### tGravityAccMag 

* `tGravityAccMag_mean`
* `tGravityAccMag_std`

##### tBodyAccJerkMag 

* `tBodyAccJerkMag_mean`
* `tBodyAccJerkMag_std`

##### tBodyGyroMag 

* `tBodyGyroMag_mean`
* `tBodyGyroMag_std`

##### tBodyGyroJerkMag 

* `tBodyGyroJerkMag_mean`
* `tBodyGyroJerkMag_std`

##### fBodyAcc 

* `fBodyAcc_mean_X`
* `fBodyAcc_mean_Y`
* `fBodyAcc_mean_Z`
* `fBodyAcc_std_X`
* `fBodyAcc_std_Y`
* `fBodyAcc_std_Z`

##### fBodyAccJerk 

* `fBodyAccJerk_mean_X`
* `fBodyAccJerk_mean_Y`
* `fBodyAccJerk_mean_Z`
* `fBodyAccJerk_std_X`
* `fBodyAccJerk_std_Y`
* `fBodyAccJerk_std_Z`

##### fBodyGyro 

* `fBodyGyro_mean_X`
* `fBodyGyro_mean_Y`
* `fBodyGyro_mean_Z`
* `fBodyGyro_std_X`
* `fBodyGyro_std_Y`
* `fBodyGyro_std_Z`

##### fBodyAccMag 

* `fBodyAccMag_mean`
* `fBodyAccMag_std`

##### fBodyBodyAccJerkMag 

* `fBodyBodyAccJerkMag_mean`
* `fBodyBodyAccJerkMag_std`

##### fBodyBodyGyroMag 

* `fBodyBodyGyroMag_mean`
* `fBodyBodyGyroMag_std`

##### fBodyBodyGyroJerkMag 

* `fBodyBodyGyroJerkMag_mean`
* `fBodyBodyGyroJerkMag_std`
