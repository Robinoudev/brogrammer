nnoremap <leader>bd :bd<CR>
nnoremap / /\v

" clear search highlight with escape
nnoremap <Esc> :noh<CR>

" Git mappings {{{
nmap <silent><leader>gs :G<CR>
nmap <leader>gp :Git push<Space>
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gc :GBranches<CR>
nmap <leader>gfa :Git fetch --all --prune<CR>
" }}}
