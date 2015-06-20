## **Files Included**
> 1.  Codebook.md
> 2.  README.md
> 3.  run_analysis.R

## **Parent data sets are originally from the following link**

> #### http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


## **'run_analysis.R' consists of the following steps.**

> ### Step 1. 
> - Read features.txt file, which contains the variable names in the data set to be read.
> - Read-in 'subject ids' from the 'subject_train.txt' and 'subject_test.txt'.
> - Read-in 'X-train.txt' and 'X-test.txt'.
> - Contents of the Second column in the feature.txt were used as variable names, which are descriptive.
> - The variable names were extracted from the trasnposed 'feature'.
> - Read-in 'activity types' from the 'y_train.txt' and 'y_test.txt'.
> - Make data frames for the data sets, which include all variables, subejct IDs, and activity types. 
> - Merge two data frames using 'bind_rows' function ({dplyr} package) and reorder the resulting data frame using 'arrange' function ({dplyr} package).
> 
> #### ***NOTE:* Step 1 already includes Step 4 in the suggested course project instructions.**
> 
> 
> ### Step 2. 
> - Choose the columns containing means and standard deviations using 'select' function ({dplyr} package).
> 
> 
> ### Step 3.
> - Covert the activity codes to desctriptive activity type names using combination of 'for loop' and 'if statement'.
> 
> 
> ### Step 4. 
> - This was already taken care of in the step 1. 
> 
> 
> ### Step 5.
> - The average of each variable for each activity and each subject.'aggregate' function ({stats} package). 
> - Save the result in a single text file.

