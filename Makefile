README.md: iy-go-to-char.el make-readme-markdown.el
	emacs --script make-readme-markdown.el <iy-go-to-char.el >$@ 2>/dev/null
deps:
	curl -k -L -o $@ https://raw.github.com/mgalgs/make-readme-markdown/master/make-readme-markdown.el
publish:
	cat iy-go-to-char.el | pbcopy
	open 'http://www.emacswiki.org/emacs/?action=edit;id=iy-go-to-char.el'
make-readme-markdown.el:
.PHONY: make-readme-markdown.el deps publish
