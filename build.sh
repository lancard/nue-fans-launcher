#!/bin/bash

read -s -p "Password: " password
echo ""

docker run --rm \
	-v $PWD/app:/app \
	-v $PWD/keystore:/keystore \
	-e KEYSTORE_PASSWORD=$password \
	lancard/android \
	build
