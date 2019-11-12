#!/bin/bash -x

declare -A singlet
hh=0
ht=0
th=0
tt=0
numberOfTimesFlipCoin=10
singlet[HH]=$hh
singlet[HT]=$ht
singlet[TH]=$th
singlet[TT]=$tt
for(( i=0; i<$numberOfTimesFlipCoin; i++ ))
do
	checkRandom1=$((RANDOM%2))
	checkRandom=$((RANDOM%2))
	if [ $checkRandom -eq 0 -a $checkRandom1 -eq 0 ]
	then
		singlet[HH]=$((++hh))
	elif [ $checkRandom -eq 0 -a $checkRandom1 -eq 1 ]
	then
		singlet[HT]=$((++ht))
	elif [ $checkRandom -eq 1 -a $checkRandom1 -eq 0 ]
	then
		singlet[TH]=$((++th))
	elif [ $checkRandom -eq 1 -a $checkRandom1 -eq 1 ]
	then
		singlet[TT]=$((++tt))
	fi
done
echo ${!singlet[@]}
echo ${singlet[@]}
total=$(( ${singlet[HH]} + ${singlet[HT]} + ${singlet[TH]} + ${singlet[TT]} ))
percentageOfHeadHead=$(( $((${singlet[HH]} * 100)) / $total ))
percentageOfHeadTail=$(( $((${singlet[HT]} * 100)) / $total ))
percentageOfTailHead=$(( $((${singlet[TH]} * 100)) / $total ))
percentageOfTailTail=$(( $((${singlet[TT]} * 100)) / $total ))
