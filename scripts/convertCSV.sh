#!/bin/bash

rm "${1}.txt"

input="${1}.csv"
while IFS=',' read -r dest tokens
do
        echo "$dest $tokens" >> "${1}.txt"
done < "$input"
