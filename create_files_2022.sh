#!/bin/bash

start_date="2022-01-01"
end_date="2022-12-31"
current_date="$start_date"

while [ "$current_date" != "$(date -v+1d -jf "%Y-%m-%d" "$end_date" +%Y-%m-%d)" 
]; do
  year=$(date -jf "%Y-%m-%d" "$current_date" +%Y)
  month=$(date -jf "%Y-%m-%d" "$current_date" +%m)
  day=$(date -jf "%Y-%m-%d" "$current_date" +%d)
  file_path="$year/$month/day-$day.html"

  if [ -f "$file_path" ]; then
    git add "$file_path"
    GIT_COMMITTER_DATE="$current_date 12:00:00" git commit -m "Add file for 
$current_date" --date="$current_date 12:00:00"
    echo "Committed $file_path for $current_date"
  fi

  # Advance to the next day
  current_date=$(date -v+1d -jf "%Y-%m-%d" "$current_date" +%Y-%m-%d)
done

