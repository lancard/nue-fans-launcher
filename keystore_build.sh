#!/bin/bash

docker run -it --rm \
	-v $PWD/app:/app \
	-v $PWD/keystore:/keystore \
	lancard/android \
	generate_keystore
