# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022
# 判断系统
# /usr/bin/libinput-gestures-setup restart

case "$(uname)" in
    Linux*)     machine="linux";;
    Darwin*)    machine="mac";;
    CYGWIN*)    machine="cygwin";;
    MINGW*)     machine="mingw";;
    *)          machine="UNKNOWN:${unameOut}"
esac

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
#if [ -d "$HOME/bin" ] ; then
    #PATH="$HOME/bin:$PATH"
#fi

# set PATH so it includes user's private bin if it exists
#if [ -d "$HOME/.local/bin" ] ; then
    #PATH="$HOME/.local/bin:$PATH"
#fi

# xrandr --output HDMI-1 --rotate left --output DP-1 --rotate left --left-of HDMI-1
#if [ -x polybar ]; then
    #polybar -c ~/.config/polybar/config.ini main &
#fi

#if [ "$machine" == "mac" ]; then
    #alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
#fi

if [ "$machine" == "linux" ]; then

    if [ -x "$(command -v setxkbmap)" ]; then
        setxkbmap -option caps:swapescape
    fi

    if [ -x "$(command -v google-chrome-unstable)" ]; then
        export BROWSER=google-chrome-unstable
    elif [ -x "$(command -v google-chrome-beta)" ]; then
        export BROWSER=google-chrome-beta
    elif [ -x "$(command -v google-chrome-stable)" ]; then
        export BROWSER=google-chrome-stable
    fi

    export LANG=zh_CN.UTF-8
    export GTK_IM_MODULE=ibus
    export QT_IM_MODULE=ibus
    export XMODIFIERS=@im=ibus
    export GLFW_IM_MODULE=ibus

fi

# golang
#export GO111MODULE="on"
#if [ -d "$HOME/Workbench/go" ] ; then
    #export GOPATH="$HOME/Workbench/go"
    #if [ -d "$GOPATH/bin" ] ; then
        #PATH="$GOPATH/bin:$PATH"
    #fi
#fi

# Rust
#if [ -d "$HOME/.cargo/bin" ] ; then
    #PATH="$HOME/.cargo/bin:$PATH"
#fi

#if [ -d "$HOME/.nvm" ]; then
    #export NVM_DIR="$HOME/.nvm"
#fi

#if [ -d "$HOME/.yarn" ]; then
    #PATH="$HOME/.yarn/bin:$PATH"
#fi

#if [ -d "$HOME/MEGAsync/bin" ]; then
    #PATH="$HOME/MEGAsync/bin/:$PATH"
#fi

export PATH="$HOME/.cargo/bin:$PATH"
export TERM="xterm-256color"
[[ -s "/home/jessun/.gvm/scripts/gvm" ]] && source "/home/jessun/.gvm/scripts/gvm"
gvm use go1.14.4 --default
