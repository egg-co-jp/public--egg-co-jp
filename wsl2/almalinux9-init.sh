#!/usr/bin/env bash

# エイリアスを有効にする
shopt -s expand_aliases
source ~/.bash_profile

##########################################################################
echo -e "\n phpstormからgit操作するため git インストールと、追加で言語パックが必要そうなのでインストール \n"
sudo dnf install -y git git-lfs glibc-langpack-en

##########################################################################
echo -e "\n Laravel用にエイリアスを登録。 vendor/bin/sail を sail だけで起動できるようにする \n"
if ! command -v sail &> /dev/null; then 
  echo "alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'" >> ~/.bash_profile && source ~/.bash_profile
fi 2> /dev/null
source ~/.bash_profile

##########################################################################
echo -e "\n WSL と Windows 連携を便利にする wslu を導入 \n"
sudo dnf install -y epel-release 
sudo dnf copr enable -y wslutilities/wslu
sudo dnf install -y wslu

##########################################################################
echo -e "\n Windows側のGit認証情報を利用するように設定する \n";

# Windows 側の "git-credential-manager.exe" という EXE ファイルを認証ヘルパーに指定することで、 Windows 側 Git の認証情報を再利用します

# ........... ↓ 
# ........... ↓ Windows の Git パスを求めて　  ............... ↓ WSL におけるパス (Cドライブは /mnt/c/ ) に変換しています
WINGIT_PATH=$(where.exe git | grep cmd | sed -z 's/\r\n//g' | xargs -0 -I {} wslpath -u "{}")

# 上記で求めた git.exe は "(略)/Git/cmd/git.exe" のようになっていますが、
# 本当に欲しいパスは "(略)/Git/mingw64/bin/git-credential-manager.exe" のような形式
# ............↓ git.exe から git-credential-manager.exe への相対パスを、realpath コマンドで絶対パスに変換
HELPER_PATH=$(realpath "$(dirname "$WINGIT_PATH")/../mingw64/bin/git-credential-manager.exe")

git config --global credential.helper "$(echo "$HELPER_PATH" | sed -e 's/ /\\ /g')"

echo -e "\n その他 Git 設定";
git config --global core.autocrlf false

##########################################################################
echo -e "\n WindowsでVPN接続時にパケットがロスしないようMTUを小さめの1100に設定する（通常1500） \n";
sudo dnf install -y iproute
sudo ip link set dev eth0 mtu 1100
