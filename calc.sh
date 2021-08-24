#! /bin/bash

echo "Input two integer numbers through the space:"
echo "Input 'a' if you want to add numbers"
echo "Input 's' if you want to subtract numbers"
echo "Input 'm' if you want to multiply numbers"
echo "Input 'd' if you want to divide numbers"
echo "Input 'e' if you want exit"
read action

case $action in
a)
multiply=$(($1 + $2))
echo "----Result of multiply of numbers is: $multiply"
;;
s)
subtract=$(($1 - $2))
echo "----Result of subtract of numbers is: $subtract"
;;
m)
multiply=$(($1 * $2))
echo "----Result of multiply of numbers is: $multiply"
;;
d)
divide=$(($1 / $2))
echo "----Result of divide of numbers is: $divide"
;;
e)
echo "----Exit from script"
exit 0
;;
*)
echo "----You entered the wrong action"
;;
esac
