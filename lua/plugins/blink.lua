return {
  {
    'Saghen/blink.cmp',
    version = '*',
    opts = {
      keymap = { preset = 'default' },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
    },
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'Saghen/blink.cmp' },
    config = function()
      -- 1. Grab autocomplete capabilities from blink
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      
      -- 2. Inject capabilities into the native 'marksman' config
      --    This safely merges your settings with nvim-lspconfig's defaults
      vim.lsp.config('marksman', {
        capabilities = capabilities,
      })

      -- 3. Natively enable the language server
      vim.lsp.enable('marksman')
    end
  }
}
