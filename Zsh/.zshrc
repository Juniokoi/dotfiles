# Fig pre block. Keep at the top of this file.
local ZDOTDIR="$HOME/.config/zsh"
source "$ZDOTDIR/zsh_functions"

use "autocompletions"
use "aliases" 
use "exports"
use "settings"
use "fzf"
use "keybindings"
use "plugins"
use "transient"

# tmux_init

echo "Finished setting up zsh"

eval "$(rtx activate zsh)"
eval "$(direnv hook zsh)"
export GPG_TTY=$(tty)
clear -x

source /home/junio/.config/broot/launcher/bash/br
