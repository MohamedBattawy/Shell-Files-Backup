#!/bin/bash
if [ $# -lt 4 ]
then
echo "Need more parameters!"
exit
fi
dir=$1
backup=$2
interval=$3
max=$4
File=directory-info.last
File2=directory-info.new
cd ~ #return to home directory
cd $dir
ls -lr > ~/$File #write list details to file in home directory, ~ means home
while true
do
sleep $interval
cd ~
cd $dir
ls -lr > ~/$File2
cd ~
    if  cmp -s "$File" "$File2" #-s supresses the output
    then
    echo "Same"
    else
    cd ~
    cd $2
    echo "Not Same"
    d=$(date +%Y-%m-%d-%H:%M:%S) #formatting the date
    backup=$2/$d #concatenate the directory and add "/" for the date directory
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
done
