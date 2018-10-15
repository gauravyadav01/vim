# vim
vimrc and tip

https://vim.rtorr.com/

### Copy

- yy  : yank the current line, including the newline character at the end of the line
- y$  : yank to the end of the current line (but don't yank the newline character)
- yiw : yank the current word (excluding surrounding whitespace)
- yaw : yank the current word (including leading or trailing whitespace)
- ytx : yank from the current cursor position up to and before the character (til x)
- yfx : yank from the current cursor position up to and including the character (find x)

### DELTE

- diw : to delete the current word 
- ciw : to cut the current word 
- de  : is like diw, however it opens the opportunity to delete every next word just by pressing dot(.).
- di( : delete within the current parents.
- di" : to delete the text between the quotes.
- dab : delete around brackets.
- daB : delete around curly brackets.

### CUT 
 
ciw : to cut the current word.

ci" : cut the word inside the quotes.

ci( : cut the word in the parents.

C   : cut the rest of the line and enter INSERT MODE. This is very useful for cut and paste.


guu : lowercase line

gUU : uppercase line

~   : invert case (upper->lower; lower->upper) of current character

gf  : open file name under cursor (SUPER)

### Buffer
- :bd : Close current buffer 
- CTRL-w o : Delete all windows during split except one you are using


