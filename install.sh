#!/bin/sh

export GIT_SSL_NO_VERIFY=true
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
curl -k -O https://raw.github.com/vim4program/vim4program/master/.vimrc
cp .vimrc ~/.vimrc
