# Neovim config

## Clone config

```
git clone https://github.com/Backstabe/nvim_config ~/.config/nvim
```

## Install NodeJS

```
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
```

## Install FZF

```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

## Install Plug
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

```
# in nvim

:PlugInstall
```

## Install silversearcher for Ag

```
sudo apt-get install silversearcher-ag
```
