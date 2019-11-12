#!/bin/bash -x

declare -A singlet
head=0
tail=0
for(( i=0; i<10; i++ ))
do
	checkRandom=$((RANDOM%2))
	if [ $checkRandom -eq 0 ]
	then
		singlet[H]=$((++head))
	else
		singlet[T]=$((++tail))
	fi
done
echo ${!singlet[@]}
echo ${singlet[@]}
percentageOfHead=$(( $((${singlet[H]} * 100)) / $(( ${singlet[H]} + ${singlet[T]} )) ))
percentageOfTail=$(( $((${singlet[T]} * 100)) / $(( ${singlet[H]} + ${singlet[T]} )) ))
