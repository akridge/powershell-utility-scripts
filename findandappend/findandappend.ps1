# ------------------------------------------------------------------------------------------------------------------------------------------
# Name:               Find and Append 
# Author:             Michael W. Akridge
# Last Update:        01-17-2020
# Version:            1.0
# ------------------------------------------------------------------------------------------------------------------------------------------


# ------------------------------------------------------------------------------------------------------------------------------------------
# Simple Intro. Output Lines
# ------------------------------------------------------------------------------------------------------------------------------------------
Write-Host "                    ****Find and Append Script v. 1.0****                " -foregroundcolor yellow -backgroundcolor DarkCyan
Write-Host "                      **Created by Michael Akridge**                   " -foregroundcolor yellow -backgroundcolor DarkCyan
Write-Host "                                                                      " -foregroundcolor yellow -backgroundcolor DarkCyan
Write-Host "* Starting Search Now...                                               " -foregroundcolor yellow -backgroundcolor DarkCyan
Write-Host "Current Search Directory: $SearchDir" -foregroundcolor yellow -backgroundcolor DarkCyan


# ------------------------------------------------------------------------------------------------------------------------------------------
# Runs on current directory. Append file names.
# ------------------------------------------------------------------------------------------------------------------------------------------


Get-ChildItem -Path '.\*' -File |Where-Object {$_.Extension -ne '.txt'} |ForEach-Object {
    [System.IO.File]::WriteAllText($_.BaseName + ".txt", $_.FullName)
}


# ------------------------------------------------------------------------------------------------------------------------------------------
# Simple Outro. Output Lines
# ------------------------------------------------------------------------------------------------------------------------------------------
Write-Host "* Search and Append Script Finished." -foregroundcolor yellow -backgroundcolor DarkCyan

# ------------------------------------------------------------------------------------------------------------------------------------------
# End
# ------------------------------------------------------------------------------------------------------------------------------------------
