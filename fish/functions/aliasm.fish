function aliasm -d 'Apply many aliases at once'
	begin
		set i (count $argv)
	end
	if test $i -lt 3
		echo"use an alias instead"
		return
	end


	for item in (seq $i)[..-2]
		alias "$argv[$item]" "$argv[$i]"
	end
end
