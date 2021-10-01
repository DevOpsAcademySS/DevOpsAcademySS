list_of_ip=$(grep -o "[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}" ../terraform/inventory.txt)
set -- $list_of_ip
ss="mydbinstance2.cbxkzlsxxhli.eu-west-2.rds.amazonaws.com"
sed -i '/front/s/\/.*:/\/\/'$2':/' src/main/resources/application.properties
sed -i '/:postgresql:/s/\/.*:/\/\/'$ss':/' src/main/resources/application.properties
sed -i '/export c/s/\/.*:/\/\/'$2':/' front-end/src/main.js
sed -i '/p:\/\/r/s/:\/\/r/s:\/\/r/' pom.xml