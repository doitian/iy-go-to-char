[![Stories in Ready](https://badge.waffle.io/doitian/iy-go-to-char.png?label=ready&title=Ready)](https://waffle.io/doitian/iy-go-to-char)
## iy-go-to-char.el
*Go to next CHAR which is similar to "f" and "t" in vim*

---
[![License GPLv2](https://img.shields.io/badge/license-GPL_v2-green.svg)](http://www.gnu.org/licenses/gpl-2.0.html)
[![MELPA](http://melpa.org/packages/iy-go-to-char-badge.svg)](http://melpa.org/#/iy-go-to-char)

This package defines the function `iy-go-to-char` which behaves like "f" in
vim, and `iy-go-up-to-char` like "t" in vim.  It reads a char and go the
next Nth occurence of the char.  User can continue such search using that
char key.

To use, make sure this file is on your `load-path` and put the
following in your .emacs file:

    (require 'iy-go-to-char)

To make `iy-go-to-char` works better with `multiple-cursors`, add
`iy-go-to-char-start-pos` to `mc/cursor-specific-vars` when mc is loaded:

    (add-to-list 'mc/cursor-specific-vars 'iy-go-to-char-start-pos)

Then you can bind functions like:

    (global-set-key (kbd "C-c f") 'iy-go-to-char)
    (global-set-key (kbd "C-c F") 'iy-go-to-char-backward)
    (global-set-key (kbd "C-c ;") 'iy-go-to-or-up-to-continue)
    (global-set-key (kbd "C-c ,") 'iy-go-to-or-up-to-continue-backward)

Or if you prefer up-to (vim "t") versions:

    (global-set-key (kbd "C-c f") 'iy-go-up-to-char)
    (global-set-key (kbd "C-c F") 'iy-go-up-to-char-backward)

You also can bind go-to methods and up-to methods to different keys.

Except repeating the char key, followings keys are defined before
quitting the search (which can be disabled by setting
`iy-go-to-char-override-local-map` to nil):

   X   -- where X is the char to be searched. Repeating it will search
          forward the char. Can be disabled through
          `iy-go-to-char-continue-when-repeating`

   ;   -- search forward the char, customizable:
          `iy-go-to-char-key-forward`, `iy-go-to-char-use-key-forward`

   ,   -- search backward the char, customizable:
          `iy-go-to-char-key-backward`, `iy-go-to-char-use-key-backward`

   C-g -- quit

   C-s -- start `isearch-forward` using char as initial search
          string

   C-r -- start `isearch-backward` using char as initial search
          string

   C-w -- quit and kill region between start and current point.  If region is
          activated before search, then use the original mark instead of the
          start position.

   M-w -- quit and save region between start and current point.  If region is
          activated before search, use the mark instead of start position.

All other keys will quit the search.  Then the key event is
intepreted in the original environment before search.

if the search quits because of error or using "C-g", point is set
back to the start position.  Otherwise, point is not change and the
start position is set as marker.  So you can use "C-x C-x" back to
that position.

`iy-go-to-char-backward` search backward by default.  Also the search can
cross lines.  To continue search last char, use `iy-go-to-char-continue` and
`iy-go-to-char-continue-backward`.

### Change Log

2014-10-29 (3.2.2)

   - Add options `iy-go-to-char-use-key-forward`,
     `iy-go-to-char-use-key-backward` and
     `iy-go-to-char-continue-when-repeating` to toggle the feature that
     continuing search by repeat typing a single key.
   - Add option `iy-go-to-char-override-local-map` to disable the temporary
     map after activate `iy-go-to-char`.

2013-04-28 (3.2.1)

   - Fix documentations.
   - Add up-to versions: `iy-go-up-to-char`, `iy-go-up-to-char-backward`,
     `iy-go-up-to-char-continue` and `iy-go-up-to-char-continue-backward`.

2013-04-28 (3.1)

   - Better integration with `multiple-cursors`.
   - Refactoring documentations.

2013-04-08 (3.0)

   - When jump is started backward (with negative parameter, or
     `iy-go-to-char-backward`). Repeating continues the search
     backward. Also `iy-go-to-char-key-forward` jumps with the same
     direction when jump is started, and `iy-go-to-char-key-backward` jumps
     to reverse direction.

2013-03-25 (2.1)
   - Fix a but that I forget to set `mc--this-command`

2013-03-25 (2.0)
   - Use overriding-local-map to setup keymap
   - multiple-cursors compatible

2012-04-16 (1.1)
   - fix C-s/C-r to enter isearch

### Function Documentation


#### `(iy-go-to-char-done)`

Finish iy-go-to-char-mode.

#### `(iy-go-to-char-quit)`

Quit iy-go-to-char-mode.

#### `(iy-go-to-char-pass-through)`

Finish iy-go-to-char-mode and invoke the corresponding command.

#### `(iy-go-to-char-isearch)`

Start isearch using the char.

#### `(iy-go-to-char-isearch-backward)`

Start isearch backward using the char.

#### `(iy-go-to-char-kill-region)`

Kill region between jump start position and current position.

#### `(iy-go-to-char-kill-ring-save)`

Save region between jump start position and current position.

#### `(iy-go-to-char N CHAR)`

Move forward to N occurrences of CHAR.

Uses keymap `iy-go-to-char-keymap`, which is not currently defined.


Typing key of CHAR will move to the next occurence of CHAR.

Typing `iy-go-to-char-key-forward` will move to the next
occurence of CHAR.

Typing `iy-go-to-char-key-backward`, will move to the previous
occurence of CHAR.

Typing M-x iy-go-to-char-quit will quit and return to the
original point.

Typing M-x iy-go-to-char-isearch or
M-x iy-go-to-char-isearch-backward] will start `isearch` using
CHAR.

Typing M-x iy-go-to-char-kill-region or
M-x iy-go-to-char-kill-ring-save will kill/copy between current
point and the start point.

Unless quit using M-x iy-go-to-char-quit or the region is
activated before searching, the start point is set as mark.

#### `(iy-go-to-char-backward N CHAR)`

Move backward to N occurence of CHAR.

Uses keymap `iy-go-to-char-keymap`, which is not currently defined.


Typing key of CHAR will move to the previous occurence of CHAR.

Typing `iy-go-to-char-key-forward` moves to the next occurrence
of CHAR.

Typing `iy-go-to-char-key-backward`, moves to the previous
occurrence of CHAR.

Typing M-x iy-go-to-char-quit will quit and return to the
original point.

Typing M-x iy-go-to-char-isearch or
M-x iy-go-to-char-isearch-backward] will start `isearch` using
CHAR.

#### `(iy-go-up-to-char N CHAR)`

Move forward to N occurrences of CHAR.
Like `iy-go-to-char` but jump up to the CHAR so it is
not included in the region between search start position and
current point.

#### `(iy-go-up-to-char-backward N CHAR)`

Move backward to N occurrences of CHAR.
Like `iy-go-to-char-backward` but jump up to the CHAR so it is
not included in the region between search start position and
current point.

#### `(iy-go-to-or-up-to-continue N &optional STOP-POSITION)`

Continue last `iy-go-to-char` or `iy-go-to-char-backward` by N steps.
Set `STOP-POSITION` to overwrite the last used stop position strategy.

#### `(iy-go-to-or-up-to-continue-backward N &optional STOP-POSITION)`

Continue last `iy-go-to-char` or `iy-go-to-char-backward` by N steps.
Set `STOP-POSITION` to overwrite the last used stop position strategy.

#### `(iy-go-to-char-continue N)`

Continue last `iy-go-to-char` or `iy-go-to-char-backward` by N steps.

#### `(iy-go-to-char-continue-backward N)`

Continue last `iy-go-to-char` or `iy-go-to-char-backward` by N steps.

#### `(iy-go-up-to-char-continue N)`

Continue last `iy-go-up-to-char` or `iy-go-up-to-char-backward` by N steps.

#### `(iy-go-up-to-char-continue-backward N)`

Continue last `iy-go-up-to-char` or `iy-go-up-to-char-backward` by N steps.

-----
<div style="padding-top:15px;color: #d0d0d0;">
Markdown README file generated by
<a href="https://github.com/mgalgs/make-readme-markdown">make-readme-markdown.el</a>
</div>
