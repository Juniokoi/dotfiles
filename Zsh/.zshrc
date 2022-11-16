autoload -Uz compinit 
compinit

# Load main functions
local ZDOTDIR="$HOME/.config/zsh"


eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

function load_angular_completion {
    local APP="ANGULAR"
    echo "$APP: Loading autocomplete ..."


    source <(ng completion script)
    echo "$APP: ... done!"
}

load_angular_completion

# Tmux config
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
	tmux attach -t juniokoi || tmux new -s juniokoi
fi


# Files to source
source "$ZDOTDIR/zsh-functions"
zsh_add_file "zsh-aliases" 
zsh_add_file "zsh-exports"

fpath=(~/newdir $fpath)
setopt autocd extendedglob nomatch menucomplete
stty stop undef # Disable ctrl-s to freeze terminal 
zle_highlight=('paste:none') # Remove text's highilight when pasted 
unsetopt BEEP # Remove annoying boop
zstyle -e ':completion:*' special-dirs '[[ $PREFIX = (../)#(|.|..) ]] && reply=(..)'

export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=1000000000
export SAVEHIST=1000000000
export HISTTIMEFORMAT="[%F %T] "
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS

source "$ZDOTDIR/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh"

# Useful plugins
zsh_add_plugin "hlissner/zsh-autopair"
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "marlonrichert/zsh-autocomplete"

# Bindkeys
bindkey -s '^e' 'ranger^M'

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

export FZF_COMPLETION_OPTS='--border --info=inline'
export FZF_DEFAULT_OPTS=" \
--color=bg+:#1e1e2e,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

# FZF_DEFAULT_COMMAND='find . -type f' \
#   fzf --bind 'ctrl-d:reload(find . -type d),ctrl-f:reload(eval "$FZF_DEFAULT_COMMAND")' \
#       --height=50% --layout=reverse

# Enables using gpg with wsl
export GPG_TTY=$(tty)

# Java resources
echo "Java: Initialize ..."
source /etc/profile.d/jre.sh
eval "$(jenv init -)"
echo "Java: ...Finished!"


