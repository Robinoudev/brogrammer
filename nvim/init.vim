scriptencoding utf-8

" settings ------------------------------------------ {{{
let mapleader=" "
if has('termguicolors')
    set termguicolors
endif
set number                            " Line numbers
set relativenumber                    " Numbers relative to current line
set hidden                            " Make it possible to hide unsaved buffers
set shiftwidth=4
set tabstop=4                         " A tab counts for 4 spaces
set expandtab                         " Convert tabs to spaces
set splitbelow splitright             " Split new files to the right and under current buffer
set nowrap                            " Don't wrap lines that exceed the window view
set cursorline                        " Highlight the line of the cursor
set scrolloff=6                       " Minimal no. of screen lines to keep above or
                                      " under cursor

if exists('$SUDO_USER')
  set nobackup                        " don't create root-owned files
  set nowritebackup                   " don't create root-owned files
else
  set backupdir=~/.vim/tmp/backup     " keep backup files out of the way
  set backupdir+=.
endif

set updatetime=2000                   " no. of ms of inactivity it takes to update swap
                                      " or execute `CursorHold` autocommand
set path+=**                          " extend path into all subdirectories

set shortmess+=c                      " remove messages from ins-completion-menu
set shortmess+=A                      " remove swap file messages
set shortmess+=I                      " remove intro screen
set shortmess+=O                      " file-read message overwrites previous
set shortmess+=T                      " truncate non-file messages in middle
set shortmess+=W                      " don't echo "[w]"/"[written]" when writing
set shortmess+=a                      " use abbreviations in messages eg. `[RO]` instead of `[readonly]`
set shortmess+=o                      " overwrite file-written messages
set shortmess+=t                      " truncate file messages at start

set ignorecase                        " ignore case of normal letters
set smartcase                         " only ignore the above when pattern has lower case letters only
set incsearch                         " when typing a search, show where the pattern matches

set signcolumn=yes:1                  " Always show a signcolumn on the left
" }}}
