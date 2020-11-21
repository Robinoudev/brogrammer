local vim = vim
local lspconfig = require('lspconfig')
local map_key = function(mode, key, result)
  vim.api.nvim_buf_set_keymap(0, mode, key, result, {noremap = true, silent = true})
end

-- menuone; also show popup menu with one result
-- noinsert; do not instert text untill i select a match
-- noselect; do not automatically select thi first option
vim.o.completeopt = "menuone,noinsert,noselect"

vim.cmd [[set shortmess+=c]] -- don't show ins-completion messages (eg. XX matches)
vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'} -- substring so fBB will complete to fooBarBaz
-- TODO: implement ultisnips
-- let g:completion_enable_snippet = 'UltiSnips'
vim.g.completion_trigger_keyword_length = 2 -- only show completion after 2 characters

-- change sign characters for LSP
vim.cmd [[sign define LspDiagnosticsSignError text=✖]]
vim.cmd [[sign define LspDiagnosticsSignWarning text=⚠]]
vim.cmd [[sign define LspDiagnosticsSignInformation text=ℹ]]
vim.cmd [[sign define LspDiagnosticsSignHint text=➤]]

local custom_attach = function(client)
    vim.cmd [[ packadd completion-nvim ]]
    local completion = require('completion')

    completion.on_attach(client)

      -- Rust is currently the only thing w/ inlay hints
    if vim.api.nvim_buf_get_option(0, 'filetype') == 'rust' then
        vim.cmd [[autocmd BufEnter,BufWritePost <buffer> :lua require('lsp_extensions.inlay_hints').request { aligned = true, prefix = " » " }]]
    end

    --
    --- Mappings
    --
    map_key('n', '<leader>vd', '<cmd>lua vim.lsp.buf.definition()<CR>')
    map_key('n', '<leader>vca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
    map_key('n', '<leader>vh', '<cmd>lua vim.lsp.buf.hover()<CR>')
    map_key('n', '<leader>vrr', '<cmd>lua vim.lsp.buf.references()<CR>')
    map_key('n', '<leader>vrn', '<cmd>lua vim.lsp.buf.rename()<CR>')
    map_key('n', '<leader>vsd', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')

    vim.cmd("setlocal omnifunc=v:lua.vim.lsp.omnifunc")
end

lspconfig.tsserver.setup({
    on_attach = custom_attach
})
lspconfig.solargraph.setup({
    on_attach = custom_attach,
    settings = { solargraph = { diagnostics = true; formatting = true; logLevel = 'debug'; } }
})
lspconfig.clangd.setup({
    on_attach = custom_attach,
    cmd = {"/usr/local/Cellar/llvm/11.0.0/bin/clangd"}
})
lspconfig.sumneko_lua.setup({
    on_attach = custom_attach,
})
lspconfig.rust_analyzer.setup({
    on_attach = custom_attach
})
lspconfig.elixirls.setup({
    on_attach = custom_attach,
})
lspconfig.vimls.setup({
    on_attach = custom_attach
})
lspconfig.bashls.setup({
    on_attach = custom_attach
})
