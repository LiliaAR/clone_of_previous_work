#!/bin/bash

# Loop through each year, month, and day
for year in 2022 2023 2024; do
  for month in $(seq -w 1 12); do
    for day in $(seq -w 1 31); do
      # Check if the file exists (handles months with less than 31 days)
      file_path="$year/$month/day-$day.html"
      if [ -f "$file_path" ]; then
        # Add the file to staging
        git add "$file_path"
        # Commit with a backdated timestamp
        GIT_AUTHOR_DATE="$year-$month-$day 12:00:00" 
GIT_COMMITTER_DATE="$year-$month-$day 12:00:00" git commit -m "Backdated commit 
for $year-$month-$day"
      fi
    done
  done
done

