#!/bin/bash

# Set up start and end dates for 2022, 2023, and part of 2024
START_DATE="2022-01-01"
END_DATE="2024-10-21"

# Loop through each date from START_DATE to END_DATE
current_date=$START_DATE
while [[ "$current_date" < "$END_DATE" ]]; do
  # Extract the year, month, and day from the current date
  year=$(date -d "$current_date" +%Y)
  month=$(date -d "$current_date" +%m)
  day=$(date -d "$current_date" +%d)

  # Check if file exists for this day, create if not
  file_path="$year/$month/day-$day.html"
  if [ ! -f "$file_path" ]; then
    echo "Creating dummy file for $current_date"
    echo "<!-- File for $current_date -->" > $file_path
  fi

  # Add the file to git
  git add $file_path

  # Commit the file with backdated author and committer date
  GIT_AUTHOR_DATE="$current_date 12:00:00" GIT_COMMITTER_DATE="$current_date 12:00:00" git commit -m "Commit for $current_date"

  # Move to the next day
  current_date=$(date -I -d "$current_date + 1 day")
done

# Push the commits to GitHub
git push origin main