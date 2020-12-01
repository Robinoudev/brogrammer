" Yank the current file to the system clipboard
cnoremap yf!! !echo % <bar> xclip -selection clipboard

" Save file as sudo on files that require root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

com! W w
