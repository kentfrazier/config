copy "%CONFIGHOME%\setup\.vimrc" "%HOMEDRIVE%%HOMEPATH%"
copy "%CONFIGHOME%\dotfiles\.gitconfig" "%HOMEDRIVE%%HOMEPATH%"
copy "%CONFIGHOME%\dotfiles\.hgrc" "%HOMEDRIVE%%HOMEPATH%"

md "%HOMEDRIVE%%HOMEPATH%\.config_storage"
md "%HOMEDRIVE%%HOMEPATH%\.config_storage\vim"
md "%HOMEDRIVE%%HOMEPATH%\.config_storage\vim\undo"
md "%HOMEDRIVE%%HOMEPATH%\.config_storage\vim\sessions"
md "%HOMEDRIVE%%HOMEPATH%\.config_storage\vim\backup"
