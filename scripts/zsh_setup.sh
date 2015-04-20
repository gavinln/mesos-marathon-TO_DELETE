#!/bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# setup ohmyzsh
if [ ! -d ~/.oh-my-zsh ]; then
    wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh
fi


# setup z.sh to help traverse directories
cp $DIR/z.sh ~/z.sh

ZSHRC=~/.zshrc
ZSH_SETUP="source ~/z.sh"

if ! grep -qe "$ZSH_SETUP" $ZSHRC; then
    echo "$ZSH_SETUP" >> $ZSHRC
fi

# Needed for z.sh
if [ ! -f ~/.z ]; then
    touch ~/.z
fi

# setup ohmyzsh plugins
sed -i "s/plugins=(git)/plugins=(git fabric aws)/" $ZSHRC

echo To enable zsh for the current user run:
echo sudo chsh -s /bin/zsh $USER

