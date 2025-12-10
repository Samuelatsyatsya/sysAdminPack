#!/bin/bash

#Terminate if any process fails
set -e

# Check if ANY of the directories already exist
if [ -d "logs" ] || [ -d "configs" ] || [ -d "scripts" ]; then
    echo -e "\nDirectory already exists"
else
    mkdir logs configs scripts
    echo "Created logs, configs, scripts directories"
fi

# Create files with sample content
if [ ! -f "logs/system.log" ]; then
    echo "System initialized" > logs/system.log
    echo "Created file logs/system.log"
else
    echo "File already exists: logs/system.log"
fi

if [ ! -f "configs/app.conf" ]; then
    echo "app_name=DevOpsChallenge" > configs/app.conf
    echo "Created file: configs/app.conf"
else
    echo "File already exists: configs/app.conf"
fi

if [ ! -f "scripts/backup.sh" ]; then
    echo -e "#!/bin/bash\n# Sample backup script\necho \"Backup completed\"" > scripts/backup.sh
    echo "Created file: scripts/backup.sh"
else
    echo "File already exists: scripts/backup.sh"
fi

# Set permissions
chmod 644 logs/system.log
chmod 444 configs/app.conf
chmod 755 scripts/backup.sh

# Show directory structure and permissions
echo -e "\nDirectory structure"
if command -v tree >/dev/null 2>&1; then
    tree
else
    echo -e "\ntree not found, using ls instead"
    ls -R
fi


echo -e "\nPermissions overview:"
ls -lR
