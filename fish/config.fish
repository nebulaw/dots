set fish_greeting "stargaze! ☆"

# xdg
set -gx EDITOR nvim
set -gx XDG_CONFIG_HOME ~/.config
set -gx GRIM_DEFAULT_DIR ~/Pictures/Screenshots

# exa aliases
alias g       "git"
alias ll      "exa --long --git --icons"
alias ls      "exa --grid --git --icons"
alias tree    "exa --tree --git --icons"
alias readme  "bat README.md"
alias todo    "vim TODO.md"
alias mkex    "chmod +x"
alias rmex    "chmod -x"

# SideFX Houdini
alias hls "sudo /etc/init.d/sesinetd"

# source path
source ~/Dots/fish/env.fish
source ~/Dots/fish/functions.fish
