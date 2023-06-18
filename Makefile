include depends.mk

pages := index.html prototype1.html
assets := styles/bootstrap.min.css

all: $(pages:%=out/%) $(assets:%=out/%)

clean:
	$(RM) depends.mk out/*

.PHONY: all clean

depends.mk: flake.lock
	nix build '.#twitterBootstrap' --print-out-paths --no-link \
		| sed -e '1s/^/bootstrap := /' >$@

out/%.html: %.html.m4
	m4 <$< >$@

out/%.html: %.html
	cp $< $@

out/styles/%: $(bootstrap)/css/%
	cp $< $@
