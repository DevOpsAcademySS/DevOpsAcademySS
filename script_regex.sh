#! /bin/bash


pattern_surname="[Сс]авчук+[иаіуомхв]{0,1}"
echo " First task. Input the surname 'Савчук' in Ukrainian letters, you can use different variations or cases."
read surname
if [[ $surname =~ $pattern_surname ]]; then
    echo "---The entered value '$surname' matches the pattern"
else
    echo "---The entered value '$surname' not matches the pattern"
fi

pattern_name="[Дд](ен|єн)[исаівомхяьчк]{0,1}"
echo " Second task. Input the name 'Денис' in Ukrainian letters, you can use different variations or cases."
read name
if [[ $name =~ $pattern_name ]]; then
    echo "---The entered value '$name' matches the pattern"
else
    echo "---The entered value '$name' not matches the pattern"
fi

echo " Third task. Input the phone number. I have not complied yet."

echo " Fourth task."
grep "bash" /etc/passwd > pas.txt && cut -d: -f1 pas.txt

echo " Fifth task."
grep "daemon" /etc/group

echo " Sixth task."
grep -v daemon /etc/group

echo " Seventh task."
ls -R| grep "^README" |wc -l

echo " Eighth task. I have not complied yet."