set fish_greeting "stargaze! ☆"


function fish_prompt
    set_color normal
    echo -n (whoami)
    echo -n "@"
    echo -n (hostname)
    echo -n ":"
    set_color green
    echo -n $(prompt_pwd --dir-length=0)
    set_color normal
    echo -n "\$ "
end

# xdg
set -gx EDITOR vim
set -gx XDG_CONFIG_HOME ~/.config
set -gx GRIM_DEFAULT_DIR ~/Media/Pictures/Screenshots

# source path
source ~/Dots/fish/binaries.fish
source ~/Dots/fish/functions.fish

# exa aliases
alias g "git"
alias ll "exa --long --git --icons"
alias ls "exa --grid --git --icons"
alias tree "exa --tree --git --icons"

# void
if string match -r "$(cat /etc/os-release | head -n1 | sed 's/NAME="//; s/"$//')" "Void" > /dev/null
  alias xbps "sudo xbps-install"
end

