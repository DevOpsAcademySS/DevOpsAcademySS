#! /bin/bash

read surname

if [[ "$surname" =~ ^[sS]hahub$ ]]; then
	echo "Surname is $surname"
else
	echo "Error"
fi

read name

if [[ "$name" =~ ^[sS]amir$ ]]; then
	echo "Name is $name"
else
	echo "Error"
fi

read num
if [[ "$num" =~ ^(\+8?3\s?)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$ && ${#num} =~ 12 ]]; then
	echo "Number is $num"
else
	echo "Error"
fi

cat /etc/passwd | grep -E "bash"
cat /etc/group | grep -E "^daemon"
cat /etc/group | grep -v "^daemon"
sudo ls -R | grep README | grep -v README.a_string | wc -l
grep -l -d skip argparse * | find * -mmin -600

