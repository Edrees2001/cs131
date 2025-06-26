#!/bin/bash

echo "Enter the URL of the CSV dataset (can be .zip):"
read url

filename=$(basename "$url")

echo "Downloading $filename..."
wget -q "$url" -O "$filename"
if [ $? -ne 0 ]; then
    echo "Download failed. Exiting."
    exit 1
fi

if [[ "$filename" == *.zip ]]; then
    echo "Unzipping $filename..."
    unzip -o "$filename" > /dev/null
    csv_files=(*.csv)
    if [ ${#csv_files[@]} -eq 0 ]; then
        echo "No CSV files found after unzipping. Exiting."
        exit 1
    fi
else
    csv_files=("$filename")
fi

for csvfile in "${csv_files[@]}"; do
    echo "Processing file: $csvfile"

    headers_line=$(head -1 "$csvfile")
    IFS=';' read -r -a headers <<< "$headers_line"

    echo "Features:"
    for i in "${!headers[@]}"; do
        idx=$((i+1))
        header_clean=$(echo "${headers[$i]}" | sed 's/"//g')
        echo "$idx. $header_clean"
    done

    echo ""
    echo "Enter the column index numbers of numerical features (comma separated, e.g. 1,2,5):"
    read -r num_cols_input
    IFS=',' read -r -a num_cols <<< "$num_cols_input"

    summaryfile="summary-${csvfile}.md"
    echo "# Feature Summary for $csvfile" > "$summaryfile"
    echo "" >> "$summaryfile"
    echo "## Feature Index and Names" >> "$summaryfile"
    for i in "${!headers[@]}"; do
        idx=$((i+1))
        header_clean=$(echo "${headers[$i]}" | sed 's/"//g')
        echo "$idx. $header_clean" >> "$summaryfile"
    done
    echo "" >> "$summaryfile"
    echo "## Statistics (Numerical Features)" >> "$summaryfile"
    echo "| Index | Feature | Min | Max | Mean | StdDev |" >> "$summaryfile"
    echo "|-------|---------|-----|-----|------|--------|" >> "$summaryfile"

    for col_idx in "${num_cols[@]}"; do
        col_idx=$(echo "$col_idx" | tr -d ' ')

        stats=$(awk -F';' -v col=$col_idx 'NR>1 && $col ~ /^[0-9.+-eE]+$/ {
            val=$col+0;
            sum+=val;
            sumsq+=val*val;
            if(min==""){min=val}
            if(val<min){min=val}
            if(val>max||max==""){max=val}
            count++
        }
        END {
            if(count>0){
                mean=sum/count;
                variance=(sumsq/count)-(mean*mean);
                if(variance<0) variance=0;
                stddev=sqrt(variance);
                printf("%.6g %.6g %.6g %.6g\n", min, max, mean, stddev);
            } else {
                printf("NA NA NA NA\n");
            }
        }' "$csvfile")

        header_clean=$(echo "${headers[$((col_idx-1))]}" | sed 's/"//g')
        read -r min max mean stddev <<< "$stats"
        min_f=$(printf "%.3f" "$min" 2>/dev/null || echo "NA")
        max_f=$(printf "%.3f" "$max" 2>/dev/null || echo "NA")
        mean_f=$(printf "%.3f" "$mean" 2>/dev/null || echo "NA")
        stddev_f=$(printf "%.3f" "$stddev" 2>/dev/null || echo "NA")

        echo "| $col_idx | $header_clean | $min_f | $max_f | $mean_f | $stddev_f |" >> "$summaryfile"
    done

    echo "Summary generated in $summaryfile"
done
