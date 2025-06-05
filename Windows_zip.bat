@echo off
setlocal enabledelayedexpansion

REM Loop through each subfolder
for /d %%F in (*) do (
    pushd "%%F"
    
    REM Check if there are .fastq.gz files
    dir /b *.fastq.gz >nul 2>&1
    if not errorlevel 1 (
        REM Create the zip file in parent directory, add only fastq.gz files
        powershell -command "Compress-Archive -Path *.fastq.gz -DestinationPath '..\%%F.zip'"
    )
    
    popd
)
