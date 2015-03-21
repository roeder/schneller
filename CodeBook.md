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
    
### Measurements
