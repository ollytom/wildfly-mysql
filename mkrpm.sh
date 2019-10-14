#!/bin/sh

set -e

version="5.1.47"
module="mysql-connector-java-$version"
curl -sL https://dev.mysql.com/get/Downloads/Connector-J/$module.tar.gz | gunzip | tar x
modulepath="opt/wildfly/modules/system/layers/base/com/mysql/jdbc/main"
mkdir -p $modulepath
cp $module/$module.jar $modulepath
cp module.xml $modulepath
rm -r $module

fpm -s dir -t rpm -n wildfly-mysql -v $version

rm -r opt
