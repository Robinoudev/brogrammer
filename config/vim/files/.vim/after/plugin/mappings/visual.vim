" Move selected line op or down and keep indentation
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Delete selected text without overwriting register
vnoremap X "_d

" paste over selected text without overwriting register
vnoremap <leader>p "_dP

" Indent selected lines and keep selection
vmap < <gv
vmap > >gv
