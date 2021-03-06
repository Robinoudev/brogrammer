-- local vim = vim
-- local autocmds = {}

-- -- +0,+1,+2, ... +254
-- local focused_colorcolumn = '+' .. table.concat({
--   '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12',
--   '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23',
--   '24', '25', '26', '27', '28', '29', '30', '31', '32', '33', '34',
--   '35', '36', '37', '38', '39', '40', '41', '42', '43', '44', '45',
--   '46', '47', '48', '49', '50', '51', '52', '53', '54', '55', '56',
--   '57', '58', '59', '60', '61', '62', '63', '64', '65', '66', '67',
--   '68', '69', '70', '71', '72', '73', '74', '75', '76', '77', '78',
--   '79', '80', '81', '82', '83', '84', '85', '86', '87', '88', '89',
--   '90', '91', '92', '93', '94', '95', '96', '97', '98', '99', '100',
--   '101', '102', '103', '104', '105', '106', '107', '108', '109', '110',
--   '111', '112', '113', '114', '115', '116', '117', '118', '119', '120',
--   '121', '122', '123', '124', '125', '126', '127', '128', '129', '130',
--   '131', '132', '133', '134', '135', '136', '137', '138', '139', '140',
--   '141', '142', '143', '144', '145', '146', '147', '148', '149', '150',
--   '151', '152', '153', '154', '155', '156', '157', '158', '159', '160',
--   '161', '162', '163', '164', '165', '166', '167', '168', '169', '170',
--   '171', '172', '173', '174', '175', '176', '177', '178', '179', '180',
--   '181', '182', '183', '184', '185', '186', '187', '188', '189', '190',
--   '191', '192', '193', '194', '195', '196', '197', '198', '199', '200',
--   '201', '202', '203', '204', '205', '206', '207', '208', '209', '210',
--   '211', '212', '213', '214', '215', '216', '217', '218', '219', '220',
--   '221', '222', '223', '224', '225', '226', '227', '228', '229', '230',
--   '231', '232', '233', '234', '235', '236', '237', '238', '239', '240',
--   '241', '242', '243', '244', '245', '246', '247', '248', '249', '250',
--   '251', '252', '253', '254'
-- }, ',+')

-- -- These are all the highlight groups that get blurred
-- local winhighlight_blurred = table.concat({
--   'CursorLineNr:LineNr',
--   'EndOfBuffer:ColorColumn',
--   'IncSearch:ColorColumn',
--   'Normal:ColorColumn',
--   'NormalNC:ColorColumn',
--   'SignColumn:ColorColumn'
-- }, ',')

-- local should_have_list_chars = function(callback)
--     local filetype = vim.bo.filetype
--     local listed = vim.bo.buflisted

--     if autocmds.list_chars_filetype_blacklist[filetype] ~= true and listed then
--         callback(filetype)
--     end
-- end

-- local focus_window = function()
--     -- make winhighlight an empty string again (default). Which means that all
--     -- highlight groups get their own highlighting back
--     vim.api.nvim_win_set_option(0, 'winhighlight', '')

--     -- sets the colorcolumn from textwidth till col 256
--     vim.api.nvim_win_set_option(0, 'colorcolumn', focused_colorcolumn)

--     -- TODO: exclude some filetypes here so they don't get list chars
--     --      eg. help and gitcommit

--     -- enables the list characters again (tabs, whitespace etc.)
--     should_have_list_chars(function(_)
--         vim.api.nvim_win_set_option(0, 'list', true)
--     end)

--     -- concealed text it replaced with one character
--     vim.api.nvim_win_set_option(0, 'conceallevel', 1)
--     require'robin.statusline'.focus_statusline()
-- end

-- local blur_window = function()
--     -- pust the hi groups defined above in the winhighlight string
--     -- each group to the left of the color gets highlighted the same as the
--     -- group on the right side of the colon. eg. CursorLineNr gets the same
--     -- highlighting as LineNr.
--     vim.api.nvim_win_set_option(0, 'winhighlight', winhighlight_blurred)

--     -- disables the list characters (tabs, whitespace etc.)
--     vim.api.nvim_win_set_option(0, 'list', false)

--     -- concealed text is shown normally (no concealing)
--     vim.api.nvim_win_set_option(0, 'conceallevel', 0)
--     require'robin.statusline'.focus_statusline()
-- end

-- autocmds.buf_enter = function()
--     focus_window()
-- end

-- autocmds.focus_lost = function()
--     blur_window()
-- end

-- autocmds.focus_gained = function ()
--     focus_window()
-- end

-- autocmds.buf_enter = function()
--     focus_window()
-- end

-- autocmds.win_enter = function()
--   focus_window()
-- end

-- autocmds.win_leave = function()
--   blur_window()
-- end

-- autocmds.vim_enter = function()
--   focus_window()
-- end

-- autocmds.list_chars_filetype_blacklist = {
--     ['help'] = true
-- }

-- return autocmds
