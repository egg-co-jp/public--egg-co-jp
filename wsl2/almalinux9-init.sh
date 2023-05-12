#!/usr/bin/env bash

# エイリアスを有効にする
shopt -s expand_aliases
source ~/.bash_profile

##########################################################################
echo -e "\n phpstormからgit操作するため git と言語パックをインストール \n"
sudo dnf install -y git glibc-langpack-en

##########################################################################
echo -e "\n Laravel用にエイリアスを登録。 vendor/bin/sail を sail だけで起動できるようにする \n"
if ! command -v sail &> /dev/null; then echo "alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'" >> ~/.bash_profile && source ~/.bash_profile; fi 2> /dev/null
source ~/.bash_profile

##########################################################################
echo -e "\n WSL と Windows 連携を便利にする wslu を導入 \n"
sudo dnf install -y epel-release 
sudo dnf copr enable -y wslutilities/wslu
sudo dnf install -y wslu

##########################################################################
echo -e "\n Windows側のGit認証情報を利用するように設定する \n";
WINGIT_PATH=$(where.exe git | grep mingw | sed -z 's/\r\n//g' | xargs -0 -I {} wslpath -u "{}")
WINCRED_PATH=$(realpath "$(dirname "$WINGIT_PATH")/../")/libexec/git-core/git-credential-wincred.exe
git config --global credential.helper "$(echo "$WINCRED_PATH" | sed -e 's/ /\\ /g')"
