#!/bin/bash -x

checkRandom=$((RANDOM%2))
if [ $checkRandom -eq 0 ]
then
	echo head
else
	echo tail
fi
