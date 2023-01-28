#!/usr/bin/env bash

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd) && cd "$SCRIPT_DIR" || return 1

ln -sf "$SCRIPT_DIR/tmux.conf" ~/.tmux.conf

function install_tmux_plugin() {
	local plugin_name="$1"
	local plugin_url="$2"
	local plugin_dir="$HOME/.tmux/plugins/$plugin_name"

	if [[ ! -d "$plugin_dir" ]]; then
		git clone --depth=1 "$plugin_url" "$plugin_dir"
	fi
}

# tpm
install_tmux_plugin "tpm" "https://github.com/tmux-plugins/tpm"

# install plugins
~/.tmux/plugins/tpm/scripts/install_plugins.sh

ln -s "$SCRIPT_DIR/plugins/*" ~/.tmux/plugins

