#!/bin/bash
dir=7206-lab2/Test
backup=7206-lab2/Test2
max=5
File=directory-info.last
File2=directory-info.new
cd ~ #return to home directory
cd $dir
ls -lr > ~/$File #write list details to file in home directory, ~ means home
cd ~
sleep 3540
cd $dir
ls -lr > ~/$File2
cd ~
    if  cmp -s "$File" "$File2" #-s supresses the output
    then
    echo "Same"
    else
    cd ~
    cd $backup
    echo "Not Same"
    d=$(date +%Y-%m-%d-%H:%M:%S) #formatting the date
    backup=backup/$d #concatenate the directory and add "/" for the date directory
    numberfiles=$(find . -mindepth 1 -maxdepth 1 -type d | wc -l) # the . means this current directory, mindepth means don't count this directory
    # maxdepth means go only 1 level inside don't get all subsequent folders inside the folders, wc -l to show the number,type -d means directory only
    if [ $numberfiles -ge $max ]
    then
        cd ~
        cd $2
    oldestfile=$(ls)
    oldestfile=${oldestfile:0:19} #files are sorted alphabetically so take the 1st 20 characters which are the folder name
    rm -r "$oldestfile"
    fi
    cd ~
    cp -r "$dir" "$backup"
    cd ~
    cd $dir
        ls -lr > ~/$File
    fi
