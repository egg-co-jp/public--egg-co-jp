REM [ -i はインストールウィザード画面を表示するオプション。ないとエラーになるケースや個別に設定が必要なケースで使用 ]
REM [ -e --id は大文字小文字を区別してアプリのIDを指定するというオプション ]
REM [ Firefoxは英語版が入ってしまうためここに記述していません ]
winget install -e --id Google.Chrome
winget install -i -e --id Microsoft.Office
winget install -e --id TeraTermProject.teraterm
winget install -e --id WinSCP.WinSCP
winget install -e --id PuTTY.PuTTY
winget install -i -e --id Oracle.VirtualBox
winget install -e --id Hashicorp.Vagrant
winget install -e --id JetBrains.Toolbox
winget install -e --id JetBrains.PHPStorm
winget install -e --id PostgreSQL.pgAdmin
winget install -e --id Postman.Postman
winget install -e --id 7zip.7zip
start https://github.com/egg-co-jp/install_windows_app/blob/main/doc/git_install_manual.md
winget install -i -e --id Git.Git
winget install -e --id GitHub.GitLFS
winget install -e --id Microsoft.GitCredentialManagerCore
winget install -e --id TortoiseGit.TortoiseGit
