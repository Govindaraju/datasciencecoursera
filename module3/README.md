Make a tidy data using the script run_analysis.R 
------------------------------------------------------------------------------------

###How the script is made:
  * The script depends on **data.table** and **pylr** packages.
  * Read subject data indicating the person whose activities are recorded
  * Read the measurements data, which has 561 column data representing various measurements from the files **X_test.txt** and **Y_test.txt**
  * Read **561 column** names pertaining to various measurements from the file features.txt
  * set the columns to the test and train data sets.
   * Read different activities performed by the participants namely "WALKING", "WALKING UPSTAIRS", "WALKING DOWNSTAIRS", "SITTING", "STANDING", "LAYING"
  * Replace activity denoted by numbers 1 to 6 with their respective name
     + 1 WALKING
     + 2 WALKING-UPSTAIRS
     + 3 WALKING-DOWNSTAIRS
     + 4 SITTING
     + 5 STANDING
     + 6 LAYING
  * Set the column names to the train and test data sets.
  * Make the train and test data frames to data.table to facilitate efficient operations on the data
  * Add **subject** as one of the columns of the train and test data sets.
  * Add **activity** as one of the columns of the train and test data sets.
  * Now **merge** the **test** and **train** data. 
  * **Short list** the columns that represent the **mean** and **standard deviation (std)** of the data.
  * Now the data set will have train and test data with only mean() and std() columns in it.
  * Using **lapply()** function compute the **mean (average)** of each column **grouped by** the **activity** and **subject**.
  * Write the data obtained through the above step, to a file called **tidydata.txt** with the help of write.table
    function.
  * Below is a sample output when you run res<- run_analysis();res[1:12,1:5,with=F]
  
subject | activity | tBodyAcc-mean()-X | tBodyAcc-mean()-Y | tBodyAcc-mean()-Z
--------|----------|-------------------|-------------------|------------------
1 |              LAYING | 0.2215982 | -0.040513953 | -0.1132036
1 |             SITTING | 0.2612376 | -0.001308288 | -0.1045442
1 |            STANDING | 0.2789176 | -0.016137590 | -0.1106018
1 |             WALKING | 0.2773308 | -0.017383819 | -0.1111481
1 |  WALKING_DOWNSTAIRS | 0.2891883 | -0.009918505 | -0.1075662
1 |    WALKING_UPSTAIRS | 0.2554617 | -0.023953149 | -0.0973020
2 |              LAYING | 0.2813734 | -0.018158740 | -0.1072456
2 |             SITTING | 0.2770874 | -0.015687994 | -0.1092183
2 |            STANDING | 0.2779115 | -0.018420827 | -0.1059085
2 |             WALKING | 0.2764266 | -0.018594920 | -0.1055004
2 |  WALKING_DOWNSTAIRS | 0.2776153 | -0.022661416 | -0.1168129
2 |    WALKING_UPSTAIRS | 0.2471648 | -0.021412113 | -0.1525139