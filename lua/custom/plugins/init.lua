-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
--
--

vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

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
