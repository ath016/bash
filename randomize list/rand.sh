#!/bin/bash

# read in user
while read -r name; do
        user=(${user[@]} ${name})
done < user

# setup url
len=${#user[@]}
url1="https://www.random.org/strings/?num="
url2="&len=2&digits=on&loweralpha=on&unique=on&format=plain"

# print website to order
url=$url1$len$url2
order=(`curl $url 2> /dev/null`)

# echo ${order[@]}

#append trackers to order
i=0
while [ $i -lt $len ]; do
	order[$i]=${order[$i]}$i
	((i++))
done

# echo ${order[@]}

#sort order
IFS=$'\n' read -d '' -r -a order < <(printf '%s\n' "${order[@]}" | sort)

# echo ${order[@]}

# format order
i=0
while [ $i -lt $len ]; do
	order[$i]=${order[$i]:2}	
	((i++))
done

# echo ${order[@]}

# output new user
for i in ${order[@]}; do
	echo ${user[$i]} >> new
done

# format file system
rm user
mv new user
# cat user
