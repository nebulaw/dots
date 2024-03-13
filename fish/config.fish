set fish_greeting "stargaze! ☆"

# xdg
set -gx EDITOR vim
set -gx XDG_CONFIG_HOME ~/.config
set -gx GRIM_DEFAULT_DIR ~/Media/Pictures/Screenshots

# source path
source ~/Dots/fish/env.fish
source ~/Dots/fish/functions.fish

# exa aliases
alias g "git"
alias ll "exa --long --git --icons"
alias ls "exa --grid --git --icons"
alias tree "exa --tree --git --icons"
alias readme "bat README.md"

# void
if string match -r "$(cat /etc/os-release | head -n1 | sed 's/NAME="//; s/"$//')" "Void" > /dev/null
  alias xbps "sudo xbps-install"
end

