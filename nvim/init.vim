scriptencoding utf-8

" basics ------------------------------------------ {{{
let mapleader=" "
if has('termguicolors')
    set termguicolors
endif
set number                  " Line numbers
set relativenumber          " Numbers relative to current line
set hidden                  " Make it possible to hide unsaved buffers
set shiftwidth=4
set tabstop=4               " A tab counts for 4 spaces
set expandtab               " Convert tabs to spaces
set splitbelow splitright   " Split new files to the right and under current buffer
set nowrap                  " Don't wrap lines that exceed the window view
set cursorline              " Highlight the line of the cursor
set scrolloff=6             " Minimal no. of screen lines to keep above or under cursor

if exists('$SUDO_USER')
  set nobackup                        " don't create root-owned files
  set nowritebackup                   " don't create root-owned files
else
  set backupdir=~/.vim/tmp/backup     " keep backup files out of the way
  set backupdir+=.
endif
" }}}
