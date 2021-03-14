# Awesome-one-click-shell

:rainbow: The set of awesome one click shell

## vim

- Note

1. The user executing the shell script must be normal users have root permission
2. Support:`Ubuntu`
3. You can use it to compile and install newest version vim on `Ubuntu`,and also you can package a deb file for your own vim!

- How to use

``` shell

apt install wget -y
wget https://raw.githubusercontent.com/TyrantLucifer/Awesome-one-click-shell/master/vim/vim.sh
chmod +x vim.sh
./vim.sh

```

## MTProxy

- Note

1. Before use,You should open the port you want to set or turn off the firewall and the user executing the shell script must be root.
2. Support:`Centos` `Ubuntu`
3. You can use it to build MTProxy Service and setting the service auto start
4. Start service:`systemctl start MTProxy`
5. Stop service:`systemctl stop MTProxy`

- How to use

1. if you use `Centos`

```
yum install wget -y
wget https://raw.githubusercontent.com/TyrantLucifer/Awesome-one-click-shell/master/MTProxy/MTProxy.sh
chmod +x MTProxy.sh
./MTProxy.sh
```

2. if you use `Ubuntu`

```
apt install wget -y
wget https://raw.githubusercontent.com/TyrantLucifer/Awesome-one-click-shell/master/MTProxy/MTProxy.sh
chmod +x MTProxy.sh
./MTProxy.sh
```

## Brook

- Note

1. Before use,You should open the port you want to set or turn off the firewall and the user executing the shell script must be `root`
2. Support:`Ubuntu` `Centos`
3. You can use it to build Brook service

- How to use

1. if you use `Ubuntu`

```
apt-get install wget -y
wget http://raw.githubusercontent.com/TyrantLucifer/Awesome-one-click-shell/master/brook/brook.sh
chmod +x brook.sh
./brook.sh
```

2. if you use `Centos`

```
yum install wget -y
wget http://raw.githubusercontent.com/TyrantLucifer/Awesome-one-click-shell/master/brook/brook.sh
chmod +x brook.sh
./brook.sh
```

## Record_bash_history

- Note

1. You can use it to record the bash history for all users.
2. Support: All platform of Linux

- How to use

Edit the /etc/profile, add the `source path/bash_history.sh` at the end of profile. Enjoy it! Your server will more secure than ever before.

## Config ssh no passwd

- Note

1. You can use it to config current user to other server's user ssh no passwd.
2. Support: All platform of Linux

- How to use

1. Install `expect`

```shell
yum install exepect -y
```

2. Edit host list file

```text
host username passwod

ex: master001 root root
```

3. Execute shell

```shell
sh ssh_nopasswd.sh host_list_file_path
```
