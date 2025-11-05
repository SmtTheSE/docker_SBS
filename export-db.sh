#!/bin/bash

# This script helps export the database from MySQL for Docker initialization

echo "Exporting SBS_DB database for Docker initialization..."

# Create mysql-init directory if it doesn't exist
mkdir -p mysql-init

# Check if mysqldump is available
if ! command -v mysqldump &> /dev/null
then
    echo "Error: mysqldump could not be found. Please ensure MySQL is installed and in your PATH."
    exit 1
fi

# Export the database
# You might need to adjust the username, password, and database name
echo "Please enter MySQL root password when prompted:"
mysqldump -u root -p SBS_DB > mysql-init/init.sql

# Check if export was successful
if [ $? -eq 0 ]; then
    echo "Database exported successfully to mysql-init/init.sql"
    echo "File size: $(ls -lh mysql-init/init.sql | awk '{print $5}')"
else
    echo "Error: Database export failed"
    exit 1
fi

echo "You can now run 'docker-compose up --build' to start the application"