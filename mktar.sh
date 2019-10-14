#!/bin/sh

set -e

module="mysql-connector-java-5.1.47"
curl -sL https://dev.mysql.com/get/Downloads/Connector-J/$module.tar.gz | gunzip | tar x
mkdir -p com/mysql/jdbc/main
cp $module/$module.jar com/mysql/jdbc/main
cp module.xml com/mysql/jdbc/main
rm -r $module

tar c com | gzip >$module.tar.gz
echo $module.tar.gz
rm -r com
