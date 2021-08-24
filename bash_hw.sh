#!/bin/bash

task1() {
	read -p "Type any form of your surname in Ukrainian: " local surname

	if   [ "$surname" =~ ^Вознюк ]; then
		echo "Yes! Surname $surname fits the rule"
	else echo "No! Surname $surname does not fit the rule. This surname has only one form"
	fi
}

task2() {
	read -p "Type any form of your name: " local name

	if [ "$name" =~ '^К[ае][тс](юшк?|ечк|юн|юл|еньк|юньк|к)?(е|а)?р?(ун|е?а?ин|еч|ін|ус)?(юшк?|чк|очк|юн|юл|еньк|уньк|оньк|к|ьк)?[ая]?$' ]; then
		echo "Yes! Name $surname is a form of name Kateryna"
	else echo "No! Name $surname is not a form of name Kateryna"
	fi
}

task3() {
	read -p "Type any phone number of Ukraine: " local number
	reg032 = 
	if [[ "$number" =~ ([+]3[ -]?8[ -]?)?0[ -]?3[ -]?2[ -]?[0-9][ -]?[0-9][ -]?[0-9][ -]?[0-9][ -]?[0-9][ -]?[0-9][ -]?[0-9]$ ]]; then
		echo "032 is a phone code of Lviv and Lviv region"
	elif [[ "$number" =~ "^([+]3[ ()-]?8[ ()-]?)?0[ ()-]?3[ ()-]?3[ ()-]?[0-9][ ()-]?[0-9][ ()-]?[0-9][ ()-]?[0-9][ ()-]?[0-9][ ()-]?[0-9][ ()-]?[0-9]$" ]]; then
		echo "033 is a phone code of Luts`k and Volyn region"
	elif [[ "$number" =~ "^([+]3[ ()-]?8[ ()-]?)?0[ ()-]?3[ ()-]?4[ ()-]?[0-9][ ()-]?[0-9][ ()-]?[0-9][ ()-]?[0-9][ ()-]?[0-9][ ()-]?[0-9][ ()-]?[0-9]$" ]]; then
		echo "034 is a phone code of Ivano-Frankivs`k and Ivano-Frankivs`k region"
	elif [[ "$number" =~ "^([+]3[ ()-]?8[ ()-]?)?0[ ()-]?3[ ()-]?5[ ()-]?[0-9][ ()-]?[0-9][ ()-]?[0-9][ ()-]?[0-9][ ()-]?[0-9][ ()-]?[0-9][ ()-]?[0-9]$" ]]; then
		echo "035 is a phone code of Ternopil and Ternopil region"
	elif [[ "$number" =~ "^([+]3[ ()-]?8[ ()-]?)?0[ ()-]?3[ ()-]?6[ ()-]?[0-9][ ()-]?[0-9][ ()-]?[0-9][ ()-]?[0-9][ ()-]?[0-9][ ()-]?[0-9][ ()-]?[0-9]$" ]]; then
		echo "036 is a phone code of Rivne and Rivne region"
	elif [[ "$number" =~ "^([+]3[ ()-]?8[ ()-]?)?0[ ()-]?3[ ()-]?7[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d$" ]]; then
		echo "037 is a phone code of Chernivtsi and Chernivtsi region"
	elif [[ "$number" =~ "^([+]3[ ()-]?8[ ()-]?)?0[ ()-]?3[ ()-]?8[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d$" ]]; then
		echo "038 is a phone code of Khmelnytskyi and Khmelnytskyi region"
	elif [[ "$number" =~ "^([+]3[ ()-]?8[ ()-]?)?0[ ()-]?4[ ()-]?1[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d$" ]]; then
		echo "041 is a phone code of Zhytomyr and Zhytomyr region"
	elif [[ "$number" =~ "^([+]3[ ()-]?8[ ()-]?)?0[ ()-]?4[ ()-]?3[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d$" ]]; then
		echo "043 is a phone code of Vinnytsya and Vinnytsya region"
	elif [[ "$number" =~ "^([+]3[ ()-]?8[ ()-]?)?0[ ()-]?4[ ()-]?4[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d$" ]]; then
		echo "044 is a phone code of Kyiv and Kyiv region"
	elif [[ "$number" =~ "^([+]3[ ()-]?8[ ()-]?)?0[ ()-]?4[ ()-]?5[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d$" ]]; then
		echo "045 is a phone code of Kyiv region"
	elif [[ "$number" =~ "^([+]3[ ()-]?8[ ()-]?)?0[ ()-]?4[ ()-]?6[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d$" ]]; then
		echo "046 is a phone code of Chernihiv and Chernihiv region"
	elif [[ "$number" =~ "^([+]3[ ()-]?8[ ()-]?)?0[ ()-]?4[ ()-]?7[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d$" ]]; then
		echo "047 is a phone code of Cherkasy and Cherkasy region"
	elif [[ "$number" =~ "^([+]3[ ()-]?8[ ()-]?)?0[ ()-]?4[ ()-]?8[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d$" ]]; then
		echo "048 is a phone code of Odesa and Odesa region"
	elif [[ "$number" =~ "^([+]3[ ()-]?8[ ()-]?)?0[ ()-]?5[ ()-]?1[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d$" ]]; then
		echo "051 is a phone code of Mykolaiv and Mykolaiv region"
	elif [[ "$number" =~ "^([+]3[ ()-]?8[ ()-]?)?0[ ()-]?5[ ()-]?2[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d$" ]]; then
		echo "052 is a phone code of Kropyvnyts`kyi and Kirovograd region"
	elif [[ "$number" =~ "^([+]3[ ()-]?8[ ()-]?)?0[ ()-]?5[ ()-]?3[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d$" ]]; then
		echo "053 is a phone code of Poltava and Poltava region"
	elif [[ "$number" =~ "^([+]3[ ()-]?8[ ()-]?)?0[ ()-]?5[ ()-]?4[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d$" ]]; then
		echo "054 is a phone code of Sumy and Sumy region"
	elif [[ "$number" =~ "^([+]3[ ()-]?8[ ()-]?)?0[ ()-]?5[ ()-]?6[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d$" ]]; then
		echo "056 is a phone code of Dnipro and Sicheslav region"
	elif [[ "$number" =~ "^([+]3[ ()-]?8[ ()-]?)?0[ ()-]?5[ ()-]?7[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d$" ]]; then
		echo "057 is a phone code of Kharkiv and Kharkiv region"
	elif [[ "$number" =~ "^([+]3[ ()-]?8[ ()-]?)?0[ ()-]?6[ ()-]?1[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d$" ]]; then
		echo "061 is a phone code of Zaporizhzhya and Zaporizhzhya region"
	elif [[ "$number" =~ "^([+]3[ ()-]?8[ ()-]?)?0[ ()-]?6[ ()-]?2[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d[ ()-]?\d$" ]]; then
		echo "062 is a phone code of Donetsk region"
	else
		echo "smth gone wrong :( "
	fi
}

task4() {
	echo "List of system users which have Bash as a regular shell"
	cat /etc/passwd | grep -E 'bash'
}

task5() {
	echo "Strings of file '/etc/group' which start with 'daemon': "
	cat /etc/group | grep -E '^daemon'
}

task6() {
	echo "Strings of file '/etc/group' which do not consist 'daemon': "
	cat /etc/group | grep -v 'daemon'
}

task7() {
	echo "Quantity of subdirectories which have files 'README' except 'README.a_string': "
	sudo ls -R | grep README | grep -v README.a_string
}

task8() {
	echo "List of files which were changed less than 10 hours ago ('grep' used): "
	grep -l -d skip argparse * | find * -mmin -600
	
}

task9() {
	echo "List of previous commands' results: "

	task1
	task2
	task3
	task4
	task5
	task6
	task7
	task8
}


echo "This script consists of 9 parts."
read -p "Type number of part to execute it (or '-' to exit script or 9 to do all): " taskN

while [ $taskN != "-" ]; do
	case $taskN in 
		1) task1;;
		2) task2;;
		3) task3;;
		4) task4;;
		5) task5;;
		6) task6;;
		7) task7;;
		8) task8;;
		9) task9;;
	  	*) echo "Uncorrect command. Try once more. "
	esac

	read -p "Type number of part to execute it (or '-' to exit the script): " taskN
done



echo "Exit command was chosen. Exiting..."
