#!/usr/bin/env sh
#
# Mi dai la % di file aperti rispetto al Max

file_aperti=$(lsof | wc -l)

echo "File aperti: "$file_aperti

file_max=$(cat /proc/sys/fs/file-max)

echo "File max: "$file_max

percentuale=$(echo "100-((($file_max-$file_aperti)/$file_max)*100)" | bc)

echo "File aperti in %: "$percentuale
