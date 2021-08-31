#! /bin/bash


pattern_surname="[Сс]авчук+[иаіуомхв]{0,1}"
echo "----First task. Input the surname 'Савчук' in Ukrainian letters, you can use different variations or cases."
read surname
if [[ $surname =~ $pattern_surname ]]; then
    echo "--The entered value '$surname' matches the pattern"
else
    echo "--The entered value '$surname' not matches the pattern"
fi

pattern_name="[Дд](ен|єн)[исаівомхяьчк]{0,1}"
echo "----Second task. Input the name 'Денис' in Ukrainian letters, you can use different variations or cases."
read name
if [[ $name =~ $pattern_name ]]; then
    echo "--The entered value '$name' matches the pattern"
else
    echo "--The entered value '$name' not matches the pattern"
fi

patern_phone_number="[+]?[ ]?[38]?[( \-]?0[( \-]?37[) \-]?2[)]?[ \-]?[0-9][ \-]?[0-9][ \-]?[0-9][ \-]?[0-9][ \-]?[0-9][0-9]"
echo "----Third task. Enter the phone number, with a code of Chernivtsy '0372', you can use different variations: spases, '-', '()'."
read phone_number
if [[ $phone_number =~ $patern_phone_number ]]; 
then
echo "--The entered value '$phone_number' matches the pattern"
else
echo "--The entered value '$phone_number' not matches the pattern"
fi

echo "----Fourth task."
grep "bash" /etc/passwd > pas.txt && cut -d: -f1 pas.txt

echo "----Fifth task."
grep "daemon" /etc/group

echo "----Sixth task."
grep -v daemon /etc/group

echo "----Seventh task."
ls -R| grep "^README" |wc -l

echo "----Eighth task."
find ~ -type f -mmin -600
