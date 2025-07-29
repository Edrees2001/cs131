# IMDB Movie Trend Analysis

## Project Overview
This project analyzes the IMDB Top 1000 dataset to identify movie trends using ratings, runtime, and genres. It employs Spark MLlib for clustering and Python for visualization.

## Files
- `imdb_analysis.IPYNB`: Main Python script with Spark code for data processing and analysis.
- `metadata.txt`: Dataset metadata including entry count, features, and stats.
- `clustering_results.csv`: Results of KMeans clustering.
- `rating_runtime_clusters.png`: Scatter plot of movie clusters.
- `genre_ratings.png`: Bar plot of genre average ratings.

## Instructions
1. Install Spark and required Python libraries (pyspark, matplotlib, seaborn).
2. Run `imdb_analysis.IPYNB` with the dataset file `imdb_top_1000.csv` in the same directory on colab or Jupyter.
3. View generated plots and results in respective files.