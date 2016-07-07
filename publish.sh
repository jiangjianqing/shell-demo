#！/bin/bash

d=`date "+%Y-%m-%d %H:%M:%S"`
echo "hello world $d"
#sleep 10
d1=`date -d "-1 month" "+%Y-%m-%d"`
echo "the script end at $d1"

sshCmd="ssh -i ./karaf.id_rsa -p 8102 karaf@localhost"

bundlelist=$(ssh -i ./karaf.id_rsa -p 8102 karaf@localhost "bundle:list"|awk 'BEGIN{FS="|"} NR>5{if ($1>200) print $1 }')

for i in ${bundlelist};do
	${sshCmd} "bundle:uninstall $i"
done

sourceDir="${HOME}/jenkins_test_jar/target"
targetDir="${HOME}/develop/apache-karaf-4.0.4/instances/test1/deploy"
rm -rf ${targetDir}/* && echo "rm success" && sleep 5
#最好根据bundle：list的结果是否还包含那些bundle判断一下是否rm成功
echo "ok!"

cp -r ${sourceDir}/* ${targetDir}/
#最好再根据bundle：list的结果看看是否正常初始化


rm -rf ${sourceDir}
