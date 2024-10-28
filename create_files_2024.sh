#!/bin/bash

# Loop through each month (01 to 12)
for month in {01..12}; do
  # Create a directory for the current month
  mkdir -p "2024/$month"

  # Determine the number of days in the current month
  if [ "$month" = "02" ]; then
    days=28  # February (non-leap year)
  elif [[ "$month" = "04" || "$month" = "06" || "$month" = "09" || "$month" = "11" ]]; then
    days=30  # April, June, September, November
  else
    days=31  # All other months
  fi

  # Loop through each day in the month and create a file
  for day in $(seq -w 1 $days); do
    file_path="2024/$month/day-$day.html"
    echo "<!-- Task for 2024-$month-$day -->" > "$file_path"  # Create the file with content
    echo "Created file: $file_path"  # Print confirmation
  done
done

