set -gx PATH bin $PATH
set -gx PATH scripts $PATH
set -gx PATH venv/bin $PATH
set -gx PATH .venv/bin $PATH
set -gx PATH ~/.local/bin $PATH
set -gx PATH ~/.cargo/bin $PATH
set -gx PATH node_modules/.bin $PATH

# Packages Directory
if not test -n "$PKG_HOME_DIR"
  set -gx PKG_HOME_DIR "/home/nebula/.local/opt"
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
set -gx JAVA_HOME ~/.local/opt/jdk/default

