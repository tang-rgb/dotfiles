#! /bin/bash


# ===============================
# Author: jessun1990@outlook.com
# Useage: bash-shell config file
# Filename: .bashrc
# ===============================

# ========== init ==========

case "$(uname)" in
    Linux*)     machine="linux";;
    Darwin*)    machine="mac";;
    CYGWIN*)    machine="cygwin";;
    MINGW*)     machine="mingw";;
esac

# ========== alias ==========
alias ll='ls -l'
alias la='ls -a'
alias l='ls'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

#
if [ "$machine" == "linux" ]; then
    alias pbcopy='xclip -selection clipboard'
    alias pbpaste='xclip -selection clipboard -o'
    # alias pbcopy='xsel --clipboard --input'
    # alias pbpaste='xsel --clipboard --output'
    alias usevimkey='setxkbmap -option caps:swapescape'
fi

if [ -x "&(command -v setxkbmap)" ]; then
    setxkbmap -option caps:swapescape
fi

if [ "$machine" == "mac" ]; then
    #alias tmux='tmux -u'
    alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
fi

# ========== Proxy ==========
alias usesocks5proxy="export all_proxy='socks5://127.0.0.1:1080'; export http_proxy='socks5://127.0.0.1:1080'; export https_proxy='socks5://127.0.0.1:1080'; git config --global http.proxy 'socks5://127.0.0.1:1080'; git config --global https.proxy 'socks5://127.0.0.1:1080'"
alias usehttpproxy="export all_proxy='http://127.0.0.1:1087'; export http_proxy='127.0.0.1:1087'; export https_proxy='127.0.0.1:1087'; git config --global http.proxy '127.0.0.1:1087'; git config --global https.proxy '127.0.0.1:1087'"
alias cleanallproxy="export http_proxy=;export https_proxy=;git config --global http.proxy ''; git config --global https.proxy ''"
# ========== Shell Proxy ==========
alias shellusesocks5proxy="export all_proxy='socks5://127.0.0.1:1080'; export http_proxy='socks5://127.0.0.1:1080'; export https_proxy='socks5://127.0.0.1:1080'"
alias shellusehttpproxy="export all_proxy='http://127.0.0.1:1087'; export http_proxy='127.0.0.1:1087'; export https_proxy='127.0.0.1:1087'"
alias shellcleanproxy="export all_proxy= ; export http_proxy=; export https_proxy="
# ========== Git Proxy ==========
alias gitusehttpproxy="git config --global http.proxy '127.0.0.1:1087'; git config --global https.proxy '127.0.0.1:1087'"
alias gitusesocks5proxy="git config --global http.proxy 'socks5://127.0.0.1:1080'; git config --global https.proxy 'socks5://127.0.0.1:1080'"
alias gitcleanproxy="git config --global http.proxy ''; git config --global https.proxy ''"
alias gitfix='git diff --name-only | uniq | xargs code-insiders'
alias gitdiff='git difftool'

alias mux='pgrep -vx tmux > /dev/null && \
             tmux new -d -s delete-me && \ 
             tmux run-shell ~/.tmux/plugins/tmux-resurrect/scripts/restore.sh && \
             tmux kill-session -t delete-me && \
             tmux attach || tmux attach'

# golang
export GO111MODULE="on"
if test -d "$HOME/Workbench/go"; then
    export GOPATH="$HOME/Workbench/go"
    if test -d "$GOPATH/bin"; then
        PATH="$PATH:$GOPATH/bin"
    fi
    function _update_ps1() {
        PS1="$($GOPATH/bin/powerline-go -error $?)"
    }
    if test -s "$GOPATH/bin/powerline-go"; then
        if [ "$TERM" != "linux" ] && [ -f "$GOPATH/bin/powerline-go" ]; then
            PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
        fi
    fi
fi

# local bin
if test -d "$HOME/.local/bin"; then
    PATH="$PATH:$HOME/.local/bin"
fi

# home bin
if test -d "$HOME/bin/"; then
    PATH="$PATH:$HOME/bin/"
fi

# MegaDisk
if test -d "$HOME/MEGAsync/bin"; then
    PATH="$HOME/MEGAsync/bin/:$PATH"
fi

# pyenv
#if  test -d "$HOME/.pyenv/shims/"; then
    #PATH="$PATH:$HOME/.pyenv.shims/"
#fi

# Rust
if test -d "$HOME/.cargo/bin/"; then
    PATH="$PATH:$HOME/.cargo/bin/"
fi

# yarn
if test -d "$HOME/.yarn/"; then
    PATH="$PATH:$HOME/.yarn/bin/"
fi

# nvm
if test -d "$HOME/.nvm/"; then
    export NVM_DIR="$HOME/.nvm/"
fi

#[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[[ -s "/home/jessun/.gvm/scripts/gvm" ]] && source "/home/jessun/.gvm/scripts/gvm"
