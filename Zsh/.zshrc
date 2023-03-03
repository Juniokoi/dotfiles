# Fig pre block. Keep at the top of this file.
local ZDOTDIR="$HOME/.config/zsh"
source "$ZDOTDIR/zsh_functions"

use "autocompletions"
use "exports"
use "aliases" 
use "settings"
use "fzf"
use "keybindings"
use "plugins"
use "transient"

xset r rate 300 30

# tmux_init

eval "$(rtx activate zsh)"
eval "$(direnv hook zsh)"
export GPG_TTY=$(tty)

print_stage "Finished setting up zsh"

if [ -z "$ZSH_SILENT" ] || [ "$ZSH_SILENT" -eq 1 ]; then
	clear -x
fi
