# Weather Exploratory Data Analysis 
This project involves exploring and analyzing a weather dataset to gain insights into various weather patterns, trends, and relationships between different weather parameters. The analysis is done using Python, with a focus on data cleaning, statistical summary, visualization, and time series analysis.

## Project Overview
This notebook is part of a data science bootcamp at Lux Academy, specifically for the Week 2 project. The primary goal is to conduct exploratory data analysis (EDA) on a weather dataset. The notebook walks through several steps including data cleaning, statistical analysis, and visualization to uncover trends and patterns in the weather data.

## Installation
To run this notebook, you need to install the required libraries and download the dataset from Kaggle.

## Prerequisites
1. Python 3.x
2. Kaggle API Client
3. Jupyter Notebook or Google Colab

## Step 1: Loading the Data
_Importing Libraries_

``` python
# Import Libraries
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

```

**pandas** is used for data manipulation and analysis.

**numpy** provides support for large, multi-dimensional arrays and matrices.

**matplotlib** is a plotting library for creating static, animated, and
interactive visualizations.

**seaborn** is built on top of matplotlib and provides a high-level interface for creating attractive and informative statistical graphics

## Dataset Overview
The dataset consists of various weather parameters like temperature, humidity, wind speed, visibility, and more, collected over time. The goal is to analyze these parameters to find trends, correlations, and patterns.

`Number of records`: 8784 rows
`Number of features`: 13 columns
`Data types`: Numerical and categorical

## Project Goals

1. Data Overview and Cleaning:
   Inspect the dataset for missing or null values, and handle duplicates.
2. Statistical Summary:
 Provide a descriptive statistical summary of the numerical features.
3. Data Visualization:
Visualize the distribution of key weather parameters using histograms, box plots, and heatmaps.
4. Weather Patterns and Trends:
Analyze trends over time using time series plots.   
Investigate seasonal variations and anomalies.
5. Key Insights and Conclusions:
Summarize the main findings from the analysis.
6. Recommendations for Further Analysis:
Suggest areas where further analysis can be done for deeper insights.

_Loading the data_

The first step in EDA is loading your data into a DataFrame.
We can do this using pandas. 
``` python
# Load the dataset
data_frame_name = pd.read_csv("File_path_to_your_csv_file")
```
![Importing libraries - Image by Author](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/lct9058qs9lrc5ww03tt.png)

the content in the bracket is usually the file path. alternatively you can define file path then call it.

``` python
# Load the dataset
File_path = "File_path_to_your_csv_file"
data_frame_name = pd.read_csv(File_path)
```

![File Path - Image by Author](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/8bxp23clyr259qrri18a.png)

You can get a quick overview of the data and its structure by 
using the `.head()` method. It gives us a glance at the first few rows to understand the basic structure — what columns are present, how the data is organized, and any initial impressions you might have about the values. By default, it shows the first 5 rows, including column names. 

``` python
# Display the first five rows
data_frame_name.head()

# Alternatively you can use a print function. Gives you the same results
print(data_frame_name.head())
```


![Display the first five rows - Image by Author](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/7vxcuduovbezpsseaz2l.png)

but wait, what if you want the last rows instead? We use `.tail()` method instead.

``` python
# Display the last five rows
data_frame_name.tail()

# Alternatively you can use a print function. Gives you the same results
print(data_frame_name.tail())
```

![Display the last five rows - Image by Author](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/r3d0y8oprn7gbhlqpifa.png)

Hmm, how about both the head and tail of the dataframe? We can do that by simply calling our dataframe.
``` python
# Display the first five and last five rows
data_frame_name

# Alternatively you can use a print function. Gives you the same results
print(data_frame_name)
```

![Display the dataset - Image by Author](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/ooo7oslzyag0f5q4fagn.png)

## Step 2: Checking the Data's Structure

Understanding the structure means knowing the number of rows, columns, and data types present in the dataset. This can give you clues about the kind of analysis you'll be able to perform.

``` python
# Check the structure of the dataset
weather_data.info()
``` 

![Display the information of the dataset - Image by Author](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/qqvsj4s7huh6caorbihw.png)

This command will show the total number of entries (rows), the number of columns, and the data type of each column. It also highlights how many non-null values are present in each column. 

you can also get the numbers of rows and columns separately using `.shape`

```python
# Display the number of rows and columns in the DataFrame (rows,cols)
data_frame_name.shape
```

![Display the rows and columns - Image by Author](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/5x5zbz6ghnksbzo7nizn.png)

and the columns using `.columns`
```python
# Display the column names of the DataFrame
data_frame_name.columns
```

![Display the columns- Image by Author](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/95un0nn9r886g2etdb7k.png)

and the data types using `.dtypes`
```python
# Display the data types of each column
data_frame_name.dtypes
```

![Display the data types - Image by Author](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/8evdlwfu2esmcixwu359.png)

### Step 3: Summarizing the Data
Next, you'll want to get a summary of the numerical columns. This provides an overview of the data's central tendency, dispersion, and shape of the distribution. We do that using `.describe()`. This command gives you a quick statistical summary of each numeric column, including the mean, standard deviation, minimum, and maximum values. This helps in identifying any outliers or unusual distributions.
```python
# Get a summary of numerical columns
data_frame_name.describe()
```

![Display the summary of the dataset - Image by Author](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/gqfxrg7tu54d43oaknyh.png)

## Step 4: Identifying Missing Values
Missing values can be tricky—they might represent gaps in data collection, or they might be errors. It's essential to identify and decide how to handle them.
```python
# Check for missing values
data_frame_name.isnull().sum()
```

![Check for missing values - Image by Author](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/ws06aasholxvl26x8zht.png)
_Luckily our dataset does not have any missing values_

If any columns have missing values, you'll need to decide whether to remove them or fill them with an appropriate value (like the mean or median).

We can also check for any duplicates by
```python
# Check for and count duplicate rows
data_frame_name.duplicated().sum()
```

![Check for duplicates - Image by Author](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/ydfmp2jumtqbxz57gcm2.png)
_Luckily our dataset does not have duplicates_

## Step 5: Visualizing the Data
Visualization helps you see patterns, trends, and relationships in the data that might not be obvious from raw numbers. How can we represent data this way? Most ways to visualize include:
- Histograms: Display the distribution of numerical data.
- Scatter plots: Show the relationship between two numerical variables.
- Bar charts: Compare categorical data.
- Line charts: Visualize data over time.

Let's start with a simple histogram to understand the distribution of a particular column, such as temperature:
```python
# Plot a histogram of the 'Column_name' column
plt.hist(weather_data['Column_name'], bins=30, edgecolor='black') #you can change the color to anything
plt.title('Distribution of Column_name')
plt.xlabel('Column_name')  # Label for the x-axis (horizontal axis)
plt.ylabel('Frequency')  # Label for the y-axis (vertical axis)
plt.show()

```
`bins=30`: This divides the data into 30 bins (intervals) for counting frequencies. You can adjust this number.
`edgecolor='black'`: This adds black outlines to the bars for better visual separation.

![Histogram - Image by Author](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/4cdpa8td5m0n9qdapkvo.png)
let's change the `edgecolor` to white and add gridlines
```python
# Plot a histogram of the 'Column_name' column
plt.hist(weather_data['Column_name'], bins=30, edgecolor='white') #you can change the color to anything
plt.title('Distribution of Column_name')
plt.xlabel('Column_name')  # Label for the x-axis (horizontal axis)
plt.ylabel('Frequency')  # Label for the y-axis (vertical axis)
plt.grid(True) # Add gridlines for better readability
plt.show()
```


![Histogram with gridlines - Image by Author](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/cxq438zkbxlcqbam2led.png)

_Try using different columns and different visualization methods_

## Step 6: Finding Correlations
Correlation analysis helps you understand how different variables relate to each other. This is especially useful if you plan to build a predictive model later.

```python
# Compute correlation matrix
correlation_matrix = weather_data.corr()

# Display the correlation matrix
correlation_matrix

```

![Display correlation matrix error - Image by Author](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/zngau8kdorv83xoojq45.png)
But wait, we get an error. Why is that? The `.corr()` method works only on numerical data. How do we handle this? We extract numerical columns from the dataset by creating a new dataframe. Then try the `.corr()` method again on the new dataframe that contains the numerical columns only.

```python
# Extract numerical features for correlation
numerical_data = data_frame_name.select_dtypes(include=['number'])

# Compute correlation matrix on numerical data
correlation_matrix = numerical_data.corr()

# Display the correlation matrix
correlation_matrix
```


![IDisplay correlation matrix - Image by Author](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/6ak7669emfsvinay5xyc.png)

This matrix shows how each pair of columns relates. Values close to 1 or -1 indicate a strong relationship, while values near 0 suggest little to no relationship.

A way to visualize it is using **heatmaps**. Heatmaps are a type of data visualization that use color to represent the values in a matrix or table. 

```python
sns.heatmap(data, annot=True, cmap='coolwarm', fmt=".2f")
plt.title("Heatmap Title")
plt.show()
``` 
`data`: This is the 2D dataset (e.g., a correlation matrix) that you want to visualize.
`annot=True`: This displays the numerical values within each cell of the heatmap.
`cmap='coolwarm'`: This sets the color palette for the heatmap. 'coolwarm' is a common choice, but you can explore other options.
`fmt=".2f"`: This formats the displayed numerical values to two decimal places.


![IDisplay correlation matrix heatmap - Image by Author](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/qeqgpp5s8kvzm18jqqjr.png)













