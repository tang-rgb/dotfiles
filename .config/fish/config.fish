# ===============================
# Author: jessun1990@gmail.com
# Useage: fish-shell config file
# Filename: config.fish
# ===============================
#
#

# ========= init =========
switch (uname)
case 'Darwin'
    alias vim '/Applications/MacVim.app/Contents/bin/vim'
    #alias tmux 'tmux -u'
case 'Linux'
    alias pbcopy 'xsel --clipboard --input'
    alias pbpaste 'xsel --clipboard --output'
    setxkbmap -option caps:swapescape
case "*"
    echo "unknowon os"
end


# ========= alias =========
alias ll='ls -l'
alias la='ls -a'
alias l='ls'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias usevimkey='setxkbmap -option caps:swapescape'
alias gitupdate='git co master; git pull --all; git co -; git m master'

# ========== Proxy ==========
alias usesocks5proxy "export all_proxy='socks5://127.0.0.1:1080'; export http_proxy='socks5://127.0.0.1:1080'; export https_proxy='socks5://127.0.0.1:1080'; git config --global http.proxy 'socks5://127.0.0.1:1080'; git config --global https.proxy 'socks5://127.0.0.1:1080'"
alias usehttpproxy "export all_proxy='http://127.0.0.1:1087'; export http_proxy='http://127.0.0.1:1087'; export https_proxy='http://127.0.0.1:1087'; git config --global http.proxy '127.0.0.1:1087'; git config --global https.proxy '127.0.0.1:1087'"
alias cleanallproxy "export all_proxy=; export http_proxy=; export https_proxy=; git config --global http.proxy ''; git config --global https.proxy ''"

# ========== Shell Proxy ==========
alias shellusesocks5proxy "export all_proxy='socks5://127.0.0.1:1080'; export http_proxy='socks5://127.0.0.1:1080'; export https_proxy='socks5://127.0.0.1:1080'"
alias shellusehttpproxy "export all_proxy='http://127.0.0.1:1087'; export http_proxy='127.0.0.1:1087'; export https_proxy='127.0.0.1:1087'"
alias shellcleanproxy "export all_proxy=; export http_proxy=; export https_proxy="

# ========== Git Proxy ==========
alias gitusehttpproxy "git config --global http.proxy '127.0.0.1:1087'; git config --global https.proxy '127.0.0.1:1087'"
alias gitusesocks5proxy "git config --global http.proxy 'socks5://127.0.0.1:1080'; git config --global https.proxy 'socks5://127.0.0.1:1080'"
alias gitcleanproxy "git config --global http.proxy ''; git config --global https.proxy ''"
alias gitfix 'git diff --name-only | uniq | xargs nvim '
alias codefix 'git diff --name-only | uniq | xargs code '
alias gitdiff 'git difftool'

# ========== Env Vars ==========

# golang
set GO111MODULE on
if test -s "$GOPATH/bin/powerline-go"       # Powerline-go
    function fish_prompt
        powerline-go -error $status -shell bare -newline -colorize-hostname
    end
end
export GOPROXY=goproxy.cn,goproxy.io,direct 
export GONOSUMDB=actiontech.cloud

bass source ~/.gvm/environments/default

# local bin
if test -d "$HOME/.local/bin/"
    set -gx PATH "$HOME/.local/bin/" $PATH
end

# home bin
if test -d "$HOME/bin/"
    set -gx PATH "$HOME/bin/" $PATH
end

# MegaDisk
if test -d "$HOME/MEGAsync/bin/"
    set -gx PATH "$HOME/MEGAsync/bin/" $PATH
end

# pyenv
if test -d "$HOME/.pyenv/shims/"
    set -gx PATH "$HOME/.pyenv/shims/" $PATH
end

if command -v pyenv >/dev/null 2>&1
    status --is-interactive; and source (pyenv init -|psub)
end

# Rust
if test -d "$HOME/.cargo/bin/"
    set -gx PATH "$HOME/.cargo/bin/" $PATH
end

# yarn
if test -d "$HOME/.yarn/bin/"
    set -gx PATH "$HOME/.yarn/bin/" $PATH
end

# nvm
if test -d "$HOME/.nvm/bin/"
    set -gx PATH "$HOME/.nvm/bin/" $PATH
end

# ruby
if test -d "$HOME/.gem/ruby/2.7.0/bin/"
    set -gx PATH "$HOME/.gem/ruby/2.7.0/bin/" $PATH
end

nvm use default
status --is-interactive; and source (pyenv init -|psub)
