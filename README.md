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
