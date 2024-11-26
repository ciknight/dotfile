#! /bin/sh

install_rust () {
    curl https://sh.rustup.rs -sSf | bash

    export PATH="$HOME/.cargo/bin:$PATH"
    rustup toolchain install nightly
    cargo +nightly install racer
    git clone --depth=1 https://github.com/rust-lang/rust.git ~/workspace/rust
}

