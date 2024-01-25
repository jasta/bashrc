#!/bin/sh

BASE=$(dirname $0)

install_bash() {
  rm -f ~/.bash
  mv ~/.bashrc ~/.bashrc.bak
  mv ~/.bash_profile ~/.bash_profile.bak

  ln -s ${BASE}/dotbash ~/.bash
  ln -s ~/.bash/profile ~/.bash_profile
  ln -s ~/.bash/rc ~/.bashrc
}

install_vim() {
  rm -f ~/.vim
  mv ~/.vimrc ~/.vimrc.bak
  
  ln -s ${BASE}/dotvim ~/.vim
  ln -s ~/.vim/vimrc ~/.vimrc
}

install_bash
install_vim
