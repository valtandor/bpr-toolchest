#!/bin/bash

total=$(wc -l $1)

while read filename
do
	count=$(($count+1))
	{ head -1 "$filename" || file "${filename}" ; }	>/dev/null

	if ! (( $count % 1000 ))
	then
		echo "Finished $count of $total files"
	fi
done < $1
echo "Finished $total files"
