scriptencoding utf-8

if v:progname == 'vi'
    set noloadplugins                 " don't load plugins when launching vi
endif

" settings {{{
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
set autoindent                        " copy indent when starting a new line from previous line
set splitbelow splitright             " Split new files to the right and under current buffer
set nowrap                            " Don't wrap lines that exceed the window view
set cursorline                        " Highlight the line of the cursor
set scrolloff=6                       " Minimal no. of screen lines to keep above or
                                      " under cursor
set sidescroll=0                      " sidescroll in jumps because terminals are slow
set sidescrolloff=3                   " same as scrolloff, but for columns

if exists('$SUDO_USER')
  set nobackup                        " don't create root-owned backup files
  set nowritebackup                   " don't create root-owned backup files
  set noswapfile                      " don't create root-owned swap files
else
  set backupdir=~/.vim/tmp/backup     " keep backup files out of the way
  set backupdir+=.
  set directory=~/.vim/tmp/swap//     " keep swap files out of the way
  set directory+=.
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
set signcolumn=yes:1                  " always show a signcolumn on the left
set undofile                          " keep track of changes and undos so vim doesn't forget
set undodir=~/.vim/undodir
set noerrorbells                      " no error bells when hitting esc in normal mode etc.

set inccommand=split                  " show preview of in preview window (eg. %s/../../g)
set list                              " show all characters defined in `listchars`
set shada=!,'1000,<50,s10,h           " make vim remember histories of previous sessions

set fillchars=eob:~                   " indicate end of buffer with the `~` character
set fillchars+=fold:·                 " dotted line for folds
set fillchars+=diff:∙                 " show deleted lines in diff mode as a dot
set fillchars+=vert:┃                 " thicker vertical line for splits

set pumblend=25                     " give the popup window transparency
set wildmode=longest:full,full      " shell like autocomplete in command mode
" }}}

" {{{ plugins
if &loadplugins
    if has('packages')
        packadd! vim-repeat
    endif
endif
" }}}
