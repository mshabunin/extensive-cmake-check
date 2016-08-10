#!/bin/bash

set -e
#set -x

export PATH=/usr/lib/ccache:$PATH

mkdir -p /build

for C in $(ls -v /cmakes)
do
	echo "===== Using cmake $C ====="
	pushd /build
	rm -rf *
	if [[ $C == *"2.8.7"* ]]
	then
		echo "===== Using Makefiles ====="
		/cmakes/$C/bin/cmake ../opencv
		make -j4
	else
		echo "===== Using Ninja ====="
		/cmakes/$C/bin/cmake -GNinja ../opencv
		ninja
	fi
	popd
done
