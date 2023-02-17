#!/usr/bin/env bash

# phpstormからgit操作するため git と言語パックが必要
sudo dnf install -y git glibc-langpack-en

# Laravel用にエイリアスを登録。 vendor/bin/sail を sail だけで起動できるようにする
if [ -z "$(which sail)" ]; then echo "alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'" >> ~/.bash_profile && source ~/.bash_profile; fi 2> /dev/null
source ~/.bash_profile


# WSL と Windows 連携を便利にする wslu を導入
sudo dnf install -y epel-release 
sudo dnf config-manager --set-enabled PowerTools
sudo yum-config-manager --add-repo https://download.opensuse.org/repositories/home:/wslutilities/CentOS_8/home:wslutilities.repo
sudo dnf install -y wslu
