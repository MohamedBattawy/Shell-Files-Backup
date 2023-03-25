
# Lab 2 OS

## Bash Script:
- The code checks if there isn't enough arguements and force closes if this is the case otherwise it continues.

- cd ~ is used to go back to home directory as the input expected in the makefile is the absolute path for flexibility to allow easy access to different folders not in the same place.

- ls-lr command is used to extract information of the folder and put in the file directory-info.last with a cd~ before it because we don't want info.last file to be in the same directory as the original folder otherwise we have 1 additional file that wasn't originally there

- After sometime repeat the extraction process but this time to new file directory-info.new (also made on the desktop to prevent 1 additional file being made in the original folder) and compare the 2 files using cmp function

- If there's no change print out "same", otherwise check first the number of backups that have been made so far and if it exceeds the max number of back ups allowed,delete the very 1st backup in this folder as it will always be the oldest (files are sorted alphanumerically in linux) and make the new backup. The file name is always the 1st 20 letters (according to the format we want).

## Makefile
- Make sure the makefile is located in the Home otherwise there will be issues regarding the directory as the expected input is the absolute directory (will work without absolute directory only if all files and folders are in 1 place)

- In makefile each sentence is read as 1 command unlike shell scripting so we need to use ; when we want to say these commands are actually on the same line and use @ to supress the output otherwise we will get the echo message twice on screen,we also need to use double $$ instead of single $ in makefile.

- The makefile checks if the directory doesn't exist and creates one (keep in mind the directory needs to be absolute starting from Home)

- The makefile sends the arguements to the bash script

# ---------Requirements---------
    Linux Operating System 

#HOW TO USE:

1. Press control+alt+t to open the terminal and use "cd" command to change directory to where the makefile is (or skip this part by having the makefile in the Home folder)

1. Type "make"
1. Type the input

1. The program will loop infinitly now and check every interval-secs if the folder has been modified

#CronJob:

- The bash script is the same except that now there is no interval-secs variable and there is no input at all,as this is automated we don't want to ask the user for input every hour instead the values are fixed and the user modifies bash script variables 


- Sleep 3540 means compare the results after 59 minutes (for example at 1:23 run the file, compare the results at time 2:22 and backup if they are changed because at time 2:23 we will start a new process)

- dir in line 2 represents the directory
- backupdir in line 3 represents the backupdirectory

- To make a cron job simply type control+alt+t to open the terminal, type "crontab -e", hold control and press o (if this is your first time using crontab -e choose any number for the editor)

- type 23 * * * * <write directory here if it's not located in desktop>./backup-cron.sh

- 23 here represents minute 23, 1st * means every hour, 2nd * means every day of the month, 3rd * means every month,4th * means every day of the week

- **we can't schedule per seconds in cron jobs minimum is at certain minute*


- The Expression required for tasking the cronjob every 3rd friday of the month is not possible with the cronjob only we will need to modify our script to access the calendar, find dates of friday in this month, get that date,check if today is the 3rd friday of the month, and then run the script (using a simple if statement to check if today's the 3rd friday).

- So the expression will be something like this: 31 12 * * ./modifiedbackup-cron.sh
