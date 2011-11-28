# vim

## Basic Usage

* Start vim with `vim` or `vim <filename>` to edit a specific file.
* Press `i` to enter Insert Mode.
* Type text.
* Press `esc`.
* Type `:wq` to write file and quit, or `:q!` to quit without saving. 

## Basic Commands

* esc = enter command mode 
* i = enter insert mode
* :w = write file
* :wq = write file and quit vim

### Movement

* j = move down
* k = move up
* h = move left
* l = move right
* 0 = move to start of line
* $ = move to end of line
* w = jump to next word start 
* e = jump to end of words
* b = jump to previous word start
* ^ = jump to first non-black character of line 
* gg = jump to start of file
* GG = Jump to end of file

### Insertion

* i = insert at cursor
* I = insert at beginning of line
* o = append below current line
* O = insert above current line

### Replacement

* r = replace single character
* ~ = switch case of character
* cw = change to end of word
* c$ = change to end of line
* cc = change entire line

### Cut

* x = cut current character
* dw = cut current word
* dd = cut line
* <number>dd = cut <number> lines

### Copy

* yw = copy a word
* y$ = copy to end of line
* yy = copy entire line
* <number>yy = copy <number> lines

### Paste

* p = paste clipboard after cursor
* P = paste clipboard before cursor

### Selection

* v = enter selection mode

## Resources

* [Janus: Carlhuda's vim Distribution](https://github.com/carlhuda/janus)
* [Vim Shortcuts
Wallpaper](http://naleid.com/blog/2010/10/04/vim-movement-shortcuts-wallpaper/)
* [Coming Home to
Vim](http://stevelosh.com/blog/2010/09/coming-home-to-vim/)
* [Markdown Vim Mode](http://plasticboy.com/markdown-vim-mode/)
* [25 Vim Tutorials, Screencasts, and Resources](http://net.tutsplus.com/articles/web-roundups/25-vim-tutorials-screencasts-and-resources/)


