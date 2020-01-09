# README.md

The following actions were applied to produce a tidy dataset from the initial datasets:

### Step 1: Load Data

In step one, each of the Training and Testing Datasetes (X_train, y_train, train_subject, X_test, y_test, test_subject, features, activity_labels) were imported from the "UCI HAR Dataset folder'

### Step 2: Apply Naming Convention

In step two, naming conventions are applied to the imported datasets to ensure that column names in the final dataset are description.

In addition to naming conventions, this section maps the activity numbers to their activity names through a left_join().

### Step 3: Merge Training and Test sets

In step three, the imported datasets are merged using a cbind funtion, and then the testing and training sets are merged with the rbind function.

### Step 4: Match column names with std() and mean()

In step 4, column names which include the character strings "mean()" and "std()" are detected using the grep function. Matching columns, plus the 'subject' and 'activity' columns are extracted into a smaller dataset.

### Step 5: Create tidy dataset

In step 5, a tidy dataset is created which has grouped subjects and activities together, taking the average value (mean()) of the sensors responses.