# Code Book for Coursera: Getting and Cleaning Data

A tidy dataset was prepared over the course of this assignment. The final dataset is available to view in the *"tidy_dataset.txt"* file in the root of this repository.

Please see the *"README.md"* document for information on running the scripts.

This code book describes the variables, data, and transformations that were performed in order to clean up the dataset.

# Variables
The final dataset, entitled "tidy_dataset.txt" is structured as a tibble with the following properties:

- subject: this integer number is indexes (and anonymizes) the subjects who performed training and testing

- activity: this factor contains the 6 categories of interest: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING. 

- raw data (columns 3 to 68): are the average of the raw data, grouped by subject and activity.
