return {
    "windwp/nvim-autopairs",
    event = "InsertEnter", -- lazy-load: only load once you enter insert mode
    config = function()
      require("nvim-autopairs").setup({})
    end,
}
