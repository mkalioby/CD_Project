# Getting and Cleaning Data Project
This is a submission for Getting and Cleaning Data course project.

The script can be found in run_analysis.R

The script works as follow:

1. Read and extracts the header from the features file
2. Load Activites
3. Load Test set (X_test) and add header to it
4. Remove Unwanted columns out from test set.
5. Add Activites to test set.
6. Add Subject name to test set
7. Load Train set and add header to it
8. Remove Unwanted columns from the train set
9. Add Activites to train set
10. Add Subject name to train set
11. Merge both sets as a merged set
12. Create Group Based on Subject and Activity
13. Calculate the mean for each group
14. Replace activity numbers by names
15. Remove Group Column
16. Write file

**Cookbook can be found in: https://github.com/mkalioby/CD_Project/blob/master/CookBook.md**
