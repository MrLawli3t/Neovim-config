return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000, -- load before other plugins so UI elements colorize correctly on startup
  config = function()
    require("catppuccin").setup({
      flavour = "mocha", -- catppuccin's four variants: latte, frappe, macchiato, mocha
      transparent_background = true, -- this is the actual transparency switch
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}
