# Builds local configuration files.

hostname := $(shell hostname)
hostdir := host/$(hostname)
hostfiles := $(shell find "$(hostdir)" -type f)
files := $(hostfiles:$(hostdir)/%=local/%)
files := $(files:.m4=)

all: $(files)

clean:
	rm -rf local

stow: all
	stow -R home local

local/%: host/$(hostname)/%
	mkdir -p $(dir $@)
	cp $^ $@

local/%: host/$(hostname)/%.m4
	mkdir -p $(dir $@)
	m4 -Ihost $^ > $@

.DELETE_ON_ERROR: $(files)
.PHONY: all clean stow
