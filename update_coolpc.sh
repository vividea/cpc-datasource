#!/bin/bash

# Define the URL
URL="https://www.coolpc.com.tw/evaluate.php"

# Get the current date in yyyy-mm-dd format
TODAY=$(date +%F)

# Define the filename with the current date
FILENAME="coolpc_price_${TODAY}.html"

# Use curl to fetch the data and save it to the specified file
curl "$URL" -o "$FILENAME"

# Check if the curl command was successful
if [ $? -eq 0 ]; then
    # Add the file to the git staging area
    git add "$FILENAME"

    # Commit with a message including the date
    git commit -m "update coolpc price on ${TODAY}"

    # Push the commit to the repository
    git push
else
    echo "Failed to fetch data from $URL"
    exit 1
fi
