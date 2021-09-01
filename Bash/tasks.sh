#!/bin/bash

# Записати найкоротші регулярні вирази, які будуть відповідати:

# 1) усім формам вашого прізвища; 
task1(){
    echo "Enter the last name:"
    read name
    local regexp="Aksynti Voronk[ay]"
    if [[ $name =~  $regexp ]];
    then
        echo "Matched" ; 
    else 
        echo "Not matched"; 
    fi
}

# 2) усім формам вашого імені (можна врахувати і зменшувальні або інші варіанти); 
task2(){
    echo "Enter the first name:"
    read name
    local regexp="(Andre Filip[ea(om)])|(Andriy)|(Andrew)"
    if [[ $name =~  $regexp ]];
    then
        echo "Matched" ; 
    else 
        echo "Not matched"; 
    fi
}

# 3) усім телефонним кодам обласних центрів та інших великих міст тієї частини України, де живуть ваші батьки (Північ, Південь, Схід, Захід, Центр – поділ приблизний, можна подивитися у прогнозах погоди), – або аналогу такої інформації для вашої країни; 
task3(){
    echo "Enter the phone number:"
    read name
    local regexp="^\+?\(?(38)?[0]\)?\-? ?\(?[3-6][0-9]\-?\)? ?[0-9][0-9][0-9] ?[0-9][0-9] ?[0-9][0-9]"
    if [[ $name =~  $regexp ]];
    then
        echo "Matched" ; 
    else 
        echo "Not matched"; 
    fi
}

# 4) Покажіть на екрані список усіх користувачів системи, у яких Bash звичайною оболонкою.
task4(){
    local regexp=".*bash$" #"^(.*):(.*):([1-6][0-9]{3}):([\d]{4})::?.*(bash)$"
    getent passwd | grep -e"$regexp"
}

# 5) Покажіть усі рядки з файлу /etc/group, що починаються послідовністю символів «daemon».
task5(){
    local regexp="^daemon.*"
    cat etc/group | grep -e"$regexp"
}

# 6) Покажіть усі рядки з того ж файлу, що не містять її.
task6(){
    local regexp="^((?!daemon).)*$" # "^[^d][^a][^e][^m][^o][^n].*"
    cat etc/group | grep -e"$regexp"
}

# 7) Яку кількість файлів README містять ці підкаталоги, не враховуючи файли вигляду «README.a_string»?
task7(){
    ls -l | grep -e"^README[.][^a]" | wc -l
}

# 8) За допомогою grep | awk | sed | find покажіть список файлів (не враховуючи каталоги) у вашому домашньому каталозі, що змінювалися менше, ніж 10 годин тому?
task8(){
    find -mmin -600
}

# 9) Помістіть усі ці команди у файл сценарію, що буде видавати повний вивід.
task9(){
    task1
    task2
    task3
    task4
    task5
    task6
    task7
    task8
    make_disicion
}

make_disicion(){
    printf "\n\tRUN OTHER TASK?[yes:no]:\n"
    read decision
}

decision="yes"
while [ "$decision" = "yes" ]
do
    printf "\nChoose the number of task [1-9]:\n"
    read tasknumber
    case $tasknumber in
    1)  task1
        make_disicion
    ;;
    2)  task2
        make_disicion
    ;;
    3)  task3
        make_disicion
    ;;
    4)  task4
        make_disicion
    ;;
    5)  task5
        make_disicion
    ;;
    2)  task2
        make_disicion
    ;;
    6)  task6
        make_disicion
    ;;
    7)  task7
        make_disicion
    ;;
    8)  task8
        make_disicion
    ;;
    9)  task9
        make_disicion
    ;;
    *)  echo "Entered wrong nummber (enter number beetwean 1-9)"
        make_disicion
    esac
done

exit 0
