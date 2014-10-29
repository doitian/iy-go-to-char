README.md: iy-go-to-char.el make-readme-markdown.el
	echo '[![Stories in Ready](https://badge.waffle.io/doitian/iy-go-to-char.png?label=ready&title=Ready)](https://waffle.io/doitian/iy-go-to-char)' >$@
	emacs --script make-readme-markdown.el <iy-go-to-char.el >>$@ 2>/dev/null
deps: make-readme-markdown.el
publish:
	cat iy-go-to-char.el | pbcopy
	open 'http://www.emacswiki.org/emacs/?action=edit;id=iy-go-to-char.el'
make-readme-markdown.el:
	curl -k -L -o $@ https://raw.github.com/mgalgs/make-readme-markdown/master/make-readme-markdown.el
.PHONY: deps publish
