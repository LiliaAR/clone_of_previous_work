#!/bin/bash

start_date="2022-01-01"
end_date="2024-12-31"
current_date="$start_date"

# Loop through each day from start_date to end_date
while [ "$current_date" != "$(date -I -d "$end_date + 1 day")" ]; do
  year=$(date -d "$current_date" +%Y)
  month=$(date -d "$current_date" +%m)
  day=$(date -d "$current_date" +%d)
  file_path="$year/$month/day-$day.html"

  # Check if the file exists for the day
  if [ -f "$file_path" ]; then
    # Add, commit, and set commit date to match the file's intended date
    git add "$file_path"
    GIT_COMMITTER_DATE="$current_date 12:00:00" git commit -m "Add file for 
$current_date" --date="$current_date 12:00:00"
    echo "Committed $file_path for $current_date"
  fi

  # Move to the next day
  current_date=$(date -I -d "$current_date + 1 day")
done

