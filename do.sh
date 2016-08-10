#!/bin/bash

set -x
set -e

TAG=cmake-checker
P=/home/maksim

docker build -t $TAG .

docker run --rm -it \
	-v $P/opencv:/opencv \
	-v $P/opencv_contrib:/opencv_contrib \
	-v $P/check-cmake-cache:/cache \
	$TAG
