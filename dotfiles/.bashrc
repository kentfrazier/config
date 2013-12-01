which virtualenvwrapper.sh > /dev/null && source `which virtualenvwrapper.sh`

# Check for an interactive session
[ -z "$PS1" ] && return

PS1='[\W]\$ '

complete -cf sudo  

# Aliases
#alias sudo="A=`alias` sudo "
alias sudo="sudo "

alias ls="ls -GFh"
alias ll="ls -lh"
alias la="ls -A"
alias lla="ls -lhA"
alias lsd="ls -lh | grep \"^d\""
alias lsl="ls -lh | grep \"^l\""

psg () {
    local search
    search="$(printf '[%s]%s' ${1:0:1} ${1:1})"
    ps aux | grep "$search"
}
alias fontlist="fc-list | sed 's,:.*,,' | sort -u"

alias paclist="pacman -Sl | cut -d' ' -f2 | grep"
alias pacup="sudo pacman -Syu"
alias pac="sudo pacman -S"
alias pacs="pacman -Ss"
alias aurs="yaourt -Ss"
alias locs="pacman -Qs"
alias orphans="pacman -Qtdq"

alias vi="vim"

alias usbmount="sudo mount -w -o umask=002,gid=95 /dev/sdb1 /media/usbdisk"
alias usbumount="sudo umount /media/usbdisk"

alias serve="sudo /etc/rc.d/ushare start"

alias synctime="sudo ntpdate pool.ntp.org"

alias safep2p="sudo blockcontrol start"

alias ssh="ssh -C4c arcfour,blowfish-cbc"

alias hgrmall="hg forget \`hg st | grep -r "^\!" | cut -f2 -d\" \"\`"

alias docmirror="wget -A htm,html,jpg,jpeg,gif,png,txt,js,css \
    --wait=1 --random-wait -e robots=off --mirror --no-parent \
    --page-requisites --convert-links --adjust-extension"

alias usbnet="sudo ifconfig usb0 up && sudo dhcpcd"

# rbenv setup
if [[ -d "$HOME/.rbenv/bin" ]]; then
    export PATH=$HOME/.rbenv/bin:$PATH
    eval "$(rbenv init -)"
fi
