##########################################################################
# File Name: vim.sh
# Author: TyrantLucifer
# mail: TyrantLucifer@linuxstudy.cn
# Created Time: Sat 29 Feb 2020 02:08:23 PM CST
##########################################################################

#!/bin/bash

# 获取Linux系统版本
function get_linux_distro()
{
    if grep -Eq "Ubuntu" /etc/*-release; then
        echo "Ubuntu"
    elif grep -Eq "CentOS" /etc/*-release; then
        echo "CentOS"
    else
        echo "Unknow"
    fi
}

# 获取版本库文件目录
function get_python_library_path(){

	distro=`get_linux_distro`
	echo "Linux distro: ${distro}"
	
	if [ ${distro} == "Ubuntu" ]; then
        lib_dir=lib
	elif [ ${distro} == "CentOS" ]; then
		lib_dir=lib64
    else
        echo "Not support linux distro: "${distro}
    fi

    python3_release=`ls /usr/lib | grep python3`

    for python3 in ${python3_release}
    do
        python3_config_dir=`ls /usr/${lib_dir}/${python3} | grep config-`
        if [ ! ${python3_config_dir} ];then
            continue
        else
            break
        fi
    done
}

# 卸载自带的vim
function remove_old_vim_version(){

    sudo apt remove vim vim-runtime gvim -y
    sudo apt remove vim-tiny vim-common vim-gui-common vim-nox -y

}

# 安装对应依赖
function install_prepare_relay(){

    sudo apt install libncurses5-dev libgnome2-dev libgnomeui-dev \
        libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
        libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
        python3-dev ruby-dev lua5.1 liblua5.1-dev libperl-dev git checkinstall -y

}

function compile_vim(){
    # 下载源码包
    git clone https://github.com/vim/vim.git

    # 编译安装
    cd vim
    ./configure --with-features=huge \
        --enable-multibyte \
        --enable-rubyinterp=yes \
        --enable-python3interp=yes \
        --with-python3-config-dir=/usr/${lib_dir}/${python3}/${python3_config_dir} \
        --enable-perlinterp=yes \
        --enable-luainterp=yes \
        --enable-gui=gtk2 \
        --enable-cscope \
        --prefix=/usr/local
    make -j4
    sudo checkinstall
}

function main(){
    get_python_library_path
    # remove_old_vim_version
    # install_prepare_relay
    # compile_vim    
}

main
