return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter", -- lazy-load: only load once you enter insert mode
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- source: suggestions from the LSP
      "hrsh7th/cmp-buffer",   -- source: suggestions from words in open buffers
      "hrsh7th/cmp-path",     -- source: suggestions for file paths
      "L3MON4D3/LuaSnip",     -- snippet engine cmp needs to expand snippets
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args) require("luasnip").lsp_expand(args.body) end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },
}
