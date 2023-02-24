# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
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
tmux_init

echo "Finished setting up zsh"
eval "$(direnv hook zsh)"
clear -x
export GPG_TTY=$(tty)
