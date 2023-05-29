function has -d 'alias second arg if first exist'
	va $argv

	if command -sq $argv[1]
		alias $argv[2]
	end
end
