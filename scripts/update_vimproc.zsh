#!/bin/zsh

UNAME=$(uname)
TARGET=""
if [ $UNAME = 'Linux' ]
	TARGET="make_unix.mak"
elif [ $UNAME = 'Darwin' ]
	TARGET="make_mac.mak"
fi


