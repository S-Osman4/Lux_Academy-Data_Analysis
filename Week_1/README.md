# Lux Tech Academy Data Science Bootcamp - Week 1 Project

## Project Overview

This project involves exploring a weather dataset using Python and SQL. The goal is to answer specific questions about the dataset to demonstrate data manipulation and analysis skills.

## Project Goals
- Explore a weather dataset using Python.
- Answer specific questions about the dataset.
- Demonstrate data manipulation and analysis skills using SQL.

## Tools and Libraries Used
- Python
  - Pandas
  - NumPy
- SQL
  - MySQL
  - MySQL Workbench
- Colab
- VSCode

## Dataset
The dataset used for this project is downloaded from Kaggle.

## Python Analysis
For part 1 of the project I used Google Colab. Explore the [notebook](https://github.com/S-Osman4/Lux_Academy-Data_Analysis/blob/main/Week_1/Week_1_Data_Analysis_Challenge_Weather_Data.ipynb).

### Installation and Setup

1. Install the Kaggle API client:
```python
!pip install kaggle
```
2. Download the dataset from Kaggle:
```python
!kaggle datasets download ayushmi77al/weather-data-set-for-beginners
```
3. Unzip the dataset:
 ```python
   !unzip /content/weather-data-set-for-beginners.zip
 ```
4. Load the dataset using Pandas:
```python
import pandas as pd
import numpy as np

data = pd.read_csv("1. Weather Data.csv")
```
### Data Exploration
1. Displaying the first and last five rows:
```python
data.head()
data.tail()
```
2. Shape and information of the dataset:
```python
data.shape
data.info()
```
### Answering the Questions
1. Find all records where the weather was exactly clear:
   ```python
    Clear_Weather = data[data['Weather'] == 'Clear']
    print(Clear_Weather)
   ```   
2. Find the number of times the wind speed was exactly 4 km/hr:
   ```python
    Wind_Speed_Count = data[data['Wind Speed_km/h'] == 4].shape[0]
    print(Wind_Speed_Count)
   ```   
3. Check if there are any NULL values present in the dataset:
   ```python
    data.isnull().sum()
   ```   
4. Rename the column "Weather" to "Weather_Condition":
   ```python
    data.rename(columns = {'Weather' : 'Weather_Condition'}, inplace=True)
    data.head()
   ```   
5. What is the mean visibility of the dataset?
   ```python
     Visibility_Mean = data['Visibility_km'].mean()
     print(Visibility_Mean)
   ```    
6. Find the number of records where the wind speed is greater than 24 km/hr and visibility is equal to 25 km:
   ```python
    data.groupby('Weather_Condition').mean(numeric_only=True)
   ```    
7. What is the mean value of each column for each weather condition?
   ```python
    data.groupby('Weather_Condition').mean(numeric_only=True)
   ```     
8. Find all instances where the weather is clear and the relative humidity is greater than 50, or visibility is above 40:
   ```python
     data[(data['Weather_Condition'] == 'Clear') & ((data['Rel Hum_%'] > 50) | (data['Visibility_km'] > 40))]
   ```    
9. Find the number of weather conditions that include snow:
   ```python
    Snow_Count = data[data['Weather_Condition'].str.contains('Snow')].shape[0]
    print(Snow_Count)     
   ```  

## SQL Analysis
For part 2, I explored both MySQL Workbench and VSCode. Explore the [sql file](https://github.com/S-Osman4/Lux_Academy-Data_Analysis/blob/main/Week_1/Week_1_Data_Analysis_Challenge_Weather_Data.sql).

### Installation and set up
1. Install MySQL Workbench:

Download and install MySQL Workbench from the official MySQL website.
Set up a connection to MySQL server by providing the necessary credentials (hostname, port, username, and password).

2. Install VSCode and SQL Tools:

Download and install Visual Studio Code (VSCode).
Install the SQLTools extension in VSCode from the Extensions Marketplace.

* Connect to Database in VSCode:

   - Open VSCode and use the SQLTools extension to connect to MySQL database.
   - Configure the connection settings in SQLTools to match MySQL server credentials.

### Answering the Questions
1. Find all records where the weather was exactly clear:
   
![Question_1](https://github.com/S-Osman4/Lux_Academy-Data_Analysis/blob/main/Week_1/Images/Question_1.png)
   
2. Find the number of times the wind speed was exactly 4 km/hr:

![Question_2](https://github.com/S-Osman4/Lux_Academy-Data_Analysis/blob/main/Week_1/Images/Question_2.png)   

   
5. What is the mean visibility of the dataset?

![Question_5](https://github.com/S-Osman4/Lux_Academy-Data_Analysis/blob/main/Week_1/Images/Question_5.png)   

   
6. Find the number of records where the wind speed is greater than 24 km/hr and visibility is equal to 25 km:

![Question_6](https://github.com/S-Osman4/Lux_Academy-Data_Analysis/blob/main/Week_1/Images/Question_6.png)

### Full code on my VSCode

![Full Code](https://github.com/S-Osman4/Lux_Academy-Data_Analysis/blob/main/Week_1/Images/Full_SQL_code.png)

## Acknowledgements
* [Kaggle](https://www.kaggle.com/datasets/ayushmi77al/weather-data-set-for-beginners/code) for providing the dataset.
* [Lux Tech Academy](https://x.com/LuxDevHQ) for the data science bootcamp.

