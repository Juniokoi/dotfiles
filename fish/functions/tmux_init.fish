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
