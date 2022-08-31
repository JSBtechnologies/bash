#!/bin/bash

Files=$(ls);
i=1 
for file in $Files
do
	
	create_date=$(mdls "$file" | grep 'kMDItemContentCreationDate ' | awk '{print $3}' )
	mv "$file" "$create_date#$i.JPEG"
	((i=i+1))
done