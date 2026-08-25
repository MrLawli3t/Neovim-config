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
	vim.api.nvim_set_hl(0, "RenderMarkdownInfo", { fg = "#89b4fa" })   -- Catppuccin blue
	vim.api.nvim_set_hl(0, "RenderMarkdownWarn", { fg = "#f9e2af" })   -- Catppuccin yellow
	vim.api.nvim_set_hl(0, "RenderMarkdownHint", { fg = "#a6e3a1" })   -- Catppuccin green
  end,
}
