# Builds local configuration files.

hostname := $(shell hostname)
# If there is no host directory for this system, use the
# common one instead.
hostdir := $(or $(wildcard host/$(hostname)),host/common)
hostfiles := $(shell find "$(hostdir)" -type f)
files := $(hostfiles:$(hostdir)/%=local/%)
files := $(files:.m4=)

all: $(files)

clean:
	rm -rf local

stow: all
	stow -R home local

local/%: $(hostdir)/%
	mkdir -p $(dir $@)
	cp $^ $@

local/%: $(hostdir)/%.m4
	mkdir -p $(dir $@)
	m4 -Ihost $^ > $@

.DELETE_ON_ERROR: $(files)
.PHONY: all clean stow
