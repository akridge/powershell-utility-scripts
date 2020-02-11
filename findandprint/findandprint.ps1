# ------------------------------------------------------------------------------------------------------------------------------------------
# Name:               Find and Print 
# Author:             Michael W. Akridge
# Last Update:        09/28/2017
# Version:            1.0
# ------------------------------------------------------------------------------------------------------------------------------------------
# User Config Below. Manual or via .txt files
# ------------------------------------------------------------------------------------------------------------------------------------------
# Set your search directory
$searchdir =  Get-Content config_files\SET_YOUR_SEARCH_DIRECTORY.txt

# ------------------------------------------------------------------------------------------------------------------------------------------
# Stop. Do not change anything below unless you know what you are doing.
# ------------------------------------------------------------------------------------------------------------------------------------------
#Simple Intro. Lines
Write-Host "                    ****Find and Print Script v. 1.0****                " -foregroundcolor yellow -backgroundcolor DarkCyan
Write-Host "                      **Created by Michael Akridge**                   " -foregroundcolor yellow -backgroundcolor DarkCyan
Write-Host "                                                                       " -foregroundcolor yellow -backgroundcolor DarkCyan
Write-Host "* Starting Search Now...                                               " -foregroundcolor yellow -backgroundcolor DarkCyan
Write-Host "Current Search Directory: $searchdir" -foregroundcolor yellow -backgroundcolor DarkCyan

get-childitem -path $searchdir -Filter *.jpg -Recurse | where {!$_.PSIsContainer} | select-object FullName, LastWriteTime | export-csv -notypeinformation -path files.csv | % {$_.Replace('"','')}


# ------------------------------------------------------------------------------------------------------------------------------------------
# Next few lines will create array from new list of files with full path info and then copy each file to destination. 
# ------------------------------------------------------------------------------------------------------------------------------------------
Write-Host "* Search and Print Finished." -foregroundcolor yellow -backgroundcolor DarkCyan
Write-Host "                            **Script Finished.**                       " -foregroundcolor yellow -backgroundcolor DarkCyan
# ------------------------------------------------------------------------------------------------------------------------------------------
# End
# ------------------------------------------------------------------------------------------------------------------------------------------

