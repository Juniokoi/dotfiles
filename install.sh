#!/bin/env bash

local OS=$(uname -s | tr '[:upper:]' '[:lower:]')
check_system() {

}

echo ""
echo "==============================="
echo "Creating top level Trash dir..."
echo "==============================="
mkdir --parent /.trash
chmod a+rw /.trash
chmod +t /.trash
echo "Done"
# 
# cargo install \ 
# rust-analyzer bacon paru fd-find
# sd exa bat ripgrep zoxide joshuro
# wiki-tui rtx-cli ncspot skim broot
# alacritty hyperfine cargo-info
# speedtest-rs gitoxide
