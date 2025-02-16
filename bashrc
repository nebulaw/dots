#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export CLICOLOR=1
export PS1='\u@\h:\[\e[0;49;94;2m\]\w\[\e[0m\]\$ '
export EDITOR='vim'

alias g="git"
alias ls="exa --grid --git --icons"
alias l="exa --long --git --icons"
alias ll="exa --long --git --icons"
alias tree="exa --tree --git --icons"

# . "$HOME/.cargo/env"

export PATH="$PATH:bin"
export PATH="$PATH:scripts"
export PATH="$PATH:venv/bin"
export PATH="$PATH:.venv/bin"
export PATH="$PATH:~/.local/bin"
export PATH="$PATH:~/.cargo/bin"
export PATH="$PATH:node_modules/.bin"

# Packages Directory
if [ -z "$PKG_HOME_DIR" ]; then
  export PKG_HOME_DIR="$HOME/.local/opt"
fi

if [ -z "$PKG_DEFAULT_BIN" ]; then
  export PKG_DEFAULT_BIN="default/bin"
fi

for pkg in $(ls "$PKG_HOME_DIR"); do
  if [ -e "$PKG_HOME_DIR/$pkg/$PKG_DEFAULT_BIN" ]; then
    export PATH="$PKG_HOME_DIR/$pkg/$PKG_DEFAULT_BIN:$PATH"
  fi
done

# java & maven
export JAVA_HOME="$HOME/.local/pkgs/jdk/default"

