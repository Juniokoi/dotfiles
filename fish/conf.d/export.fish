fish_add_path -g $HOME/node_modules/yarn/bin/
fish_add_path -g $GOPATH/bin
fish_add_path -g ~/bin ~/node_modules/bin

set -gx EDITOR nvim
set -gx GPG_TTY (tty)
set -gx GOPATH $HOME/.local/go
set fish_color_error red --bold --italic
set DOTFILES_CONFIG_DIR $HOME/.dotfiles

set -gx WINIT_X11_SCALE_FACTOR 1.2
