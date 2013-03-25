# Go To Char


Like <key>f</key> in vim. It reads a char and go the next Nth occurence of
the char. User can continue such search using that char key.

To use, make sure this file is on your `load-path` and put the
following in your .emacs file:

    (require 'iy-go-to-char)

Then you can bind functions like:

    (global-set-key (kbd "C-c f") 'iy-go-to-char)
    (global-set-key (kbd "C-c F") 'iy-go-to-char-backward)
    (global-set-key (kbd "C-c ;") 'iy-go-to-char-continue)
    (global-set-key (kbd "C-c ,") 'iy-go-to-char-continue-backward)

Except repeating the char key, followings keys are defined before
quitting the search:

-   <key>;</key>   -- search forward the char, customizable:
          `iy-go-to-char-key-forward`

-   <key>,</key>   -- search backward the char, customizable: `iy-go-to-char-key-backward`

-   <key>C-g</key> -- quit

-   <key>C-s</key> -- start `isearch-forward` using char as initial search string

-   <key>C-r</key> -- start `isearch-backward` using char as initial search string

-   <key>C-w</key> -- quit and kill region between start and current point. If region is activated before search, then use the original mark instead of the start position.

-   <key>M-w</key> -- quit and save region between start and current point. If region is activated before search, use the mark instead of start position.

All other keys will quit the search. Then the key event is
intepreted in the original environment before search.

if the search quits because of error or using <key>C-g</key>, point is set
back to the start position. Otherwise, point is not change and the
start position is set as marker. So you can use <key>C-x C-x</key> back to
that position.

`iy-go-to-char-backward` search backward by default. Not like in
"vim", <key>;</key> is always searching forward and <key>,</key> is searching
backward, whether the search is started forward or backward. It
does be the same even when the search char is <key>;</key> or <key>,</key>. Also the
search can cross lines. To continue search last char, use
`iy-go-to-char-continue` and `iy-go-to-char-continue-backward`.

## Change Log:
-   2013-03-25 (2.0)
    - Use overriding-local-map to setup keymap
    - multiple-cursors compatible
-   2012-04-16 (1.1)
    - fix <key>C-s</key>/<key>C-r</key> to enter isearch

