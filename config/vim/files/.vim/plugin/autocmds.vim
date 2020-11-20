if has('nvim')
    autocmd BufEnter * lua require'robin.autocmds'.buf_enter()
    autocmd FocusLost * lua require'robin.autocmds'.focus_lost()
    autocmd FocusGained * lua require'robin.autocmds'.focus_gained()
    autocmd VimEnter * lua require'robin.autocmds'.vim_enter()
    autocmd WinEnter * lua require'robin.autocmds'.win_enter()
    autocmd WinLeave * lua require'robin.autocmds'.win_leave()
endif

" automatically delete trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e
