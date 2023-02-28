[[ "$TTY" == /dev/tty* ]] || return 0
export $(systemctl --user show-environment)
export GPG_TTY="$TTY"

systemctl --user import-environment GPG_TTY 
