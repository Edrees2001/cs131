# DataCollector Script

## 📌 What This Script Does

This shell script automates the process of downloading and summarizing tabular datasets (CSV) from the UCI Machine Learning Repository or similar sources. It:

- Downloads a CSV dataset (zipped or not)
- Extracts the CSV file if it is zipped
- Displays all column (feature) names with index numbers
- Prompts the user to input which columns are numerical
- Generates a `summary.md` file for each CSV that contains:
  - A numbered list of feature names
  - Min, Max, Mean, and StdDev for each selected numerical feature

## ▶️ How to Use This Script

1. **Make the script executable** (you only need to do this once):

   ```bash
   chmod +x datacollector.sh

