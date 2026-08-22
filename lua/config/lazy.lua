-- Where lazy.nvim itself will live on disk
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- If it's not there yet, git clone it (this only happens once, ever)
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",   -- shallow-ish clone, faster
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

-- Add it to Neovim's Lua package path so `require("lazy")` works below
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- This tells lazy.nvim: "every file in lua/config/plugins/ is a plugin spec"
    { import = "plugins" },
  },
  install = { colorscheme = { "catppuccin" } }, -- fallback while installing
  checker = { enabled = false }, -- don't auto-check for plugin updates in background
})
