vim.cmd [[packadd nvim-lspconfig]]
vim.cmd [[packadd nvim-compe]]

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

local custom_attach = function (client)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    if vim.api.nvim_buf_get_option(0, 'filetype') == 'rust' then
       vim.cmd [[autocmd BufEnter,BufWritePost <buffer> :lua require('lsp_extensions.inlay_hints').request { aligned = true, prefix = " » " }]]
    end

    -- Mappings.
    local opts = {noremap = true, silent = true}
    buf_set_keymap("n", "<leader>cd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', '<leader>ch', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', '<leader>crr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<leader>crn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<leader>cld', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
    buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
    buf_set_keymap("n", "<space>ce", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
    buf_set_keymap("n", "<space>cq", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)

    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    elseif client.resolved_capabilities.document_range_formatting then
        buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
    end
end

lspconfig.tsserver.setup({
    on_attach = custom_attach
})
lspconfig.solargraph.setup({
    on_attach = custom_attach,
    settings = { solargraph = { diagnostics = true; formatting = true; logLevel = 'debug'; } }
})
lspconfig.clangd.setup({
    on_attach = custom_attach
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
lspconfig.elixirls.setup({
    on_attach = custom_attach,
    cmd = { "/usr/local/bin/language_server.sh" }
})
lspconfig.pyls.setup({
    on_attach = custom_attach,
    cmd = { "pyls" }
})

local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end

local sumneko_root_path
if vim.fn.has("mac") == 1 then
  sumneko_root_path = "/Users/robin/personal/brogrammer/programs/sumneko_lua"
elseif vim.fn.has("unix") == 1 then
  sumneko_root_path = "/home/robin/.local/programs/lua-language-server/bin/Linux/lua-language-server"
end

local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

lspconfig.sumneko_lua.setup({
    on_attach = custom_attach,
    -- cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua"}
    cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = vim.split(package.path, ';'),
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                },
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    }
})
