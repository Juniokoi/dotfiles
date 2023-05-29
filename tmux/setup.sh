#!/usr/bin/env bash
"~/.dotfiles/tmux"
SCRIPT_DIR="~/.dotfiles/tmux"

if [ ! -e ~/.tmux.conf ]; then
	ln -s "$SCRIPT_DIR/tmux.conf" "~/.tmux.conf"
fi

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

