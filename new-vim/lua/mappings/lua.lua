local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- NORMAL MODE
map("n", "<esc>", ":noh<CR>", {silent = true})
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
map("n", "/", "/\\v")
map("n", "?", "?\\v")

  -- spawn terminal
map("n", "<C-S-x>", [[<Cmd>vnew term://zsh <CR>]]) -- open term over right
map("n", "<C-x>", [[<Cmd> split term://zsh | resize 10 <CR>]]) -- open term bottom

-- VISUAL MODE
map("v", "<leader>p", '"_dP')

    --indent and keep selection
map("v", "<", "<gv")
map("v", ">", ">gv")

    -- very magic in visual mode
map("v", "/", "/\\v")
map("v", "?", "?\\v")

-- COMMAND MODE
    -- Yank the current file to the system clipboard
map("c", "yf!!", "!echo % <bar> xclip -selection clipboard")

    -- Save file as sudo on files that require root permission
map("c", "w!!", "execute 'silent! write !sudo tee % >/dev/null' <bar> edit!")

-- INSERT MODE

-- TELESCOPE
map("n", "<leader>pf", ":lua require('telescope.builtin').find_files()<CR>")
map("n", "<C-p>", ":lua require('telescope.builtin').git_files()<CR>")
map(
  "n",
  "<leader>ps",
  ':lua require("telescope.builtin").grep_string({ search = vim.fn.input("Grep For > ")})<CR>'
)

map(
  "n",
  "<leader>pw",
  ':lua require("telescope.builtin").grep_string { search = vim.fn.expand("<cword>") }<CR>'
)

map(
  "n",
  "<leader>pb",
  ':lua require("telescope.builtin").buffers()<CR>'
)

-- LSP
