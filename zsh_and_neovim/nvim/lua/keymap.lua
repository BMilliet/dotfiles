
-- alias
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- set leader key
keymap('n', '<Space>', '<NOP>', opts)

vim.g.mapleader = ' '

-- remove highlight leader + h
keymap('n', '<Leader>h', ':set hlsearch!<CR>', opts)

-- window swap
keymap('n', '<Leader><left>', ':wincmd h<CR>', opts)
keymap('n', '<Leader><up>', ':wincmd j<CR>', opts)
keymap('n', '<Leader><down>', ':wincmd k<CR>', opts)
keymap('n', '<Leader><right>', ':wincmd l<CR>', opts)

-- file tree
keymap('n', '<Leader>e', '<cmd>NERDTreeToggle<Enter>', opts)

-- telescope search
keymap('n', '<Leader>ff', '<cmd>Telescope find_files<CR>', opts)
keymap('n', '<Leader>lg', '<cmd>Telescope live_grep<CR>', opts)
