#
# ~/.zshrc
#

# If not running interactively, don't do anything
[[ -o interactive ]] || return

export CLICOLOR=1
export PS1='%n@%m:%F{blue}%~%f$ '
export EDITOR='vim'

alias g="git"
alias ls="eza --grid --git --icons"
alias l="eza --long --git --icons"
alias ll="eza --long --git --icons"
alias lll="eza --long --git --icons"
alias llll="eza --long --git --icons"
alias lllll="eza --long --git --icons"
alias llllll="eza --long --git --icons"
alias lllllll="eza --long --git --icons"
alias llllllll="eza --long --git --icons"
alias tree="eza --tree --git --icons"

# . "$HOME/.cargo/env"

# Add paths using zsh array syntax
path+=(
    'bin'
    'scripts'
    'venv/bin'
    '.venv/bin'
    "$HOME/.local/bin"
    "$HOME/.cargo/bin"
    'node_modules/.bin'
    '/opt/homebrew/opt/openjdk@21/bin'
)

export PATH
export JAVA_HOME=/opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home


# Added by Antigravity
export PATH="/Users/kafka/.antigravity/antigravity/bin:$PATH"
