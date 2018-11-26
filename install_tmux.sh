#!/usr/bin/env bash
yum remove -y tmux
yum install -y libevent-devel ncurses-devel glibc-static
wget https://github.com/tmux/tmux/releases/download/2.8/tmux-2.8.tar.gz
tar xzf tmux-2.8.tar.gz
cd tmux-2.8
./configure && make
sudo make install
