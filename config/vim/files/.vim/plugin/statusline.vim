" scriptencoding utf-8

" if has('nvim')
"     lua require'robin.statusline'.init()

"     augroup RobinStatusLine
"         autocmd!
"         autocmd ColorScheme * lua require'robin.statusline'.update_highlight()
"         autocmd BufWinEnter,BufWritePost,FileWritePost,TextChanged,TextChangedI,WinEnter * lua require'robin.statusline'.update_highlight()
"     augroup END
" endif
