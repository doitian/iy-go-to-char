README.md: iy-go-to-char.el
	emacs --script $< <iy-go-to-char.el >$@ 2>/dev/null
deps: make-readme-markdown.el
make-readme-markdown.el:
	curl -k -L -o $@ https://raw.github.com/mgalgs/make-readme-markdown/master/make-readme-markdown.el
.PHONY: make-readme-markdown.el deps
