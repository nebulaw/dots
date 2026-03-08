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
alias copy="pbcopy"

# . "$HOME/.cargo/env"

# Add paths using zsh array syntax
path=(
    'bin' # I always check 'bin/' dir when I clone repos, keep your eyes on it
    "$HOME/.local/bin"
    "$HOME/.cargo/bin"
    '/opt/homebrew/bin'
    '/opt/homebrew/opt/openjdk/bin'
    $path
)

export PATH
export JAVA_HOME=/opt/homebrew/opt/openjdk/libexec/openjdk.jdk/Contents/Home

# bun completions
[ -s "/Users/kafka/.bun/_bun" ] && source "/Users/kafka/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# I find vi mode funny in shell
bindkey -v

# some vi keybindings
bindkey -M viins 'jk' vi-cmd-mode
bindkey '^?' backward-delete-char

# opencode
export PATH=/Users/kafka/.opencode/bin:$PATH
