############################################ 
############################################ 
######## Find and Move Script Readme #######
########          Version 2.0        #######
############################################ 
############################################ 

This script is simple. Give it a list of files, a directory to search and it will copy them. 


############################################ 
############################################ 
######## Getting Started ###################
############################################ 
############################################  

##Script Config 

#### 1. Enter a list of files into the findandmove\config_files\LIST_OF_FILENAMES.txt

`````````````````````````````````````````````
Example of file list:
`````````````````````````````````````````````
01.JPG
something_02.JPG
some_name_here.JPG

`````````````````````````````````````````````

#### 2. Enter search and/or destination directory in script. 

Add your search directory path here in this text file: 
                            findandmove\config_files\SET_YOUR_SEARCH_DIRECTORY.txt

then add your copy destination directory in this text file: 
               

                            findandcopy\config_files\SET_YOUR_DESTINATION_DIRECTORY.txt

`````````````````````````````````````````````
Example of Search and Destination Directory

`````````````````````````````````````````````
Search directory: 

C:\some_folder


or a local folder like:

move_destination

`````````````````````````````````````````````
############################################ 
############################################ 
######## How to Run Script #################
############################################ 
############################################  

    1. Make sure you list the files you want to search and copy in this file:
        ...\findandmove\config_files\LIST_OF_FILENAMES.txt
    2. double click this file to run it:
        ...\findandmove\findandmove.bat
    3. It will ask you if you want to run;
        type 'R' for run and press enter
    4. Then a progress bar pops up
    5. Once its done it will ask you to "Press any key to continue..."


############################################ 
############################################ 
######## Notes & Logs ######################
############################################ 
############################################  

######## Notes ############

A log of all the file copies change after each run and is found here: ...\log_files\MMddyyyy_hhmm_movelog.txt

######## Build ############

The script is built using powershell. It comes with a .bat file for easy running. 

######## Author ############

Michael Wayne Akridge


######## Change Log ############

2.0
-Changed the script to use a text file with a directiory path instead of having users modify the script directory. 
-new files:
    SET_YOUR_SEARCH_DIRECTORY.txt
    SET_YOUR_SEARCH_DIRECTORY.txt
-Changed filenames file to LIST_OF_FILESNAMES


1.5 
09-28-2017
-added code comments
-added output statements for user
-filenames.txt moved to folder called "config_files"
-copylog.txt is now saved after each run using "MMddyyyy_hhmm_copylog.txt"
-copy log is now moved to folder "log_files"
-fullfilenames.txt moved to "script_files" folder

1.0 
09-27-2017
-Orginal

######## Acknowledgments ############

* "Live long and prosper" - Spock
