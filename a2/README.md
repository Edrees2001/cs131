# DataCollector Script

## What This Script Does
This shell script takes a URL to a dataset (usually from the UCI Machine Learning Repository), downloads it, unzips it if needed, and creates a summary file for each CSV. The summary includes a list of features and basic statistics (min, max, mean, and standard deviation) for any numerical columns selected by the user.

## How to Use This Script
1. Make the script executable: `chmod +x datacollector.sh` (only needed once).
2. Run it with: `./datacollector.sh`
3. When prompted, paste the URL of a zipped CSV dataset.
4. Once the features are listed, enter the column numbers that are numerical (comma-separated, no spaces).

## Demo

```bash
$ ./datacollector.sh
Enter the URL to the dataset: https://archive.ics.uci.edu/static/public/186/wine+quality.zip
Enter index numbers of numerical columns (comma-separated, no spaces): 1,2,3,4,5,6,7,8,9,10,11
