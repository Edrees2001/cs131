# DataCollector Script

## 📌 What This Script Does

This shell script automates the process of downloading and summarizing tabular datasets (CSV) from the UCI Machine Learning Repository or similar sources. It:

- Downloads a CSV dataset (zipped or not)
- Extracts the CSV file if it is zipped
- Displays all column (feature) names with index numbers
- Prompts the user to input which columns are numerical
- Generates a `summary-<filename>.md` file for each CSV that contains:
  - A numbered list of feature names
  - Minimum, Maximum, Mean, and Standard Deviation for each selected numerical feature

---

## ▶️ How to Use This Script

1. Make the script executable (only needed once): chmod +x datacollector.sh  
2. Run the Script: ./datacollector.sh  
3. When prompted:  
- Enter the URL of the CSV dataset (can be a direct CSV file or a zipped CSV archive)  
- Enter the column index numbers of numerical features, separated by commas (e.g., 1,2,3,4,5,6,7,8,9,10,11)  

# Demo Example: (Actual Terminal Execution Results)  
Welcome to Cloud Shell! Type "help" to get started.  
To set your Cloud Platform project in this session use `gcloud config set project [PROJECT_ID]`.  
You can view your projects by running `gcloud projects list`.  
mohammadedrees_nassimi@cloudshell:~$ cd ~/cs131/a2  
mohammadedrees_nassimi@cloudshell:~/cs131/a2$ chmod +x datacollector.sh  
mohammadedrees_nassimi@cloudshell:~/cs131/a2$ ./datacollector.sh  
Enter the URL of the CSV dataset (can be .zip):  
https://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/winequality-red.csv  
Downloading winequality-red.csv...  
Processing file: winequality-red.csv  
Features:  
1. fixed acidity  
2. volatile acidity  
3. citric acid  
4. residual sugar  
5. chlorides  
6. free sulfur dioxide  
7. total sulfur dioxide  
8. density  
9. pH  
10. sulphates  
11. alcohol  
12. quality  

Enter the column index numbers of numerical features (comma separated, e.g. 1,2,5):  
1,2,3,4,5,6,7,8,9,10,11  
Summary generated in summary-winequality-red.csv.md  
mohammadedrees_nassimi@cloudshell:~/cs131/a2$ cat summary-winequality-red.csv.md  
# Feature Summary for winequality-red.csv  

## Feature Index and Names  
1. fixed acidity  
2. volatile acidity  
3. citric acid  
4. residual sugar  
5. chlorides  
6. free sulfur dioxide  
7. total sulfur dioxide  
8. density  
9. pH  
10. sulphates  
11. alcohol  
12. quality  

## Statistics (Numerical Features)  
| Index | Feature | Min | Max | Mean | StdDev |  
|-------|---------|-----|-----|------|--------|  
| 1 | fixed acidity | 4.600 | 15.900 | 8.320 | 1.741 |  
| 2 | volatile acidity | 0.120 | 1.580 | 0.528 | 0.179 |  
| 3 | citric acid | 0.000 | 1.000 | 0.271 | 0.195 |  
| 4 | residual sugar | 0.900 | 15.500 | 2.539 | 1.409 |  
| 5 | chlorides | 0.012 | 0.611 | 0.087 | 0.047 |  
| 6 | free sulfur dioxide | 1.000 | 72.000 | 15.875 | 10.457 |  
| 7 | total sulfur dioxide | 6.000 | 289.000 | 46.468 | 32.885 |  
| 8 | density | 0.990 | 1.004 | 0.997 | 0.002 |  
| 9 | pH | 2.740 | 4.010 | 3.311 | 0.154 |  
| 10 | sulphates | 0.330 | 2.000 | 0.658 | 0.169 |  
| 11 | alcohol | 8.400 | 14.900 | 10.423 | 1.065 |  

---

## 📄 Summary Output Preview

After running the script, a file named `summary-winequality-red.csv.md` is generated. Here is the summary table:

| Index | Feature              | Min    | Max    | Mean    | StdDev |
|-------|----------------------|--------|--------|---------|--------|
| 1     | fixed acidity        | 4.600  | 15.900 | 8.320   | 1.741  |
| 2     | volatile acidity     | 0.120  | 1.580  | 0.528   | 0.179  |
| 3     | citric acid          | 0.000  | 1.000  | 0.271   | 0.195  |
| 4     | residual sugar       | 0.900  | 15.500 | 2.539   | 1.409  |
| 5     | chlorides            | 0.012  | 0.611  | 0.087   | 0.047  |
| 6     | free sulfur dioxide  | 1.000  | 72.000 | 15.875  | 10.457 |
| 7     | total sulfur dioxide | 6.000  | 289.000| 46.468  | 32.885 |
| 8     | density              | 0.990  | 1.004  | 0.997   | 0.002  |
| 9     | pH                   | 2.740  | 4.010  | 3.311   | 0.154  |
| 10    | sulphates            | 0.330  | 2.000  | 0.658   | 0.169  |
| 11    | alcohol              | 8.400  | 14.900 | 10.423  | 1.065  |
