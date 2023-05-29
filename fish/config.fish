if status is-interactive
	set fish_greeting
	starship init fish | source
	zoxide init fish | source

	enable_transience
end


# Turso
export PATH="/home/junio/.turso:$PATH"
