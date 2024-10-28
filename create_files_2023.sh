#!/bin/bash

# Define the year
year=2023

# Loop over months
for month in {1..12}; do
    # Loop over days in the month
    for day in {1..31}; do
        # Format the month and day with leading zeros
        month_padded=$(printf "%02d" $month)
        day_padded=$(printf "%02d" $day)

        # Check for valid dates
        if ! date -d "$year-$month_padded-$day_padded" >/dev/null 2>&1; then
            continue
        fi

        # Create directory for the month if it doesn't exist
        mkdir -p "$year/$month_padded"

        # Create an HTML file with a placeholder comment
        echo "<!-- Task for $year-$month_padded-$day_padded -->" > "$year/$month_padded/day-$day_padded.html"
        
        # Add and commit each file with backdated message
        git add "$year/$month_padded/day-$day_padded.html"
        GIT_COMMITTER_DATE="$year-$month_padded-$day_padded 12:00:00" git commit -m "Add task for $year-$month_padded-$day_padded" --date="$year-$month_padded-$day_padded 12:00:00"
    done
done



