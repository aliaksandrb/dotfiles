alias git-p4='git-p4.py'

alias grep='grep --line-buffered --color=auto'

# confirm overwrite
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'

# git aliases
alias gb='git branch'
alias gba='git branch -av'
alias gc='git commit -v'
alias gd='git di'
alias gdc='gd --cached'
alias gdm='gd master --stat --relative'
alias gl='git pull'
alias gp='git push'
alias gst='git status'

# sudo
#alias sudo='sudo -E '
alias su='su -m'

function mkcd() {
  mkdir -p "$@"
  cd "$@"
}

function cpcd() {
  cp "$@"
  cd $_
}

function cdls() {
  cd "$1"
  shift
  ls "$@"
}

export EDITOR=vim

# python tests color shortcut
alias pt='nosetests --rednose --force-color'

alias ag='clear && ag'

alias p3='python3.4'
