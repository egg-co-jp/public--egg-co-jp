#!/usr/bin/env bash

# エイリアスを有効にする
shopt -s expand_aliases
source ~/.bash_profile

##########################################################################
echo -e "\n work-alma9 ディレクトリを作成 \n"
sudo mkdir -p /work-alma9
sudo chown $USER:$USER /work-alma9


##########################################################################
echo -e "\n phpstormからgit操作するため git インストールと、追加で言語パックが必要そうなのでインストール \n"
sudo dnf install -y git git-lfs glibc-langpack-en


##########################################################################
echo -e "\n Node.js が未インストールならインストール \n"
if ! command -v node &> /dev/null; then
  sudo dnf module install -y nodejs:20
fi

##########################################################################
echo -e "\n Taskfile をセットアップ \n"

# task コマンドを使う時に Tab キーでオートコンプリートできるようにする
# https://taskfile.dev/installation/#setup-completions
sudo dnf install -y bash-completion
if [ ! -f /usr/local/bin/task.bash ]; then
  sudo curl https://raw.githubusercontent.com/go-task/task/main/completion/bash/task.bash -o /usr/local/bin/task.bash
  sudo chmod +x /usr/local/bin/task.bash
fi
if ! grep -q "source /usr/local/bin/task.bash" ~/.bash_profile; then
  echo "source /usr/local/bin/task.bash" >> ~/.bash_profile
fi

# task コマンド本体をインストール
if ! command -v task &> /dev/null; then 
  sudo npm i -g @go-task/cli
fi


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

# Windows 側の "git-credential-manager.exe" という exe ファイルを認証ヘルパー (config の credential.helper) に指定することで、
# Windows 側 Git の認証情報を再利用します

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

###########################################################################
echo -e "\n AWS CLI とセッションマネージャプラグインをインストール\n";
sudo dnf install -y unzip
cd /tmp
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -rf ./aws

sudo dnf install -y https://s3.amazonaws.com/session-manager-downloads/plugin/latest/linux_64bit/session-manager-plugin.rpm


###########################################################################
echo -e "\n Home Brew をインストール\n";
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


###########################################################################
echo -e "\n ecspresso をインストール\n";
brew install kayac/tap/ecspresso
