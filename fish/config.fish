set fish_greeting "stargaze! ☆"

# source path
source ~/Dots/fish/env.fish
source ~/Dots/fish/functions.fish

# xdg
set -gx EDITOR nvim
set -gx XDG_CONFIG_HOME ~/.config
set -gx GRIM_DEFAULT_DIR ~/Pictures/Screenshots

# exa aliases
alias g       "git"
alias ll      "exa --long --git --icons"
alias ls      "exa --grid --git --icons"
alias tree    "exa --tree --git --icons"
alias readme  "bat README.md 2>/dev/null | bat README 2>/dev/null"
alias todo    "vim TODO.md"
alias mkex    "chmod +x"
alias rmex    "chmod -x"

# SideFX Houdini
alias hls "sudo /etc/init.d/sesinetd"


# temp bandcamp downloader
alias bdl "bandcamp-dl --base-dir='/home/nebula/Media/Music/'"

