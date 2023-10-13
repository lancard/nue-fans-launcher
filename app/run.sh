#!/bin/bash

if [ "$1" == "generate_keystore" ]; then
	cd /keystore && \
	keytool -genkey -v -keystore worstrocker.keystore -alias worstrocker -keyalg RSA -keysize 4096 -validity 36500
fi

if [ "$1" == "build" ]; then
	cd /
	cordova telemetry off
	cordova create work com.github.lancard.nue_fans_launcher
	cd /work
	cordova plugin add cordova-plugin-file
	cordova plugin add https://github.com/bikubi/cordova-plugin-zip.git cordova-plugin-zip
	cordova plugin add https://github.com/fabiorogeriosj/cordova-plugin-sensors.git cordova-plugin-geolocation
	cordova plugin add https://github.com/lancard/cordova-plugin-background-download.git cordova-plugin-background-download
	cordova platform add android@12.0.1
	cordova build
	echo "Copying files..."
	wget -O /work/www/index.html https://raw.githubusercontent.com/lancard/nue-fans/master/root/index.html
	cp /app/* /work/ -R
	cp config-template.xml config.xml
	VERSION_STRING=`date +"1.%Y%m%d.1%H%M%S"`
	sed -i "s/\${VERSION_STRING}/$VERSION_STRING/g" config.xml
	sed -i "s/\${VERSION_CODE}/$GITHUB_RUN_NUMBER/g" config.xml
	echo "Contents of config.xml:"
	cat config.xml
	cordova build --release -- --keystore=/keystore/worstrocker.keystore --storePassword=$KEYSTORE_PASSWORD --alias=worstrocker --password=$KEYSTORE_PASSWORD --packageType=bundle
	cp /work/platforms/android/app/build/outputs/bundle/release/app-release.aab /app
fi

if [ "$1" == "build_debug" ]; then
	cd /
	cordova telemetry off
	cordova create work com.github.lancard.nue_fans_launcher
	cd /work
	cordova plugin add cordova-plugin-file
	cordova plugin add https://github.com/bikubi/cordova-plugin-zip.git cordova-plugin-zip
	cordova plugin add https://github.com/fabiorogeriosj/cordova-plugin-sensors.git cordova-plugin-geolocation
	cordova plugin add https://github.com/lancard/cordova-plugin-background-download.git cordova-plugin-background-download
	cordova platform add android@12.0.1
	cordova build
	echo "Copying files..."
	wget -O /work/www/index.html https://raw.githubusercontent.com/lancard/nue-fans/master/root/index.html
	cp /app/* /work/ -R
	cp config-template.xml config.xml
	VERSION_STRING=`date +"1.%Y%m%d.1%H%M%S"`
	sed -i "s/\${VERSION_STRING}/$VERSION_STRING/g" config.xml
	sed -i "s/\${VERSION_CODE}/$GITHUB_RUN_NUMBER/g" config.xml
	echo "Contents of config.xml:"
	cat config.xml
	cordova build
	cp /work/platforms/android/app/build/outputs/apk/debug/app-debug.apk /app
fi
