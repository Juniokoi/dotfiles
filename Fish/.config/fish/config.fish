set fish_greeting
if status is-interactive
    zoxide init fish | source
    starship init fish | source

    set XDG_HOME_CONFIG "$HOME/.config"
    set CONFIG "$XDG_HOME_CONFIG"
    set WM_CONFIG "$CONFIG/i3/config"
    set DOT "$HOME/.dotfiles"

    set BROWSER "/usr/bin/microsoft-edge-stable"
    set TERMINAL "/usr/bin/kitty"

    alias vim nvim
    alias fc "vim $CONFIG/fish/config.fish"
    alias bc "vim $CONFIG/bspwm/bspwmrc"
    alias sc "vim $CONFIG/sxhkd/sxhkdrc"
    alias wc "vim $CONFIG/wezterm/wezterm.lua"
    alias vc "vim $CONFIG/nvim/init.lua"
    alias pc "vim $CONFIG/picom.conf"
    alias kc "vim $CONFIG/kitty/kitty.conf"
    alias tc "vim $HOME/.tmux.conf"
    alias hc "vim $CONFIG/hypr/hyprland.conf"

    alias cd z
    alias wmc "vim $WM_CONFIG"
    alias cfg "cd $CONFIG"
    alias www "cd $HOME/www/"
    alias cdot "cd $DOT"
    alias downloads "cd $HOME/Downloads/"
    alias supersudo "sudo --preserve-env=PATH env"
    alias c clear
    alias cl clear
    alias f fish
    alias sayonara "shutdown -h now"
    alias logoff "pkill -KILL -u $USER"

    alias ls "exa --icons --color=always --color-scale --sort type "
    alias la "ls -@lah --git"
    alias lt "ls -T"
    alias lta "ls -Ta"
    alias cat "bat --style full --theme Dracula"

    alias au "yay -Syyuu --noconfirm"

    ## GIT
    alias gs "git-st"
    alias gc "git commit -m"
    alias gl "git lg"
    alias glo "git log --oneline"
    alias ga "git add"
    alias lg "lazygit"

    set PATH "$PATH:$HOME/.local/bin:$HOME/.config/rofi/scripts:$HOME/.bin:$HOME/.emacs.d/bin"
    set fish_tmux_default_session_name "JunioKOI"


end


fish_add_path /home/junio/.spicetify
