# install_windows_app
Windowsアプリを「winget」でインストールします。

## 1
まずは「winget」自体がインストールされているか確認します。
コマンドプロンプトで「winget」と打ってみてヘルプが表示されればインストール済みです。

（最新のWindows Updateされていればインストール済みのはずです）

![image](https://user-images.githubusercontent.com/86991695/168506156-cf86af57-13ec-4230-b9e3-8447eb9ec2cc.png)

「winget」がインストールされていなければ、[Microsoft Store で 「アプリインストーラ」](https://www.microsoft.com/ja-jp/p/app-installer/9nblggh4nns1) をインストールしてください。
このアプリにwingetコマンドが含まれています。

## 2
次に [このリンクをクリックしてZIPファイルをダウンロード](https://github.com/egg-co-jp/install_windows_app/archive/refs/heads/main.zip) してください（クリック後、少し反応が遅れてダウンロードされます）。

ZIPファイルを展開したら `install_windows_app` フォルダ `egg-winget.bat` を実行してください。  
（⚠ダブルクリックなどで普通のユーザとして実行。管理者として実行はしないでください）

この画面が出てきた場合は「詳細情報」をクリックすると「実行」ボタンが現れるのでそれで実行します。

<img width="396" alt="image" src="https://user-images.githubusercontent.com/86991695/171567325-72483507-23b8-472b-8b8c-9b17a6180f66.png">


必要なときに管理者権限を求められるので、管理者に認証をお願いしてください。
