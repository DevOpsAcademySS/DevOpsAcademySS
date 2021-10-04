db_ip="mydbinstance2.cbxkzlsxxhli.eu-west-2.rds.amazonaws.com"
web_server_ip="grep -o "[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}" ../terraform/inventory.txt"
sed -i '/front/s/\/.*:/\/\/'$web_server_ip':/' src/main/resources/application.properties
sed -i '/:postgresql:/s/\/.*:/\/\/'$db_ip':/' src/main/resources/application.properties
sed -i '/export c/s/\/.*:/\/\/'$web_server_ip':/' front-end/src/main.js
sed -i '/p:\/\/r/s/:\/\/r/s:\/\/r/' pom.xml