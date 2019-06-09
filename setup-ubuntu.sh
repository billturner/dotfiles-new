#!/bin/bash
PWD=`pwd`

reset_existing () {
  if [ -L $1 ]; then
    rm $1
    return
  fi

  if [ -f $1 ]; then
    mv $1 $1.old
  fi
}

echo "Setting up Ubuntu configs..."

echo " * Neovim"
INIT_VIM="$HOME/.config/nvim/init.vim"

# create neovim config directory, if needed
if [ ! -f "$HOME/.config/nvim" ]; then
  mkdir -p "$HOME/.config/nvim"
fi

# clear/move old files
reset_existing $INIT_VIM

# add link to init.vim
ln -s "$PWD/init.vim" "$INIT_VIM"

# add vim-plug
curl -fLo "$HOME/.local/share/nvim/site/autoload/plug.vim" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo " * zshrc"
ZSHRC="$HOME/.zshrc"

# clear/move old files
reset_existing $ZSHRC

# add link to zshrc
ln -s "$PWD/zshrc" "$ZSHRC"

echo " * env.sh"
ENV_SH="$HOME/.env.sh"

# clear/move old files
reset_existing $ENV_SH

# add link to env.sh
ln -s "$PWD/env.sh" "$ENV_SH"

echo " * gitconfig"
GITCONFIG="$HOME/.gitconfig"

# clear/move old files
reset_existing $GITCONFIG

# add link to gitconfig
ln -s "$PWD/gitconfig" "$GITCONFIG"
