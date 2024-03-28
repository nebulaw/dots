set -gx PATH bin $PATH
set -gx PATH venv/bin $PATH
set -gx PATH ~/.local/bin $PATH
set -gx PATH ~/.cargo/bin $PATH
set -gx PATH node_modules/.bin $PATH

# Packages Directory
if not test -n "$PKG_HOME_DIR"
  set -gx PKG_HOME_DIR "/home/nebula/.local/pkgs"
end

if not test -n "$PKG_DEFAULT_BIN"
  set -gx PKG_DEFAULT_BIN "default/bin"
end

for pkg in $(dir "$PKG_HOME_DIR" | xargs -n1 echo)
  if test -e "$PKG_HOME_DIR/$pkg/$PKG_DEFAULT_BIN"
    set -gx PATH "$PKG_HOME_DIR/$pkg/$PKG_DEFAULT_BIN" $PATH
  end
end

# java & maven
set -gx JAVA_HOME ~/.local/pkgs/jdk/default

# ocaml (not permanent)
builtin -n | /bin/sh -c 'grep -q \'^argparse$\'' 1>/dev/null 2>/dev/null; and set -gx MANPATH ':/home/nebula/.opam/default/man'
set -gx PATH ~/.opam/default/bin $PATH
set -gx OPAM_SWITCH_PREFIX '/home/nebula/.opam/default';
set -gx CAML_LD_LIBRARY_PATH '/home/nebula/.opam/default/lib/stublibs:/usr/lib/ocaml/stublibs:/usr/lib/ocaml';
set -gx OCAML_TOPLEVEL_PATH '/home/nebula/.opam/default/lib/toplevel';
