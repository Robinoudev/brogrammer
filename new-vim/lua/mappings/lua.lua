local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- NORMAL MODE
map("n", "<silent><esc>", ":noh<CR>")
map("n", "<leader>bd", ":bd<CR>")
map("n", "<leader>gs", ":G<CR>")
map("n", "<leader>gp", ":Git push <Space>")
map("n", "<leader>gh", ":diffget //3<CR>")
map("n", "<leader>gu", ":diffget //2<CR>")
map("n", "<leader>q", ":q<CR>")
map("n", "Y", "y$")

    -- file navigation
map("n", "<C-h>", "<C-w><C-h>")
map("n", "<C-l>", "<C-w><C-l>")
map("n", "<C-j>", "<C-w><C-j>")
map("n", "<C-k>", "<C-w><C-k>")

    -- very magic
map("n", "/", "/\v")
map("n", "?", "?\v")

-- VISUAL MODE
map("v", "<leader>p", '"_dP')

    --indent and keep selection
map("v", "<", "<gv")
map("v", ">", ">gv")

    -- very magic in visual mode
map("v", "/", "/\v")
map("v", "?", "?\v")

-- COMMAND MODE
    -- Yank the current file to the system clipboard
map("c", "yf!!", "!echo % <bar> xclip -selection clipboard")

    -- Save file as sudo on files that require root permission
map("c", "w!!", "execute 'silent! write !sudo tee % >/dev/null' <bar> edit!")

-- INSERT MODE

-- TELESCOPE

-- LSP
