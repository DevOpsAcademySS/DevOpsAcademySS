CentosIP=$1
Ubuntu=$2
sed -i '/front/s/\/.*:/\/\/'$CentosIP':/' src/main/resources/application.properties
sed -i '/:postgresql:/s/\/.*:/\/\/'$Ubuntu':/' src/main/resources/application.properties
sed -i '/export c/s/\/.*:/\/\/'$CentosIP':/' front-end/src/main.js