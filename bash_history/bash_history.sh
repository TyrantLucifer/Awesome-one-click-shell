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
DATE_TIME=`date +"%Y%m%d_%H:%M:%S"`

# 获取当前时间
DATE=`date +"%Y%m%d"`

# 设置历史命令最大记录条数
export HISTSIZE=100000

if [ "$USER_IP" = ""  ]; then
    USER_IP=`hostname`
fi

history

# 设置历史命令记录格式
export HISTTIMEFORMAT="%F %T ${USER}@${USER_IP} "

if [ ! -d ${BASH_HISTORY_DIRECTORY} ]; then
    mkdir ${BASH_HISTORY_DIRECTORY}
    chmod 777 ${BASH_HISTORY_DIRECTORY}
fi

if [ ! -d ${BASH_HISTORY_DIRECTORY}/${LOGNAME}  ]; then
    mkdir ${BASH_HISTORY_DIRECTORY}/${LOGNAME}
    chmod 300 ${BASH_HISTORY_DIRECTORY}/${LOGNAME}
fi

if [ ! -d ${BASH_HISTORY_DIRECTORY}/${LOGNAME}/${DATE}  ]; then
    mkdir ${BASH_HISTORY_DIRECTORY}/${LOGNAME}/${DATE}
    chmod 300 ${BASH_HISTORY_DIRECTORY}/${LOGNAME}/${DATE}
fi

# 初始化日志文件名称
LOGFILE="${BASH_HISTORY_DIRECTORY}/${LOGNAME}/${DATE}/${USER}@${USER_IP}_${DATE_TIME}"
export HISTFILE=${LOGFILE}
chmod 600 ${BASH_HISTORY_DIRECTORY}/${LOGNAME}/${DATE}/*history* 2>/dev/null

