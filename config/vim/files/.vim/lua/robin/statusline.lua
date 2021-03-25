-- local pinnacle = require'wincent.pinnacle'
-- local vim = vim
-- local statusline = { }
-- local default_lhs_color = 'Identifier'
-- local modified_lhs_color = 'ModeMsg'
-- local status_highlight = default_lhs_color

-- local update_statusline = function(default, action)
--     print(default)
--     vim.api.nvim_win_set_option(0, 'statusline', default)
-- end

-- -- Returns relative path to current file's directory.
-- statusline.fileprefix = function()
--     local basename = vim.fn.fnamemodify(vim.fn.expand('%:h'), ':p:~:.')
--     if basename == '' or basename == '.' then
--         return ''
--     else
--         return basename:gsub('/$', '') .. '/'
--     end
-- end

-- statusline.filetype = function()
--     -- vim.bo; get or set buffer-scoped local-options
--     local filetype = vim.bo.filetype
--     if #filetype > 0 then
--         return ',' .. filetype
--     else
--         return ''
--     end
-- end

-- statusline.lhs = function()
--     if vim.bo.modified then
--         -- HEAVY BALLOT X - Unicode: U+2718, UTF-8: E2 9C 98
--         return '✘ '
--     else
--         return '  '
--     end
-- end

-- -- note: the .. operator in lua concatenates two strings
-- statusline.init = function()
--     vim.api.nvim_set_option('statusline', ''
--     .. '%7*'                                                          -- Switch to User7 highlight group
--     .. '%{luaeval("require\'robin.statusline\'.lhs()")}'            -- Red/green/orange modified/activity status.
--     .. '%*'                                                           -- Reset highlight group.
--     .. '%4*'                                                          -- Switch to User4 highlight group (Powerline arrow).
--     .. ''                                                            -- Powerline arrow.
--     .. '%*'                                                           -- Reset highlight group.
--     .. ' '
--     .. '%<'                                                           -- truncate
--     .. '%{luaeval("require\'robin.statusline\'.fileprefix()")}'       -- Relative path to file's directory.
--     .. '%6*'                                                          -- hi group User4
--     .. '%t'                                                           -- filename
--     .. '%*'                                                           -- default hi group
--     .. ' '
--     .. '%('
--     .. '%5*'                                                          -- hi group User5
--     .. '['
--     .. '%R'
--     .. '%{luaeval("require\'robin.statusline\'.filetype()")}'
--     .. ']'
--     .. '%)'
--     .. '%*'
--     .. '%='
--     .. ' '                                                            -- Space.
--     )
-- end

-- statusline.update_highlight = function()
--     local fg = pinnacle.extract_fg(status_highlight)
--     local bg = pinnacle.extract_bg('StatusLine')

--     vim.cmd('highlight User7 ' .. pinnacle.highlight({
--         bg = fg,
--         fg = pinnacle.extract_fg('Normal'),
--         term = 'bold'
--     }))

--     vim.cmd('highlight User4 ' .. pinnacle.highlight({
--         fg = fg,
--         bg = bg
--     }))

--     vim.cmd('highlight User5 ' .. pinnacle.highlight({
--         bg = bg,
--         term = 'italic'
--     }))

--     vim.cmd('highlight User6 ' .. pinnacle.highlight({
--         bg = bg,
--         term = 'bold,italic'
--     }))
-- end

-- statusline.focus_statusline = function()
--     update_statusline('', 'focus')
-- end

-- return statusline
