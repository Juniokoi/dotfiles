function has_alias -d 'Alias first argument with second if first exists '
	va $argv

	if command -sq $argv[1]
		alias $argv[1] $argv[2]
	end
end
