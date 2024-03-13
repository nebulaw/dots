
set -gx PATH bin $PATH
set -gx PATH venv/bin $PATH
set -gx PATH ~/.local/bin $PATH
set -gx PATH ~/.cargo/bin $PATH
set -gx PATH node_modules/.bin $PATH

# my programs
# set -gx PATH ~/.local/pkgs/code/default/bin $PATH
set -gx PATH ~/.local/share/JetBrains/Toolbox/scripts $PATH
set -gx PATH ~/.local/pkgs/eww/default/target/release $PATH
set -gx PATH ~/.local/pkgs/jetbrains-toolbox/default/bin $PATH
set -gx PATH ~/.local/pkgs/node/default/bin $PATH
set -gx PATH ~/.local/pkgs/swww/default/target/release $PATH
set -gx PATH ~/.local/pkgs/neovide $PATH
set -gx PATH ~/.local/pkgs/tlauncher/bin $PATH
set -gx PATH ~/.local/pkgs/code/default/bin $PATH
set -gx PATH ~/.local/pkgs/otd/opentabletdriver/usr/local/bin $PATH
set -gx PATH ~/.local/pkgs/pureref/bin $PATH

# java & maven
set -gx JAVA_HOME ~/.local/pkgs/jdk/default
set -gx PATH ~/.local/pkgs/jdk/default/bin $PATH
set -gx PATH ~/.local/pkgs/maven/default/bin $PATH

# ocaml (not permanent)
builtin -n | /bin/sh -c 'grep -q \'^argparse$\'' 1>/dev/null 2>/dev/null; and set -gx MANPATH ':/home/nebula/.opam/default/man'
set -gx PATH ~/.opam/default/bin $PATH
set -gx OPAM_SWITCH_PREFIX '/home/nebula/.opam/default';
set -gx CAML_LD_LIBRARY_PATH '/home/nebula/.opam/default/lib/stublibs:/usr/lib/ocaml/stublibs:/usr/lib/ocaml';
set -gx OCAML_TOPLEVEL_PATH '/home/nebula/.opam/default/lib/toplevel';
