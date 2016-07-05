#!/bin/bash

#无密码访问karaf ssh并执行命令的模板
karafssh_template="ssh -i ~/.ssh/karaf.id_rsa -p 8101 karaf@192.168.189.130 "
karafssh_ret=""

function funcKarafSSH()
{
	if [ $# -ne 1 ];then
		karafssh_ret="error param:must input one param."
		return 1	#参数数量不对，返回1表示错误
	fi
	karafssh_ret=$(${karafssh_template} $1)	#$()与``作用相同，但更直观
}

echo " \n exec test1\n "
funcKarafSSH "bundle:list"

echo " \n exec test2 \n"
funcKarafSSH 1 2


echo ${karafssh_ret}
