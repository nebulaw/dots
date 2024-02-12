# Neovim Configuration

A simple and lightweight configuration for [Neovim v0.9.0](https://github.com/neovim/neovim) written in lua.

Installation
-----
### Prerequisites
* [Neovim (>=v0.9.0)](https://github.com/neovim/neovim) 
* [Packer](https://github.com/wbthomason/packer.nvim)
* [Nerd Font](https://github.com/ryanoasis/nerd-fonts)

### Installation
If you don't have packer installed:
```sh
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

You should add packer manually using neovim commandline
```sh
:packadd packer
```

Make a backup folder for an old config
```sh
mv ~/.config/nvim ~/.config/nvim.bak 
```
Clone the repository
```bash
git clone --depth 3 https://github.com/nebulaw/nvim-config ~/.config/nvim
```






