-- check if packer is installed (~/local/share/nvim/site/pack)
local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

-- using { } when using a different branch of the plugin or loading the plugin with certain commands
return require("packer").startup(
    function()
        use {"wbthomason/packer.nvim", opt = true}

        -- LSP stuff
        use "neovim/nvim-lspconfig"
        use "hrsh7th/nvim-compe"
        use "onsails/lspkind-nvim"
        use "tjdevries/nlua.nvim"
        use "tjdevries/lsp_extensions.nvim"
        -- Plug 'nvim-lua/completion-nvim'

        -- telescope
        use "nvim-telescope/telescope.nvim"
        use "nvim-telescope/telescope-media-files.nvim"
        use "nvim-lua/popup.nvim"
        use "nvim-lua/plenary.nvim"

        -- utils
        use "windwp/nvim-autopairs"
        use "alvan/vim-closetag"
        use "tweekmonster/startuptime.vim"
        use "karb94/neoscroll.nvim"
        use "sbdchd/neoformat"
        use {"lukas-reineke/indent-blankline.nvim", branch = "lua"}
        use 'mbbill/undotree'
        use 'wsdjeg/vim-fetch'
        use 'justinmk/vim-dirvish'


        -- Debugger Plugins
        use 'puremourning/vimspector'
        use 'szw/vim-maximizer'

        -- tpope...
        use 'tpope/vim-repeat'
        use 'tpope/vim-unimpaired'
        use 'tpope/vim-commentary'
        use 'tpope/vim-projectionist'
        use 'tpope/vim-dispatch'
        use 'tpope/vim-fugitive'
        use 'tpope/vim-surround'

        -- tree shitter
        use "nvim-treesitter/nvim-treesitter"

        -- colors & UI
        use "ryanoasis/vim-devicons"
        use "norcalli/nvim-colorizer.lua"
        use "nekonako/xresources-nvim"
        use "norcalli/nvim-base16.lua"
        use "kyazdani42/nvim-web-devicons"
        use "kyazdani42/nvim-tree.lua"
        use "lewis6991/gitsigns.nvim"
        use "akinsho/nvim-bufferline.lua"
        use "glepnir/galaxyline.nvim"
    end
)
