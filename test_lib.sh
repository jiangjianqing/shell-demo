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
	ret=$(ip addr)	
}

#ret=`funcSum 1 100`
#ret=$?

#echo ${ret}
