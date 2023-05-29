function overlay -d 'Switch core utils with enhanced ones'
	va $argv

	if command -sq $argv[2]
		alias $argv[1] $argv[2]
	end
end
