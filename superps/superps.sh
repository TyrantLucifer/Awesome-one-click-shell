#!/bin/bash

function find_ps {
    ps -ef | grep $@ | grep -v grep | grep -v superps
}

function kill_ps {
    ps -ef | grep $@ | grep -v grep | grep -v superps | awk '{print$2}' | xargs kill -9
}

function port_ps {
    lsof -i :$@
}

function kill_port_ps {
    lsof -i :$@ | awk '{print$2}' | grep -v PID | xargs kill -9
}

case "$1" in
    find)
    find_ps $2
    ;;
    kill)
    kill_ps $2
    ;;
    port)
    port_ps $2
    ;;
    killport)
    kill_port_ps $2
    ;;
    *)
    echo -e "${red}请输入正确的选项[find, kill, port, killport] ${plain}"
    ;;
esac

