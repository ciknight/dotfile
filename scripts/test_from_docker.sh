#! /bin/sh
cd "$(dirname "$0")/.."

docker stop dotfiles && docker rm dotfiles

docker run -it --name dotfiles \
    -v $PWD/:/root/dotfiles \
    debian:bookworm-slim
