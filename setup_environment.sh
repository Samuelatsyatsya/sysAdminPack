#!/bin/bash

#Terminate if any process fails
set -e
# Check if ANY of the directories already exist
createDirectories() {
    DIR=("logs" "configs" "scripts")
    
    for dir in "${DIR[@]}"; do
        if [ -d "$dir" ]; then
            echo "Directory already exists: $dir"
        else
            mkdir "$dir"
            echo "Created directory: $dir"
        fi
    done
}

createFiles() {
    # Logs
# Array of file paths
FILES=("logs/system.log" "configs/app.conf" "scripts/backup.sh")

# Array of content corresponding to each file
contents=("System initialized" "app_name=DevOpsChallenge" "#!/bin/bash
# Sample backup script
echo \"Backup completed\"")

# Loop through arrays
for i in "${!FILES[@]}"; do
    file="${FILES[$i]}"
    content="${contents[$i]}"

    if [ ! -f "$file" ]; then
        # For scripts/backup.sh, use a here-doc if the file ends with .sh
        if [[ "$file" == *.sh ]]; then
            cat <<EOF > "$file"
$content
EOF
        else
            echo "$content" > "$file"
        fi
        echo "Created file: $file"
    else
        echo "File already exists: $file"
    fi
done

}

#Calling the functions
createDirectories
createFiles

# Set permissions
chmod 644 logs/system.log
chmod 444 configs/app.conf
chmod 755 scripts/backup.sh

# Show directory structure and permissions
if command -v tree >/dev/null 2>&1; then
    tree
elif [[ -x "$(command -v apt)" ]]; then
    sudo apt update && sudo apt install -y tree
    tree
else
    echo "tree not available and apt is not installed."
fi

#Display the directory structure and permissions
ls -lR









