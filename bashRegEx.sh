#!/bin/bash


#       1 task
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
echo "Task 1"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -

regex1='^\bbalen[a-z]?[a-z]?$'

res=$(echo "$1" | tr '[:upper:]' '[:lower:]')

if  [[ "$res" =~ $regex1 ]]; then
    echo "Success! $1"
else echo "Fail!"
fi

#       2 task (serhii,serhiy,sergii,sergiy,serj,sergo,sergio,seroja)
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
echo "Task 2"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -

regex2='^\bser[hgoj][ioj]?[iyoa]?$'

res=$(echo "$2" | tr '[:upper:]' '[:lower:]')

if  [[ "$res" =~ $regex2 ]]; then
    echo "Success! $2"
else echo "Fail!"
fi

#       3 task  
#   51 — Николаевская область
#	52 — Кировоградская область
#	53 — Полтавская область
#	54 — Сумская область
#	55 — Херсонская область
#	56 — Днепропетровская область
#   57 — Харьковская область
#	61 — Запорожская область
#   62 — Донецкая область
#   64 — Луганская область
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
echo "Task 3"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -

regex3='^([5][1-7])|([6][124])([0-9]{7})$'

if  [[ "$3" =~ $regex3 ]]; then
    echo "Success! $3"
else echo "Fail!"
fi

#       4 task
#       Покажіть на екрані список усіх користувачів системи, у яких Bash звичайною оболонкою.
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
echo "Task 4"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -

cat ~/../../etc/passwd | grep -E 'bash'

#       5 task
#       Покажіть усі рядки з файлу /etc/group, що починаються послідовністю символів «daemon»
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
echo "Task 5"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -

cat ~/../../etc/group | grep '^daemon'

#       6 task
#       Покажіть усі рядки з того ж файлу, що не містять її.
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
echo "Task 6"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -

cat ~/../../etc/group | grep -v '^daemon'

#       7 task
#       Яку кількість файлів README містять ці підкаталоги, не враховуючи файли вигляду «README.a_string»?
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
echo "Task 7"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -

ls ~/../../etc | grep -c '^README' | grep -v '^README\..*'
#ls PycharmProjects/pythonProject  | grep '^README' | grep -v '^README\..*'
#       8 task
#       За допомогою grep покажіть список файлів (не враховуючи каталоги) у вашому домашньому каталозі, що змінювалися менше, ніж 10 годин тому?
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
echo "Task 8"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -

grep -l -d skip argparse * | find * -mmin -600
#ls | grep -mtime 1


