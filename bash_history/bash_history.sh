#!/bin/bash

##########################################################################
# File Name: bash_history.sh
# Author: TyrantLucifer
# mail: TyrantLucifer@linuxstudy.cn
# Created Time: Mon 31 Aug 2020 11:03:53 AM CST
##########################################################################

# 获取当前登录用户名
USER=`whoami`

# 获取当前登录IP
USER_IP=`who -u am i 2>/dev/null| awk '{print $NF}'|sed -e 's/[()]//g'`

# 设置日志缓存目录
BASH_HISTORY_DIRECTORY=/var/log/history

# 获取当前时间日期
DATA_TIME=`date +"%Y%m%d_%H:%M:%S"`

history

if [ "$USER_IP" = ""  ]; then
    USER_IP=`hostname`
fi

if [ ! -d ${BASH_HISTORY_DIRECTORY} ]; then
    mkdir ${BASH_HISTORY_DIRECTORY}
    chmod 777 ${BASH_HISTORY_DIRECTORY}
fi

if [ ! -d ${BASH_HISTORY_DIRECTORY}/${LOGNAME}  ]; then
    mkdir ${BASH_HISTORY_DIRECTORY}/${LOGNAME}
    chmod 300 ${BASH_HISTORY_DIRECTORY}/${LOGNAME}
fi

export HISTSIZE=100000
LOGFILE="${BASH_HISTORY_DIRECTORY}/${LOGNAME}/${USER}@${USER_IP}_${DATA_TIME}"
export HISTFILE=${LOGFILE}
chmod 600 ${BASH_HISTORY_DIRECTORY}/${LOGNAME}/*history* 2>/dev/null

