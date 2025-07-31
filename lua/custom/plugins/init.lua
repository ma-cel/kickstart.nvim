-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
--
--

vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

vim.keymap.set('n', '<leader>pv', vim.cmd.Neotree)
vim.keymap.set('i', '<C-e>', '<C-o>A')
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', 'q', 'b')
vim.keymap.set('n', 'Q', 'B')
vim.keymap.set('n', 'x', '"_x')
vim.keymap.set('n', '<leader><tab>', ':b#<CR>', { noremap = true, silent = true })

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv 'HOME' .. '/.vim/undodir'

local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
parser_config.blade = {
  install_info = {
    url = 'https://github.com/EmranMR/tree-sitter-blade',
    files = { 'src/parser.c' },
    branch = 'main',
  },
  filetype = 'blade',
}

vim.filetype.add {
  pattern = {
    ['.*%.blade%.php'] = 'blade',
  },
}

return {
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {},
  },
  { 'EmranMR/tree-sitter-blade' },
  {
    'ricardoramirezr/blade-nav.nvim',
    dependencies = {
      'hrsh7th/nvim-cmp', -- if using nvim-cmp
      { 'ms-jpq/coq_nvim', branch = 'coq' }, -- if using coq
    },
    ft = { 'blade', 'php' }, -- optional, improves startup time
  },
}
