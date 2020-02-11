# ------------------------------------------------------------------------------------------------------------------------------------------
# Name:               Find and Copy 
# Author:             Michael W. Akridge
# Last Update:        09/28/2017
# Version:            2.0
# ------------------------------------------------------------------------------------------------------------------------------------------
# User Config Below. Manual or via .txt files
# ------------------------------------------------------------------------------------------------------------------------------------------
# Set your search directory
$searchdir =  Get-Content config_files\SET_YOUR_SEARCH_DIRECTORY.txt

# Set your destination directory
$destdir = Get-Content config_files\SET_YOUR_DESTINATION_DIRECTORY.txt
# ------------------------------------------------------------------------------------------------------------------------------------------
# Stop. Do not change anything below unless you know what you are doing.
# ------------------------------------------------------------------------------------------------------------------------------------------
#Simple Intro. Lines
Write-Host "                    ****Find and Copy Script v. 2.0****                " -foregroundcolor yellow -backgroundcolor DarkCyan
Write-Host "                      **Created by Michael Akridge**                   " -foregroundcolor yellow -backgroundcolor DarkCyan
Write-Host "                                                                       " -foregroundcolor yellow -backgroundcolor DarkCyan
Write-Host "* Starting Search Now...                                               " -foregroundcolor yellow -backgroundcolor DarkCyan
Write-Host "Current Search Directory: $searchdir" -foregroundcolor yellow -backgroundcolor DarkCyan

# Create empty file to contain the full path info for each file
echo $null > script_files\fullfilenames.txt

# Create array from your list of filenames
$filenames = Get-Content config_files\LIST_OF_FILENAMES.txt
#foreach ($file in $filenames) {
#Write-Host "* Searching for: $file" -foregroundcolor yellow -backgroundcolor DarkCyan
#}
# For each file in array of filenames get fullpath and assign var $fullname
foreach ($file in $filenames) {
     # The next three lines setups up a simple progress bar using the length of the filename list vs fullfilename list. 
     Write-Host "* Searching for: $file" -foregroundcolor yellow -backgroundcolor DarkCyan
     # finds full path of files
     $fullname = Get-ChildItem $searchdir –Recurse | Where-Object {$_.PSIsContainer -eq $False -and ($_.Name) -like $file} | ForEach-Object {$_.FullName}
     # Adds full path of files to fullfilenames.txt 
     echo $fullname >> script_files\fullfilenames.txt
     # Next two lines for troubleshooting. Can be commented out 
     echo "Found: $file"
     # Write-Host "Location:" $fullname
     
     #Progress Bar of Search
     $i++
     $intSize = $intSize + $file.Length
     Write-Progress -activity "Searching Files" -status "Search Progress: " -PercentComplete (($i / $filenames.length)  * 100)
}
# ------------------------------------------------------------------------------------------------------------------------------------------
# Next few lines will create array from new list of files with full path info and then copy each file to destination. 
# ------------------------------------------------------------------------------------------------------------------------------------------
Write-Host "* Starting Copy Now...                                               " -foregroundcolor yellow -backgroundcolor DarkCyan
Write-Host "Current Copy Directory: $destdir" -foregroundcolor yellow -backgroundcolor DarkCyan
# retrieves fullfilenames.txt. list
$filenames = Get-Content script_files\fullfilenames.txt

# Create array from new list of files with full path info 
foreach ( $file in $filenames ) {
Write-Host "* Copying..." -foregroundcolor yellow -backgroundcolor DarkCyan

    #copies each file to destination. 
    Copy-Item $file $destdir
    
    # Logs success/fail of each move 
    echo "$(Get-Date -f o) $? $file" >> "log_files\ $(get-date -f MMddyyyy_hhmm)_copylog.txt"
}
Write-Host "* Copy Finished." -foregroundcolor yellow -backgroundcolor DarkCyan
Write-Host "                            **Script Finished.**                       " -foregroundcolor yellow -backgroundcolor DarkCyan
# ------------------------------------------------------------------------------------------------------------------------------------------
# End
# ------------------------------------------------------------------------------------------------------------------------------------------