if status is-interactive
	set fish_greeting
	starship init fish | source
	zoxide init fish | source
	rtx activate fish | source
	rtx complete --shell fish | source
	set fish_color_error red --bold --italic
	enable_transience
end

set -g EDITOR nvim

alias tmux tmux-init

#-a==--add
#functionnvim_edit;echo nvim .; end
#abbr-av --position anywhere --function nvim_edit
abbr -a v nvim;
abbr -a vi nvim;
abbr -a lg lazygit

alias logout "pkill -KILL -u $USER"

##Vim
#vikeybindings are the best
set -g fish_key_bindings fish_vi_key_bindings
#options:block, underscore, line
#normaland visual mode
set fish_cursor_default block blink
set fish_cursor_insert block
set fish_cursor_replace_one underscore
set fish_cursor_visual block

bind -M insert \cj 'down-or-search'
bind -M insert \ck 'up-or-search'
bind -M insert \cl 'forward-char'
bind -M insert \ch 'backward-char'

bind -M insert \cc kill-whole-line repaint
bind -M insert \cu kill-whole-line repaint
bind -M default \cu kill-whole-line repaint

#C-f: Reload fish settings
function resource;source $__fish_config_dir/config.fish && commandline -f repaint; end
bind -M default \er 'resource'
bind -M insert \er 'resource'

#C-v: open current folder with neovim
function _edit_nvim;nvim; end
bind -M default \cf '_edit_nvim'
bind -M insert \cf '_edit_nvim'

#C-e
function _explorer; joshuto 2> /dev/null; end
bind -M default \ce '_explorer'
bind -M insert \ce '_explorer'

#A-f: edit fish config file
function _edit_config_file; $EDITOR $__fish_config_dir; end
bind -M default \ef '_edit_config_file '
bind -M insert \ef '_edit_config_file '

#A-h: Get back one folder
function _get_back_one_level; cd .. && commandline -f repaint; end
bind -M default \eh '_get_back_one_level'
bind -M insert \eh '_get_back_one_level'

#A-h: Get back back
function _get_back_back; cd - && commandline -f repaint; end
bind -M default \e- '_get_back_back'
bind -M insert \e- '_get_back_back'

#A-h: Get back back
function _get_back_back; zi && commandline -f repaint; end
bind -M default \co '_get_back_back'
bind -M insert \co '_get_back_back'

#Type L and space to apply | less at the end
abbr -a L --position anywhere --set-cursor "% | less"

fish_add_path -g ~/.bin ~/node_modules/bin

function tmux_init
	set sessions $(tmux list-sessions)

	# Check if you are already in a tmux session
	if test -n "$TMUX"
		return
	end

	# is a tmux server exists, log into it. otherwise, create a new one
	if test -n "$sessions"
		#use awk to get the name of the first session
		set session_name (echo "$sessions" | awk 'NR==1{print $1}')
		#initialize the first session
		tmux a -t $session_name
	else
		#create a new session if there are no existing sessions
		tmux
	end
end

#if test ! -n "$JETBRAINS_TERMINAL" -o "$JETBRAINS_TERMINAL" -ne 1
	#tmux_init
#end

function va -d 'Check if has arguments'
	if test (count $argv) -eq 0
		echo'need argssss'
		return
	end
end

alias cemacs "emacsclient -c -a 'emacs'"

alias rr 'hwatch -cd --mouse bundler exec rspec --force-color'
function aliasm -d 'Apply many aliases at once'
	begin
		set i (count $argv)
	end
	if test $i -lt 3
		echo"use an alias instead"
		return
	end


	for item in (seq $i)[..-2]
		alias "$argv[$item]" "$argv[$i]"
	end
end

aliasm {c,cl,cle,clea} clear

function has -d 'alias second arg if first exist'
	va $argv

	if command -sq $argv[1]
		alias $argv[2]
	end
end

function has_alias -d 'Alias first argument with second if first exists '
	va $argv

	if command -sq $argv[1]
		alias $argv[1] $argv[2]
	end
end

function overlay -d 'Switch core utils with enhanced ones'
	va $argv

	if command -sq $argv[2]
		alias $argv[1] $argv[2]
	end
end

alias l   "ls -l"       # list table
alias la  "ls -lah"     # list table hidden
alias lsa "ls -ah"      # list files hidden
# these commands only work with exa
has   exa  lt="ls -T"   # list tree
has   exa  lta="ls -Ta" # list tree hidden
has   sk   rgrep="sk --ansi -i -c 'rg --color=always --line-number "{}"'"

alias rm="rm -r"
alias mv="mv -i"
alias cp="cp -r"
alias mkdir="mkdir -p"

has_alias exa 'exa --time-style=long-iso --git -@ --group-directories-first \
--icons --no-permissions --no-user'
has_alias bat 'bat --plain --paging=always'
has_alias rg 'rg --hidden --follow --smart-case 2>/dev/null'
has_alias fd 'fd --hidden --follow'
has_alias sk "sk --bind 'ctrl-l:accept'"

overlay ls exa
overlay cat bat
overlay grep rg
overlay find fd
overlay rm trash-put

alias cc="cargo clippy --fix --\
 -W clippy::pedantic -W clippy::nursery -W clippy::unwrap_used"
