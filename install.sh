#!/bin/sh

BASE=$(dirname $0)

rm -f ~/.bash
mv ~/.bashrc ~/.bashrc.bak
mv ~/.bash_profile ~/.bash_profile.bak

ln -s ${BASE}/dotbash ~/.bash
ln -s ~/.bash/profile ~/.bash_profile
ln -s ~/.bash/rc ~/.bashrc
