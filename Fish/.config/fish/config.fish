set fish_greeting
if status is-interactive
set CONFIG "$HOME/.config"
set DOT "$HOME/.dotfiles"

  alias vim nvim
  alias fc "vim $CONFIG/fish/config.fish"
  alias bc "vim $CONFIG/bspwm/bspwmrc"
  alias sc "vim $CONFIG/sxhkd/sxhkdrc"
  alias wc "vim $CONFIG/wezterm/wezterm.lua"
  alias vc "vim $CONFIG/nvim/init.lua"
  alias cdot "cd $HOME/.dotfiles/"
  alias supersudo "sudo --preserve-env=PATH env"
  alias c clear
  alias cl clear
  alias f fish
  alias sayonara "sudo shutdown -h now"
  alias logoff "sudo pkill -KILL -u $USER"

  alias ls "exa --icons --color=always --color-scale --sort type "
  alias la "ls -@lah"
  alias lt "ls -T"
  alias cat "bat --style full --theme dracula"

  alias au "yay -Syyuu --noconfirm"

  ## GIT
  alias gs "git-st"
  alias gc "git commit -m"
  alias gl "git lg"
  alias glo "git log --oneline"
  alias ga "git add"

  set PATH "$PATH:$HOME/.config/rofi/scripts:$HOME/.bin"
  starship init fish | source
end


fish_add_path /home/junio/.spicetify
