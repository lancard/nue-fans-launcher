#!/bin/bash

docker run --rm \
	-v $PWD/app:/app \
	-v $PWD/keystore:/keystore \
	-e GITHUB_RUN_NUMBER=$GITHUB_RUN_NUMBER \
	-e KEYSTORE_PASSWORD=$1 \
	lancard/android \
	build
