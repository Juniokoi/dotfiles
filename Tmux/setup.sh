#!/usr/bin/env bash

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd) && cd "$SCRIPT_DIR" || return 1

ln -sf "$SCRIPT_DIR/tmux.conf" ~/.tmux.conf

# tpm
[[ ! -a ~/.tmux/plugins/tpm ]] && git clone --depth=1 https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# install plugins
~/.tmux/plugins/tpm/scripts/install_plugins.sh

ln -s "$SCRIPT_DIR/plugins/*" ~/.tmux/plugins

