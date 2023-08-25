#!/bin/bash
# set -x

# Define the name of the input file
input_file="unix_tools.txt"
download_dir=$(mktemp --directory)
to_dir="$HOME/bin"
echo "Downloading to $download_dir"

# Check if the input file exists
if [ ! -f "$input_file" ]; then
    echo "Input file $input_file not found."
    exit 1
fi

# Determine the current OS
current_os="$(uname -s | tr '[:upper:]' '[:lower:]')"

# Loop through each line in the input file
while IFS='|' read -r repo owner pattern new_name; do
    # Skip lines starting with a '#' (comments)
    if [[ "$repo" == \#* ]]; then
        continue
    fi

    # Define the API URL
    api_url="https://api.github.com/repos/$owner/$repo/releases/latest"

    # Get the latest release URL for the current OS and architecture
    latest_url=$(curl -s $api_url | jq -r "
                            .assets[] | 
                            select(.name | contains(\"$current_os\")) |
                            select( (.name | contains(\"x86\")) or (.name | contains(\"amd64\"))) |
                            .browser_download_url
                        " | head -1)

    # Check if a download URL was found
    if [ -n "$latest_url" ]; then
        # Extract the file name from the URL
        file_name=$(basename $latest_url)

        # Download the latest release for the current OS and architecture
        curl -L -o $file_name $latest_url

        # Check if the pattern is empty
        if [ -z "$pattern" ]; then
            # Move the downloaded file directly to new_name
            mv $file_name $to_dir/$new_name
            echo "Moved downloaded file to $new_name."
        else
            # Extract the archive
            tar -xzvf $file_name --directory=$download_dir

            # Find and rename the file matching the pattern
            find $download_dir -name "$pattern" -exec mv {} $to_dir/$new_name \;

            echo "Downloaded and extracted release for $owner/$repo on $current_os. Renamed files matching '$pattern' to '$new_name'."

            # Clean up the downloaded archive
            rm $file_name
        fi
    else
        echo "No release found for $current_os and architecture in $owner/$repo."
    fi
done < "$input_file"
