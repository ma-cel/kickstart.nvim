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
vim.keymap.set('n', '<leader>st', '<cmd>TodoTelescope<cr>', { desc = '[S]arch [T]odos' })

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv 'HOME' .. '/.vim/undodir'

return {
  { 'EmranMR/tree-sitter-blade' },
  {
    'ricardoramirezr/blade-nav.nvim',
    dependencies = {},
    ft = { 'blade', 'php' }, -- optional, improves startup time
  },
  {
    'olimorris/codecompanion.nvim',
    opts = {},
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
  },
  {
    'OXY2DEV/markview.nvim',
    lazy = false,
    opts = {
      preview = {
        filetypes = { 'markdown', 'codecompanion' },
        ignore_buftypes = {},
      },
    },
  },
  {
    'rebelot/kanagawa.nvim',
    priority = 1000,
    opts = {
      transparent = true,
      colors = {
        theme = {
          -- wirkt für alle Varianten (wave/dragon/lotus)
          all = { ui = { bg_gutter = 'none' } },
          -- zur Sicherheit auch spezifisch für wave:
          wave = { ui = { bg_gutter = 'none' } },
        },
      },
      -- falls irgendein Plugin/Gruppen-Namen den Gutter trotzdem färbt:
      overrides = function(colors)
        return {
          SignColumn = { bg = 'none' },
          LineNr = { bg = 'none' },
          GitSignsAdd = { bg = 'none' },
          GitSignsChange = { bg = 'none' },
          GitSignsDelete = { bg = 'none' },
          FoldColumn = { bg = 'none' },
        }
      end,
    },
    config = function(_, opts)
      require('kanagawa').setup(opts) -- <- wichtig!
      vim.cmd.colorscheme 'kanagawa-wave'
      vim.api.nvim_set_hl(0, 'LineNr', { fg = '#a9a788', bg = 'none' })
    end,
  },
}
