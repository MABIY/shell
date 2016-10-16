#!/bin/bash
# 请用source centos_7_install_jDK_8.sh 执行
echo "start load jdk8"
curl -L -b "oraclelicense=a" http://download.oracle.com/otn-pub/java/jdk/8u101-b13/jdk-8u101-linux-x64.tar.gz -o jdk-8.tar.gz
echo "untar"
mkdir -p /usr/bin/java/jdk-8u101
tar -zxvf jdk-8.tar.gz  -C /usr/bin/java/jdk-8u101 --strip-components 1
echo 'export JAVA_HOME=/usr/bin/java/jdk-8u101/' >> /etc/profile
echo 'export PATH=$JAVA_HOME/bin:$PATH' >> /etc/profile
source /etc/profile
java -version
javac -version




