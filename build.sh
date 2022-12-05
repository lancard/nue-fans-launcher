#!/bin/bash

docker run --rm \
	-v $PWD/app:/app \
	-v $PWD/keystore:/keystore \
	-e KEYSTORE_PASSWORD=$1 \
	lancard/android \
	build
