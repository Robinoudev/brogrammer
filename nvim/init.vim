scriptencoding utf-8

" basics ------------------------------------------ {{{
let mapleader=" "
if has('termguicolors')
    set termguicolors
fi
set number                  " Line numbers
set relativenumber          " Numbers relative to current line
set hidden                  " Make it possible to hide unsaved buffers
set shiftwidth=4
set tabstop=4               " A tab counts for 4 spaces
set expandtab               " Convert tabs to spaces
set splitbelow splitright   " Split new files to the right and under current buffer
" }}}
