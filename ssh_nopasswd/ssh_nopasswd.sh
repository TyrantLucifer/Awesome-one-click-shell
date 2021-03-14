#!/bin/bash

##########################################################################
# File Name: ssh_nopasswd.sh
# Author: TyrantLucifer
# E-mail: TyrantLucifer@gmail.com
# Blog: https://tyrantLucifer.com
# Created Time: Sun 14 Mar 2021 11:30:27 PM CST
##########################################################################

# 判断脚本参数个数
if [ $# != 1 ];then
    echo "usage: $0 ip_file_path"
    exit 1
fi

# 创建本地密钥对
if [ ! -f ~/.ssh/id_rsa ];then
    ssh-keygen -q -t rsa -N '' -f ~/.ssh/id_rsa
fi

# 配置及分发公钥
while read line;do
    host=`echo $line | cut -d " " -f1`
    username=`echo $line | cut -d " " -f2`
    password=`echo $line | cut -d " " -f3`
expect <<EOF
    spawn ssh-copy-id -i $username@$host
    expect {
        "yes/no" { send "yes\n";exp_continue } 
        "password" { send "$password\n" }
    }
    expect eof
EOF
    done < $1
