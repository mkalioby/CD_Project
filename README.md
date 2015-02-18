# Getting and Cleaning Data Project
This is a submission for Getting and Cleaning Data course project.

The script can be found in run_analysis.R

The script works as follow:

1. Read and extracts the header from the features file
2. Load Activites
3. Load Test set (X_test) and add header to it
4. Remove Unwanted columns out.
5. Add Activites to test set.
6. Add Subject name to test_set
7. Load Train set and add header to it
8. Add Activites to train set
9. Add Subject name to train set
10. Merge both sets as a merged set
11. Create Group Based on Subject and Activity
12. Calculate the mean for each group
13. Replace activity numbers by names
14. Remove Group Column
15. Write file

**Cookbook can be found in [CookBook.md]: https://github.com/mkalioby/CD_Project/blob/master/CookBook.md**
