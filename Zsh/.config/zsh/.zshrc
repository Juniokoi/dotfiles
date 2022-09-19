	# Load main functions
export ZDOTDIR="$HOME/.config/zsh"
eval "$(zoxide init zsh)"


source "$ZDOTDIR/zsh-functions"
fpath=(~/newdir $fpath)
# setopt autocd extendedglob nomatch menucomplete
stty stop undef   # Disable ctrl-s to freeze terminal
zle_highlight=('paste:none') # Remove text's highilight when pasted
unsetopt BEEP # Remove annoying boop

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

	#Useful plugins
zsh_add_plugin "hlissner/zsh-autopair" # Adds autopair, really useful
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "marlonrichert/zsh-autocomplete" # May lag your zshell, but is wonderful

zstyle ':autocomplete:*' recent-dirs zoxide
	#Bindkeys
bindkey -s '^o' 'ranger^M'
 # Up arrow:
bindkey '\e[A' up-line-or-search
bindkey '\eOA' up-line-or-search

 # Down arrow:
bindkey '\e[B' down-line-or-select
bindkey '\eOB' down-line-or-select

# Control-Space:
bindkey '\0' list-expand

 # Return key in completion menu & history menu:
bindkey -M menuselect '\r' .accept-line

	#FZF
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/doc/fzf/examples/completion.zsh ] && source /usr/share/doc/fzf/examples/completion.zsh
[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f $ZDOTDIR/completion/_fnm ] && fpath+="$ZDOTDIR/completion/"


	# Normal files to source
zsh_add_file "zsh-aliases"
zsh_add_file "zsh-exports"
zsh_add_file "zsh-prompt"

function toggle-theme() {
	current_theme=$(awk '$1=="include" {print $2}' "$HOME/.config/kitty/kitty.conf")
	new_theme="rose-pine-moon.conf"

	if [ "$current_theme" = "rose-pine-moon.conf" ]; then
		new_theme="rose-pine-dawn.conf"
	fi

	# Set theme for active sessions. Requires `allow_remote_control yes`
	kitty @ set-colors --all --configured "~/.config/kitty/$new_theme"

	# Update config for persistence
	sed -i '' -e "s/include.*/include $new_theme/" "$HOME/.config/kitty/kitty.conf"
}

zstyle ':autocomplete:*' fzf-completion yes
