@echo off
REM [ ★ 管理者として実行ではなく、普通に起動してください ]
REM [ ★ CRLFであることを確認 LFだと不具合を起こします ]

REM [ -i はインストールウィザード画面を表示するオプション。ないとエラーになるケースや個別に設定が必要なケースで使用 ]
REM [ -e --id は大文字小文字を区別してアプリのIDを指定するというオプション ]

@echo on

REM [ 一般 ]
winget install -e --id 7zip.7zip
winget install -e --id Google.Chrome
winget install -e --id Mozilla.Firefox

REM [ GIT関連 ]
start https://github.com/egg-co-jp/public--egg-co-jp/blob/main/install_windows_app/doc/git_install_manual.md
winget install -i -e --id Git.Git
winget install -e --id GitHub.GitLFS
winget install -i -e --id TortoiseGit.TortoiseGit
winget install -e --id WinMerge.WinMerge

REM [ 仮想マシン ]
winget install -i -e --id Oracle.VirtualBox
winget install -e --id Hashicorp.Vagrant
winget install -e --id VMware.WorkstationPlayer

REM [ ユーティリティ ]
winget install -i -e --id TeraTermProject.teraterm
winget install -e --id WinSCP.WinSCP
winget install -e --id PuTTY.PuTTY

REM [ 開発 ]
winget install -e --id JetBrains.Toolbox
winget install -e --id Microsoft.VisualStudioCode

winget install -e --id PostgreSQL.pgAdmin
winget install -e --id Postman.Postman

REM [ その他 ]
winget install -e --id Microsoft.WindowsTerminal
winget install -e --id Notepad++.Notepad++
winget install -e --id NickeManarin.ScreenToGif

start https://github.com/egg-co-jp/public--egg-co-jp/blob/main/install_windows_app/doc/after_winget.md
@echo on
echo;
echo;
echo 「wingetインストールが終わったら」ページ(https://github.com/egg-co-jp/install_windows_app/blob/main/doc/after_winget.md)をブラウザで開きました。
echo 確認して作業を続けてください。また、上にスクロールして失敗したインストールがないかも確認してください。
echo この画面は何かキーを押すと終了します。
echo;
echo;
pause