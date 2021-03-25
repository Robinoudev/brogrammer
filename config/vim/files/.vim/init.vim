call plug#begin('~/.vim/plugged')
    " Plebvim lsp Plugins
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-lua/completion-nvim'
    Plug 'tjdevries/nlua.nvim'
    Plug 'tjdevries/lsp_extensions.nvim'

    " Neovim Tree shitter
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/playground'

    " Debugger Plugins
    Plug 'puremourning/vimspector'
    Plug 'szw/vim-maximizer'

    " telescope requirements...
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzy-native.nvim'

    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-unimpaired'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-projectionist'
    Plug 'tpope/vim-dispatch'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'

    " FZF
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'stsewd/fzf-checkout.vim'

    Plug 'gruvbox-community/gruvbox'
    Plug 'octol/vim-cpp-enhanced-highlight'
    Plug 'rust-lang/rust.vim'
    Plug 'tweekmonster/gofmt.vim'
    Plug 'junegunn/gv.vim'
    Plug 'vim-utils/vim-man'
    Plug 'mbbill/undotree'
    Plug 'vuciv/vim-bujo'
    Plug 'justinmk/vim-dirvish'
    Plug 'wsdjeg/vim-fetch'
    Plug 'mkitt/tabline.vim'
    Plug 'hrsh7th/vim-vsnip'
    Plug 'hrsh7th/vim-vsnip-integ'
    Plug 'lambdalisue/gina.vim'
    Plug 'TimUntersberger/neogit'
    Plug 'pwntester/octo.nvim'

    " COLORS
    Plug 'colepeters/spacemacs-theme.vim'
    Plug 'sainnhe/gruvbox-material'
    Plug 'phanviet/vim-monokai-pro'
    Plug 'flazz/vim-colorschemes'
    Plug 'chriskempson/base16-vim'
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'matsuuu/pinkmare'

    " prettier
    Plug 'sbdchd/neoformat'
call plug#end()

filetype indent plugin on
syntax on

lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }

if executable('rg')
    let g:rg_derive_root='true'
endif

let loaded_matchparen = 1

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END

" JUST WRITE
com! W w

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup THE_PRIMEAGEN
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
    autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{}
augroup END
