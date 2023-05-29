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
function _editor;$EDITOR; end
bind -M default \cf '_editor'
bind -M insert \cf '_editor'

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
