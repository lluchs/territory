function sudop -d "Call sudo preserving the current PATH"
	sudo env PATH=(echo $PATH | sed 's/ /:/g') $argv
end
