#!/bin/bash

funcSum(){
	sum=0
	for i in `seq $1 $2`;do
		sum=$[$sum+$i]
	done	
	echo "${sum}"
	#return 255	#注意：shell函数返回值最大为255，也只能为整数
}

funcGetIP(){
	if [ $# -ne 1 ];then
		echo "must input one param!"
		return 1
	else
		ret=$(ifconfig |egrep "^\s+inet\s+addr:"|sed -r "s/^\s+inet\s+addr://g"|sed -r "s/\s+Bcast:.*$//g")
		echo ${ret}
	fi	
}

#ret=`funcSum 1 100`
#ret=$?

#echo ${ret}

test=$(funcGetIP eth0)
echo "the ip addr is:${test};."
