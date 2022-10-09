set fish_greeting
if status is-interactive
    set XDG_CONFIG_HOME "$HOME/.config"
    set CONFIG "$XDG_CONFIG_HOME"
    set WM_CONFIG "$CONFIG/i3/config"
    set DOT "$HOME/.dotfiles"

    alias vim nvim
    alias fc "vim $CONFIG/fish/config.fish"
    alias bc "vim $CONFIG/bspwm/bspwmrc"
    alias sc "vim $CONFIG/sxhkd/sxhkdrc"
    alias wc "vim $CONFIG/wezterm/wezterm.lua"
    alias vc "vim $CONFIG/nvim/init.lua"
    alias pc "vim $CONFIG/picom.conf"
    alias kc "vim $CONFIG/kitty/kitty.conf"
    alias wmc "vim $WM_CONFIG"
    alias cdot "cd $DOT"
    alias cfg "cd $CONFIG"
    alias supersudo "sudo --preserve-env=PATH env"
    alias c clear
    alias cl clear
    alias f fish
    alias sayonara "sudo shutdown -h now"
    alias logoff "sudo pkill -KILL -u $USER"

    alias ls "exa --icons --color=always --color-scale --sort type "
    alias la "ls -@lah --git"
    alias lt "ls -T"
    alias cat "bat --style full --theme Dracula"

    alias au "yay -Syyuu --noconfirm"

    ## GIT
    alias gs "git-st"
    alias gc "git commit -m"
    alias gl "git lg"
    alias glo "git log --oneline"
    alias ga "git add"
    alias lg "lazygit"

    set PATH "$PATH:$HOME/.config/rofi/scripts:$HOME/.bin:$HOME/.emacs.d/bin"
    starship init fish | source
    set fish_tmux_default_session_name "JunioKOI"


end


fish_add_path /home/junio/.spicetify
