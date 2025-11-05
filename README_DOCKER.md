# Dockerized SBS Student Serving System

This document explains how to run the SBS Student Serving System using Docker for easy setup and deployment.

## Prerequisites

- Docker installed on your machine
- Docker Compose installed on your machine
- MySQL Workbench or MySQL client tools installed

## How to Export Database from MySQL Workbench

Before running the Docker containers, you need to export your existing database:

### Method 1: Using the export script (Recommended)
1. Make sure your local MySQL server is running with the SBS_DB database
2. Run the export script:
   ```
   ./export-db.sh
   ```
3. Enter your MySQL root password when prompted

### Method 2: Manual export using MySQL Workbench
1. Open MySQL Workbench
2. Connect to your local MySQL server
3. Select "Management" -> "Data Export"
4. Select the "SBS_DB" database
5. Choose "Export to Self-Contained File"
6. In "Tables to Export" section, select all tables
7. Click "Start Export"
8. Save the file as `mysql-init/init.sql`

### Method 3: Using mysqldump command
If you have mysqldump available in your terminal:
```
mysqldump -u root -p SBS_DB > mysql-init/init.sql
```

## How to Run (Development Mode)

1. Ensure you have exported your MySQL database to `mysql-init/init.sql` using one of the methods above

2. From the project root directory, run:
   ```
   docker-compose -f docker-compose.dev.yml up --build
   ```

3. Access the applications:
   - Frontend: http://localhost:5173
   - Backend API: http://localhost:8080
   - Database: localhost:3306 (external port 3307)

## How to Run (Production Mode)

1. Export your MySQL database from MySQL Workbench and place the SQL dump file in the `mysql-init` directory, replacing the placeholder [init.sql](file:///Users/sittminthar/Downloads/SBS-project--main%202/mysql-init/init.sql) file.

2. From the project root directory, run:
   ```
   docker-compose up --build
   ```

3. Access the applications:
   - Frontend: http://localhost (port 80)
   - Backend API: http://localhost:8080
   - Database: localhost:3306 (external port 3307)

## Services Overview

- **MySQL Database**: Running on port 3306 with persistent data storage
- **Backend**: Spring Boot application running on port 8080
- **Frontend (Dev)**: React development server running on port 5173
- **Frontend (Prod)**: Nginx server with built React app running on port 80

## Directory Structure

- `mysql-init/`: Contains database initialization scripts
- `uploads/`: Shared volume for file uploads between host and containers
- `backend.Dockerfile`: Docker configuration for the Spring Boot backend
- `frontend.Dockerfile`: Docker configuration for the React frontend development
- `frontend.prod.Dockerfile`: Docker configuration for the React frontend production
- `docker-compose.yml`: Production configuration
- `docker-compose.dev.yml`: Development configuration

## Troubleshooting

### No data in Docker containers
If your Docker containers start but contain no data:
1. Make sure `mysql-init/init.sql` is not empty
2. Check that the SQL file contains valid MySQL dump
3. Stop containers: `docker-compose down -v`
4. Re-export your database using one of the methods above
5. Restart containers: `docker-compose up --build`

### Connection issues with MySQL
If you're having trouble connecting to the MySQL container:
1. Check that port 3307 is not being used by another service
2. Verify MySQL container is running: `docker ps`
3. Check container logs: `docker logs sbs_mysql`

## Notes

- All data in the MySQL database is persisted in a Docker volume
- Uploaded files are stored in the `uploads/` directory and shared with the backend container
- The application will automatically initialize with your database dump on first run
- In development mode, changes to frontend code will be reflected immediately
- In production mode, you need to rebuild the frontend container after making changes