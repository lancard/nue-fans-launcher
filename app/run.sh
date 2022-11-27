#!/bin/bash

if [ "$1" == "generate_keystore" ]; then
	cd /keystore && \
	keytool -genkey -v -keystore worstrocker.keystore -alias worstrocker -keyalg RSA -keysize 4096 -validity 36500
fi

if [ "$1" == "build" ]; then
	cd /work
	echo "Copying files..."
	cp /app/* /work/ -R
	cp config-template.xml config.xml
	VERSION_STRING=`date +"1.%Y%m%d.1%H%M%S"`
	sed -i "s/\${VERSION_STRING}/$VERSION_STRING/g" config.xml
	echo "Contents of config.xml:"
	cat config.xml
	cordova build --release -- --keystore=/keystore/worstrocker.keystore --storePassword=$KEYSTORE_PASSWORD --alias=worstrocker --password=$KEYSTORE_PASSWORD --packageType=bundle
	cp /work/platforms/android/app/build/outputs/bundle/release/app-release.aab /app
fi

