@echo off
setlocal enabledelayedexpansion

set DB_USER=your_db_user
set DB_PASSWORD=your_db_password
set DB_NAME=your_db_name
set WAMP_PATH=C:\path\to\mysql\bin
set SQL_PATH=C:\path\to\sql_files
set LOG_PATH=C:\path\to\log_directory

:: Créer le répertoire de logs s'il n'existe pas
if not exist "%LOG_PATH%" (
    mkdir "%LOG_PATH%"
)

echo Checking MySQL path...
if not exist "%WAMP_PATH%\mysql.exe" (
    echo MySQL executable not found in the specified path.
    pause
    exit /b
)

echo Checking SQL files path...
if not exist "%SQL_PATH%" (
    echo SQL files path does not exist.
    pause
    exit /b
)

:: Tester la connexion à la base de données
echo Testing database connection...
"%WAMP_PATH%\mysql.exe" -u %DB_USER% -e "SHOW DATABASES;" > "%LOG_PATH%\test_connection.txt" 2>&1
if %errorlevel% neq 0 (
    echo Failed to connect to the database. See log file for details.
    type "%LOG_PATH%\test_connection.txt"
    pause
    exit /b
) else (
    echo Database connection successful.
)

for %%f in (
    "example_table1.sql"
    "example_table2.sql"
    "example_table3.sql"
    "example_table4.sql"
    "example_table5.sql"
    "example_table6.sql"
    "example_table7.sql"
    "example_table8.sql"
    "example_table9.sql"
    "example_table10.sql"
    "example_table11.sql"
    "example_table12.sql"
    "example_table13.sql"
    "example_table14.sql"
    "example_table15.sql"
    "example_table16.sql"
    "example_table17.sql"
    "example_table18.sql"
    "example_table19.sql"
    "example_table20.sql"
    "example_table21.sql"
    "example_table22.sql"
    "example_table23.sql"
    "example_table24.sql"
    "example_table25.sql"
    "example_table26.sql"
    "example_table27.sql"
    "example_table28.sql"
    "example_table29.sql"
    "example_table30.sql"
    "example_table31.sql"
    "example_table32.sql"
    "example_table33.sql"
    "example_table34.sql"
    "example_table35.sql"
) do (
    echo Importing %%f...
    if not exist "%SQL_PATH%\%%f" (
        echo File %%f not found.
        continue
    )
    "%WAMP_PATH%\mysql.exe" -u %DB_USER% %DB_NAME% < "%SQL_PATH%\%%f" 1>> "%LOG_PATH%\import_log.txt" 2>> "%LOG_PATH%\error_log.txt"
    if %errorlevel% neq 0 (
        echo Error importing %%f. See error log for details.
    ) else (
        echo %%f imported successfully.
    )
)

echo All files processed.
pause
