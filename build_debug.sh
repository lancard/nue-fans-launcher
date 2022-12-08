#!/bin/bash

docker run --rm \
	-v $PWD/app:/app \
	-e GITHUB_RUN_NUMBER=$GITHUB_RUN_NUMBER \
	lancard/android \
	build_debug
