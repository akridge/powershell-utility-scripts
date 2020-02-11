# ------------------------------------------------------------------------------------------------------------------------------------------
# Name:               Find and Rename
# Author:             Michael W. Akridge
# Last Update:        05-28-2019
# Version:            1.0
# ------------------------------------------------------------------------------------------------------------------------------------------
# User Config Below.
# ------------------------------------------------------------------------------------------------------------------------------------------
# location of your csv
$csv    = Import-Csv "T:\DataManagement\DataProjects\esd-data-resources-and-tools\PowerShell Utility Scripts\findandrename\files.csv"

# location of your files example 
$files = get-childitem -Recurse "C:\foldername\"

# ------------------------------------------------------------------------------------------------------------------------------------------
# Stop. Do not change anything below unless you know what you are doing.
# ------------------------------------------------------------------------------------------------------------------------------------------
#Simple Intro. Lines
Write-Host "                    ****Find and Rename v. 1.0****                " -foregroundcolor yellow -backgroundcolor DarkCyan
Write-Host "                      **Created by Michael Akridge**                   " -foregroundcolor yellow -backgroundcolor DarkCyan
Write-Host "                                                                       " -foregroundcolor yellow -backgroundcolor DarkCyan
Write-Host "* Starting Search Now...                                               " -foregroundcolor yellow -backgroundcolor DarkCyan

foreach($item in $CSV){
    foreach($file in $files){
        if($item.name -eq $file.basename){
            rename-item $file.fullname -NewName "$($item.newname).$($file.extension)" -Verbose
        }
    }
}
Write-Host "                    ****Done****                " -foregroundcolor yellow -backgroundcolor DarkCyan
