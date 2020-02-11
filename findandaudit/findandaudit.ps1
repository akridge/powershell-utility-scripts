# ------------------------------------------------------------------------------------------------------------------------------------------
# Name:               Find and Audit 
# Author:             Michael W. Akridge
# Last Update:        12-18-2019
# Version:            1.0
# ------------------------------------------------------------------------------------------------------------------------------------------

# ------------------------------------------------------------------------------------------------------------------------------------------
# Function to get folder size
# ------------------------------------------------------------------------------------------------------------------------------------------
function Get-Size ($folder = $null)
{
    #Function to get recursive folder size
    $result = @()
    $folderResult = "" | Select-Object FolderPath, FolderName, LastWriteTime, SizeKB, SizeMB, SizeGB, SizeTB, OverThreshold

    $contents  = Get-ChildItem $folder.FullName -recurse -force -erroraction SilentlyContinue -Include * | Where-Object {$_.psiscontainer -eq $false} | Measure-Object -Property length -sum | Select-Object sum
    $sizeKB = [math]::Round($contents.sum / 1000,3)   #.ToString("#.##")
    $sizeMB = [math]::Round($contents.sum / 1000000,3)   #.ToString("#.##")
    $sizeGB = [math]::Round($contents.sum / 1000000000,3)   #.ToString("#.###")
    $sizeTB = [math]::Round($contents.sum / 1000000000000,3)   #.ToString("#.###")

    $folderResult.FolderPath = $folder.FullName
    $folderResult.FolderName = $folder.BaseName
    $folderResult.LastWriteTime = $folder.LastWriteTime
    $folderResult.SizeKB = $sizeKB 
    $folderresult.SizeMB = $sizeMB 
    $folderresult.SizeGB = $sizeGB 
    $folderresult.SizeTB = $sizeTB 
    $result += $folderresult
    return $result

} 


# ------------------------------------------------------------------------------------------------------------------------------------------
# User Config Below. 
# ------------------------------------------------------------------------------------------------------------------------------------------

#Set the output CSV directory
$timestamp = Get-Date -Format "MM-dd-yyyy-HH-mm-ss"
$output = "DRIVE_LETTER:\findandaudit\reports\${Env:ComputerName}_folder_size_report_$timestamp.csv"

# Set your root search directory
$SearchDir =  "\\computer_path\folder\folder"

# ------------------------------------------------------------------------------------------------------------------------------------------
# Simple Intro. Output Lines
# ------------------------------------------------------------------------------------------------------------------------------------------
Write-Host "                    ****Find and Audit Script v. 1.0****                " -foregroundcolor yellow -backgroundcolor DarkCyan
Write-Host "                      **Created by Michael Akridge**                   " -foregroundcolor yellow -backgroundcolor DarkCyan
Write-Host "                                                                      " -foregroundcolor yellow -backgroundcolor DarkCyan
Write-Host "* Starting Search Now...                                               " -foregroundcolor yellow -backgroundcolor DarkCyan
Write-Host "Current Search Directory: $SearchDir" -foregroundcolor yellow -backgroundcolor DarkCyan



# ------------------------------------------------------------------------------------------------------------------------------------------
# Run folder size function and output to CSV
# ------------------------------------------------------------------------------------------------------------------------------------------

# Get child folders in root search directory 
$topDir = Get-ChildItem -directory $SearchDir

foreach ($folderPath in $topDir) {
Get-Size $folderPath | Select-Object FolderPath, FolderName, SizeTB, SizeGB, SizeMB, SizeKB, LastWriteTime | export-csv -notypeinformation -path $output  -Append | % {$_.Replace('"','')} 
echo $folderPath
}  




# ------------------------------------------------------------------------------------------------------------------------------------------
# Simple Outro. Output Lines
# ------------------------------------------------------------------------------------------------------------------------------------------
Write-Host "* Search and Audit Script Finished." -foregroundcolor yellow -backgroundcolor DarkCyan
Write-Host " **Output Located Here: $output**                       " -foregroundcolor yellow -backgroundcolor DarkCyan
# ------------------------------------------------------------------------------------------------------------------------------------------
# End
# ------------------------------------------------------------------------------------------------------------------------------------------
