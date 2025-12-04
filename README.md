# Dots

configuration files for unix

clone the repo, move these files in destination like, and symlink to one centralized folder

```
git clone --depth=1 https://github.com/nebulaw/dots.git ~/Dots
cd ~/Dots
# move files like thi
mv vim ~/.vim
mv vimrc ~/.vimrc
# do similar for other configurations
# and symlink like this
ln -s ~/.vim vim
ln -s ~/.vimrc vimrc
# you can clean up git after
rm -fr ~/Dots/.git
```

this way dot files become more managable from one directory

