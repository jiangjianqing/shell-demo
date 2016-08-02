#!/bin/bash

clear

serverSourceDir="${HOME}/project/java/platform3"
clientDistDir="${HOME}/git/js/angular2-demo/dist"
rootDir=$(pwd);
mvnTargetDir="${rootDir}/serverSource"

rm -rf ${mvnTargetDir}
#if [-e ${rootDir/dist}] ; then
#fi
cp -rf ${serverSourceDir} ${mvnTargetDir}
webappDir="${mvnTargetDir}/webui/webui.springdm.springsecurity/src/main/webapp/"
cp -rf ${clientDistDir}/* ${mvnTargetDir}/webui/webui.springdm.springsecurity/src/main/webapp/
cd ${webappDir}
sed -i "4,50d" index.jsp
cat index.html >>index.jsp && rm index.html


cd ${mvnTargetDir}/webui/webui.springdm.springsecurity

mvn clean package 

if [ $? -eq 0 ] ;then
	rm -rf ${rootDir}/dist
	mkdir -p ${rootDir}/dist && cp -rf ./target/*.war "$_"
fi

rm -rf ${mvnTargetDir}
