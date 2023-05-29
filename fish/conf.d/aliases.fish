#Type L and space to apply | less at the end
abbr -a L --position anywhere --set-cursor "% | less"

alias logout "pkill -KILL -u $USER"

abbr -a v $EDITOR;
abbr -a vi $EDITOR;
abbr -a vim $EDITOR;
abbr -a lg lazygit

alias cemacs "emacsclient -c -a 'emacs'"

alias rr 'hwatch -cd --mouse bundler exec rspec --force-color'

aliasm {c,cl,cle,clea} clear

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

alias clippy="cargo clippy --fix --\
 -W clippy::pedantic -W clippy::nursery -W clippy::unwrap_used"

alias clippyd="cargo clippy --fix --\
 -W clippy::pedantic -W clippy::nursery -W clippy::unwrap_used \
 -D warnings"
