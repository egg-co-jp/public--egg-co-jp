REM [ ！！ Shift-JIS、CRLFであることを確認 Github上で直接編集しないこと ！！ ]

REM [ -i はインストールウィザード画面を表示するオプション。ないとエラーになるケースや個別に設定が必要なケースで使用 ]
REM [ -e --id は大文字小文字を区別してアプリのIDを指定するというオプション ]
REM [ Firefoxは英語版が入ってしまうためここに記述していません ]

REM [ GIT関連 ]
start https://github.com/egg-co-jp/install_windows_app/blob/main/doc/git_install_manual.md
winget install -i -e --id Git.Git
winget install -e --id GitHub.GitLFS
winget install -e --id Microsoft.GitCredentialManagerCore
winget install -e --id TortoiseGit.TortoiseGit
winget install -e --id WinMerge.WinMerge

REM [ 仮想マシン ]
winget install -i -e --id Oracle.VirtualBox
winget install -e --id Hashicorp.Vagrant

REM [ ユーティリティ ]
winget install -e --id TeraTermProject.teraterm
winget install -e --id WinSCP.WinSCP
winget install -e --id PuTTY.PuTTY

REM [ 開発 ]
winget install -e --id JetBrains.Toolbox

winget install -e --id PostgreSQL.pgAdmin
winget install -e --id Postman.Postman

REM [ 一般 ]
winget install -e --id 7zip.7zip
winget install -e --id Google.Chrome
winget install -i -e --id Microsoft.Office

REM [ その他 ]
winget install -e --id Microsoft.WindowsTerminal
winget install -e --id Notepad++.Notepad++

start https://github.com/egg-co-jp/install_windows_app/blob/main/doc/after_winget.md
