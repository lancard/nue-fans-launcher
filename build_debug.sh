#!/bin/bash

docker run --rm \
	-v $PWD/app:/app \
	lancard/android \
	build_debug
