#!/bin/bash

surname_pat="^[Kk]ozak$"
name_pat="^([Mm]ykol|[Kk]oli)a$"
number_pat="^\+?(38)?0 ?3(72|2(34)?) ?\d{3}\-?\d{2}\-?\d{2}$"     #for Lviv(032), Mostyska(03234) and Chernivtsi(0372)
read -p "Enter your surname " surname

if [[ $surname =~ $surname_pat ]]; then
    echo "My surname is $surname"
else
    echo "That is not my surname!"
fi
read -p "Enter your name " name
if [[ $name =~ $name_pat ]]; then
    echo "My name is $name"
else
    echo "That is not my name!"
fi
read -p "Enter your phone number " number
if [[ $number =~ $number_pat ]]; then
    echo "Number is right and it's : $number"
else 
    echo "Wrong number"
fi
read -p "press enter to continue"
echo "users with bash shell \n"
cat /etc/passwd | grep bash | awk -F':' '{ print $1}'

read -p "press enter to continue"
echo "lines from /etc/group which starts with \"daemon\" \n" 
cat /etc/group | grep "^daemon"

read -p "press enter to continue"
echo "lines from /etc/group that do not contain \"daemon\" \n"
cat /etc/group | grep -v "daemon"

read -p "press enter to continue"
echo "how many README files are in subdirectories of current directory (without README.a_string) \n"
ls -R | grep README | awk '!/README.a_string/' |wc -l

read -p "press enter to continue"
echo "files that got changed less than 10 hours ago \n"
grep -l -d skip argparse * | find * -mmin -600