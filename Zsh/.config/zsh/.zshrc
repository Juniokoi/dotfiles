# Load main functions
local ZDOTDIR="$HOME/.config/zsh"

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
autoload -Uz compinit && compinit

source <(ng completion script)

# Tmux config
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
	tmux attach -t juniokoi || tmux new -s juniokoi
fi


# Files to source
source "$ZDOTDIR/zsh-functions"
zsh_add_file "zsh-aliases" 
zsh_add_file "zsh-exports"

fpath=(~/newdir $fpath)
# setopt autocd extendedglob nomatch menucomplete
stty stop undef # Disable ctrl-s to freeze terminal 
zle_highlight=('paste:none') # Remove text's highilight when pasted 
unsetopt BEEP # Remove annoying boop

HISTFILE="$HOME/.zsh_history"
HISTSIZE=1000000
SAVEHIST=1000000
setopt APPEND_HISTORY

source "$ZDOTDIR/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh"

# Useful plugins
zsh_add_plugin "hlissner/zsh-autopair"
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"

# Bindkeys
bindkey -s '^e' 'ranger^M'

# Control-Space:
bindkey '\0' list-expand

# Return key in completion menu & history menu:
# bindkey -M menuselect '\r' .accept-line

#FZF
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/doc/fzf/examples/completion.zsh ] && source /usr/share/doc/fzf/examples/completion.zsh
[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f $ZDOTDIR/completion/_fnm ] && fpath+="$ZDOTDIR/completion/"



