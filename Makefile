include depends.mk

pages := index.html prototype1.html prototype2.html
assets := styles/bootstrap.min.css scripts/masonry.min.js

all: $(pages:%=out/%) $(assets:%=out/%)

clean:
	$(RM) depends.mk out/*.html out/styles/*.css out/scripts/*.js

.PHONY: all clean

depends.mk: flake.lock
	nix build '.#masonryLayout' '.#twitterBootstrap' --print-out-paths --no-link \
		| sed -e '1s/^/masonry := /' -e '2s/^/bootstrap := /' >$@

out/%.html: macros.m4 %.html.m4
	m4 $^ >$@

out/%.html: %.html
	cp $< $@

out/styles/%: $(bootstrap)/css/%
	mkdir -p out/styles
	cp $< $@

out/scripts/masonry.min.js: $(masonry)
	mkdir -p out/scripts
	cp $< $@
