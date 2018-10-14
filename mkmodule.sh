#!/bin/sh

set -e

module="mysql-connector-java-5.1.47"
curl -sL https://dev.mysql.com/get/Downloads/Connector-J/$module.tar.gz | gunzip | tar xf /dev/stdin
mkdir -p com/mysql/jdbc/main
cp $module/$module.jar com/mysql/jdbc/main
cp module.xml com/mysql/jdbc/main

tar cvf /dev/stdout com | gzip >$module.tar.gz

rm -r com $module
