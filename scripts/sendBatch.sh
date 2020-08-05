#!/bin/bash

input="<X.csv>"
while IFS=',' read -r f1 f2 f3 f4 f5
do
        echo "$f1 $f2 $f3 $f4 $f5"
done < "$input"

