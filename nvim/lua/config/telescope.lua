local utils = require('utils')

-- Files / vim
utils.map('n', '<Leader>ff', [[<cmd>lua require('telescope.builtin').find_files()<CR>]])
utils.map('n', '<Leader>fg', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]])
utils.map('n', '<Leader>fb', [[<cmd>lua require('telescope.builtin').buffers()<CR>]])
utils.map('n', '<Leader>fh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]])
utils.map('n', '<Leader>fa', [[<cmd>lua require('telescope.builtin').builtin()<CR>]])

-- Git
utils.map('n', '<Leader>fis', [[<cmd>lua require('telescope.builtin').git_status()<CR>]])
utils.map('n', '<Leader>fib', [[<cmd>lua require('telescope.builtin').git_branches()<CR>]])
utils.map('n', '<Leader>fic', [[<cmd>lua require('telescope.builtin').git_commits()<CR>]])

-- LSP
utils.map('n', 'gd', [[<cmd>lua require('telescope.builtin').lsp_definitions()<CR>]])
utils.map('n', 'gr', [[<cmd>lua require('telescope.builtin').lsp_references()<CR>]])
utils.map('n', '<Leader>ca', [[<cmd>lua require('telescope.builtin').lsp_code_action()<CR>]])
utils.map('v', '<Leader>ca', [[<cmd>lua require('telescope.builtin').lsp_range_code_action()<CR>]])
utils.map('n', '<Leader>cd', [[<cmd>lua require('telescope.builtin').lsp_document_diagnostics()<CR>]])
utils.map('n', '<Leader>cD', [[<cmd>lua require('telescope.builtin').lsp_workspace_diagnostics()<CR>]])

