## Preliminary dataset

The preliminary dataset "dat_merged" is the union of the training and test datasets. For each record, it includes:

1. A subject ID.
2. An activity label. 
3. A feature vector on the mean and standard deviation for each measurement.


## Final dataset

The final dataset "dat" was derived from the preliminary dataset. Group_by() function in the dplyr package was used for the derivation. For each record, it includes:

1. A subject ID.
2. An activity label. 
3. The average of each variable for each subject and activity.
