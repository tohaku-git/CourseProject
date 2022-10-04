## Meta datasets

The meta data includes:

1. Activity labels.
2. Feature names.


## Raw datasets

The raw datasets consist of the follows:

1. The text files "subject_train" and "subject_test" for subject IDs. 
2. The text files "y_train" and "y_test" for activity code values. 
3. The text files "X_train" and "X_test" for feature values.


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
