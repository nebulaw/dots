
# very handy with manuals
function ffman ()
    set section $argv[1]
    if string match -r "^[1-9]\$" $section > /dev/null
        find "/usr/share/man/man$section" "/usr/local/share/man/man$section" -name "*.$section" | sed 's/.*\///' | sed "s/.$section\$//" | sort -frh | fzf | xargs man 2> /dev/null
    else
        echo "Invalid section number. Please provide a number between 1 and 9."
    end
end

function xbps-ls ()
  set package $argv[1]
  xbps-query -Rs $package | awk '{print match($1, "[*]") != 0 ? $0 : ""}' | awk NF
end

function ocaml_env_init ()

end

function fish_prompt ()
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

