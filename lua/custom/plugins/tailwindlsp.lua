return {
  {
    'neovim/nvim-lspconfig',
    config = function()
      require('lspconfig').tailwindCSS.setup {
        filetypes = { 'html', 'css', 'scss', 'vue', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact' },
      }
    end,
  },
}
