-- load plugins
require "pluginsList.lua"
require "file-icons.lua"

require "settings.lua"
require "bufferline.lua"
require "statusline.lua"

require("colorizer").setup()
require("neoscroll").setup() -- smooth scroll

-- lsp
require "lspconfig.lua"
require "compe.lua"

-- basic settings

local cmd = vim.cmd
local g = vim.g

g.mapleader = " "

cmd "syntax enable"
cmd "syntax on"

local base16 = require "base16"
base16(base16.themes["default-dark"], true)

local indent = 2

g.indentLine_enabled = 1
g.indent_blankline_char = "▏"


cmd "hi IndentBlanklineChar guifg=#2a2e36"

g.indent_blankline_filetype_exclude = {"help", "terminal"}
g.indent_blankline_buftype_exclude = {"terminal"}

g.indent_blankline_show_trailing_blankline_indent = false
g.indent_blankline_show_first_indent_level = false

require("treesitter.lua")
require("mappings.lua")

-- highlights --
cmd "hi LineNr guifg=#383c44 guibg=NONE"
-- cmd "hi Comment guifg=#3d4149"
cmd "hi SignColumn guibg=NONE"
cmd "hi VertSplit guibg=NONE guifg=#2a2e36"
cmd "hi EndOfBuffer guifg=#1e222a"
cmd "hi PmenuSel guibg=#98c379"
cmd "hi Pmenu  guibg=#282c34"

-- telescope stuff and popupmenu
require "telescope.lua"

cmd "hi TelescopeBorder   guifg=#2a2e36"
cmd "hi TelescopePromptBorder   guifg=#2a2e36"
cmd "hi TelescopeResultsBorder  guifg=#2a2e36"
cmd "hi TelescopePreviewBorder  guifg=#525865"

--  nvim tree color for folder name and icon
require "nvimTree.lua"

cmd "hi NvimTreeFolderIcon guifg = #61afef"
cmd "hi NvimTreeFolderName guifg = #61afef"
cmd "hi NvimTreeIndentMarker guifg=#383c44"

cmd "hi Normal guibg=NONE ctermbg=NONE"

-- git signs
require "gitsigns.lua"

cmd "hi DiffAdd guifg=#81A1C1 guibg = none"
cmd "hi DiffChange guifg =#3A3E44 guibg = none"
cmd "hi DiffModified guifg = #81A1C1 guibg = none"

require("nvim-autopairs").setup()
require("lspkind").init(
    {
        File = " "
    }
)

-- highlight yank
vim.api.nvim_exec([[
  au TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
]], true)

-- trim training whitespace
vim.api.nvim_exec([[
  fun! TrimWhitespace()
      let l:save = winsaveview()
      keeppatterns %s/\s\+$//e
      call winrestview(l:save)
  endfun

  autocmd BufWritePre * :call TrimWhitespace()
]], true)

-- hide line numbers in terminal windows
vim.api.nvim_exec([[
   au BufEnter term://* setlocal nonumber norelativenumber
]], false)

-- inactive statuslines as thin splitlines
cmd("highlight! StatusLineNC gui=underline guibg=NONE guifg=#383c44")
