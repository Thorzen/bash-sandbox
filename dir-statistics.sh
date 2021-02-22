#!/bin/bash
declare -A ext_map

for filename in $(ls); do
    extension="${filename##*.}"
    filename="${filename%.*}"
    ((ext_map[${extension}]++))
done

echo "Counts of each file extension: "
for key in ${!ext_map[@]}; do
    printf "%10s %10s\n" ${key} ${ext_map[${key}]}
done