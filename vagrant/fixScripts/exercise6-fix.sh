#!/bin/bash
#add fix to exercise6-fix here
read -p "full file path: " files
read -p "destination server: " destination
read -p "destination path: " path

for file in $files;
do
  eval scp -3 "$file" vagrant@$destination:/$path/
done


echo "Total number of bytes copied ="
eval du -bcl $files | awk 'END { print $1 }'