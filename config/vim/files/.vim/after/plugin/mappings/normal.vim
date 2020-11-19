nnoremap <silent><leader>bd :bd<CR>

" clear search highlight with escape
nnoremap <silent> <esc> :noh<cr>

" Git mappings {{{
nmap <silent><leader>gs :G<CR>
nmap <leader>gp :Git push<Space>
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gc :GBranches<CR>
nmap <leader>gfa :Git fetch --all --prune<CR>
" }}}

" Search mappings {{{
" Turn on 'verymagic' mode when searching
nnoremap / /\v
nnoremap ? ?\v

nnoremap <C-p> :GF<CR>
nnoremap <leader>pf :Files<CR>
nnoremap <leader>ps :Rg<Space>
nnoremap <leader>pv :Vex <bar> :vertical resize 30

" This mapping works as follows;
" <C-R> (or, control R) allows you to access a register in the command line. The
" `=` register is the `regular expression` registar. Which means that whatever
" value comes out of the regular expression will we entered.
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
" }}}

" toggle folds w/ shift tab
nnoremap , za

" Yank from cursor to end of line
nnoremap Y y$

" Folds and splits {{{
nnoremap <C-h> <C-w><C-h>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
" }}}
