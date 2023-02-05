#!/usr/bin/env bash
#===============================================================================
#   Author: Wenxuan
#    Email: wenxuangm@gmail.com
#  Created: 2018-04-05 17:37
#===============================================================================

# $1: option
# $2: default value
tmux_get() {
    local value="$(tmux show -gqv "$1")"
    [ -n "$value" ] && echo "$value" || echo "$2"
}

# $1: option
# $2: value
tmux_set() {
    tmux set-option -gq "$1" "$2"
}

# Options
right_arrow_icon=$(tmux_get '@tmux_power_right_arrow_icon' '')
left_arrow_icon=$(tmux_get '@tmux_power_right_arrow_icon' '')
left_slash=''
right_slash=''
upload_speed_icon=$(tmux_get '@tmux_power_upload_speed_icon' '')
download_speed_icon=$(tmux_get '@tmux_power_download_speed_icon' '')
session_icon="$(tmux_get '@tmux_power_session_icon' '')"
user_icon="$(tmux_get '@tmux_power_user_icon' '')"
time_icon="$(tmux_get '@tmux_power_time_icon' '')"
date_icon="$(tmux_get '@tmux_power_date_icon' '')"
show_upload_speed="$(tmux_get @tmux_power_show_upload_speed false)"
show_download_speed="$(tmux_get @tmux_power_show_download_speed false)"
show_web_reachable="$(tmux_get @tmux_power_show_web_reachable false)"
prefix_highlight_pos=$(tmux_get @tmux_power_prefix_highlight_pos)
time_format=$(tmux_get @tmux_power_time_format '%H:%M')
#date_format=$(tmux_get @tmux_power_date_format '%F')
# short for Theme-Colour
TC=$(tmux_get '@tmux_power_theme' 'gold')
case $TC in
    'gold' )
        TC='#cba6f7'
        ;;
    'redwine' )
        TC='#b34a47'
        ;;
    'moon' )
        TC='#00abab'
        ;;
    'forest' )
        TC='#228b22'
        ;;
    'violet' )
        TC='#9370db'
        ;;
    'snow' )
        TC='#fffafa'
        ;;
    'coral' )
        TC='#ff7f50'
        ;;
    'sky' )
        TC='#87ceeb'
        ;;
    'default' ) # Useful when your term changes colour dynamically (e.g. pywal)
        TC="#cba6f7"
        ;;
esac

G01=#080808 #232
G02=#121212 #233
G03=#1c1c1c #234
G04=#262626 #235
G05=#303030 #236
G06=#3a3a3a #237
G07=#444444 #238
G08=#4e4e4e #239
G09=#585858 #240
G10=#626262 #241
G11=#6c6c6c #242
G12=#767676 #243


BG=default
FG=#232634 #232

# tmux-prefix-highlight
tmux_set @prefix_highlight_fg "$FG"
tmux_set @prefix_highlight_bg "$BG"
tmux_set @prefix_highlight_show_copy_mode 'on'
tmux_set @prefix_highlight_copy_mode_attr "fg=$TC,bg=$BG,bold"
tmux_set @prefix_highlight_output_prefix "#[fg=$TC]#[bg=$BG]$left_arrow_icon#[bg=$TC]#[fg=$BG]"
tmux_set @prefix_highlight_output_suffix "#[fg=$TC]#[bg=$BG]$right_arrow_icon"

#     
# Left side of status bar
tmux_set status-left-bg "$BG"
tmux_set status-left-fg "G12"
tmux_set status-left-length 150
user=$(whoami)
middle_color="$BG"
## User and host
LS="#[fg=#94e2d5,bg=$BG,bold]$left_arrow_icon#[fg=$G06,bg=#94e2d5,bold]  @$user#h #[fg=#94e2d5,bg=$middle_color,bold]#[bg=$BG]"
## Session name
LS="$LS#[fg=$G06,bg=$middle_color]$right_slash#[fg=$TC,bg=$G06] $session_icon #S#[fg=$G06,bg=$BG]$right_arrow_icon"
if "$show_upload_speed"; then
    LS="$LS#[fg=$G06,bg=$G05]$right_arrow_icon#[fg=$TC,bg=$G05] $upload_speed_icon #{upload_speed} #[fg=$G05,bg=$BG]$right_arrow_icon"
else
    LS="$LS"
fi
if [[ $prefix_highlight_pos == 'L' || $prefix_highlight_pos == 'LR' ]]; then
    LS="$LS"
fi

tmux_set status-left "$LS"

# Right side of status bar
tmux_set status-right-bg "$BG"
tmux_set status-right-fg "G12"
tmux_set status-right-length 150
## $G06 is the catpuccinn color purple
RS="#[fg=$G06,bg=$BG]$left_arrow_icon#[bg=$G06, fg=$TC]#[fg=$TC,bg=$G06]$time_icon $time_format#[fg=$G06,bg=$BG]$right_arrow_icon"
if "$show_download_speed"; then
    RS="#[fg=$G05,bg=$BG]$left_arrow_icon#[fg=$TC,bg=$G05] $download_speed_icon #{download_speed} $RS"
fi
if "$show_web_reachable"; then
    RS=" #{web_reachable_status} $RS"
fi
if [[ $prefix_highlight_pos == 'R' || $prefix_highlight_pos == 'LR' ]]; then
    RS="#{prefix_highlight}$RS"
fi
tmux_set status-right "$RS"
WS="#[fg=$BG,bg=$BG] "
number="#[fg=#f5e0dc,bg=$G06,nobold]#I"


# Window status
tmux_set window-status-current-format "$WS#[fg=$G06,bg=$BG]$left_arrow_icon$number#[fg=#aaaaaa,bg=$G06]·#[fg=$TC,bg=$G06,bold]#W #[fg=#a6e3a1,bg=$G06,nobold]󰝥 #[fg=$G06,bg=$BG,nobold]$right_arrow_icon"

tmux_set window-status-format "$WS#[fg=$G06,bg=$BG]$left_arrow_icon$number#[fg=#aaaaaa,bg=$G06]·#W #[fg=#aaaaaa,bg=$G06,nobold]󰝦 #[fg=$G06,bg=$BG,nobold]$right_arrow_icon"

# Window separator
tmux_set window-status-separator ""

# Window status alignment
tmux_set status-justify centre

# Current window status
tmux_set window-status-current-statys "fg=$TC,bg=$BG"

# Pane border
tmux_set pane-border-style "fg=#181825,bg=$BG"

# Pane number indicator
tmux_set display-panes-colour "$BG"
tmux_set display-panes-active-colour "$TC"

# Clock mode
tmux_set clock-mode-colour "$TC"
tmux_set clock-mode-style 24

