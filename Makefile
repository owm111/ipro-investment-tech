include depends.mk

outdir ?= docs
pages := index.html prototype1.html prototype2.html
assets := styles/bootstrap.min.css scripts/masonry.min.js
sitefiles := $(pages:%=$(outdir)/%) $(assets:%=$(outdir)/%)
sitejunk := $(outdir)/*.html $(outdir)/styles/*.css $(outdir)/scripts/*.js

all: $(sitefiles)

clean:
	$(RM) depends.mk $(sitejunk)

.PHONY: all clean

depends.mk: flake.lock
	nix build '.#masonryLayout' '.#twitterBootstrap' --print-out-paths --no-link \
		| sed -e '1s/^/masonry := /' -e '2s/^/bootstrap := /' >$@

$(outdir)/%.html: macros.m4 %.html.m4
	mkdir -p $(outdir)
	m4 $^ >$@

$(outdir)/%.html: %.html
	mkdir -p $(outdir)
	cp $< $@

$(outdir)/styles/%: $(bootstrap)/css/%
	mkdir -p $(outdir)/styles
	cp $< $@

$(outdir)/scripts/masonry.min.js: $(masonry)
	mkdir -p $(outdir)/scripts
	cp $< $@
