list_of_ip=$(grep -o "[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}" inventory.txt)
set -- $list_of_ip
sed -i '/front/s/\/.*:/\/\/'$2':/' src/main/resources/application.properties
sed -i '/:postgresql:/s/\/.*:/\/\/'$1':/' src/main/resources/application.properties
sed -i '/export c/s/\/.*:/\/\/'$2':/' front-end/src/main.js
sed -i '/p:\/\/r/s/:\/\/r/s:\/\/r/' pom.xml