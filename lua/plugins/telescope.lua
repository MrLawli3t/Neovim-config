return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim", -- utility library many plugins depend on
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- faster native sorter
  },
  cmd = "Telescope", -- lazy-load: only load when :Telescope is actually invoked
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Grep in project" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "List open buffers" },
    { "<leader>fc", function()
		require("telescope.builtin").find_files({
			cwd = vim.fn.stdpath("config")
		})
	end, desc = "Find files in config dir" },
  },
  config = function()
    require("telescope").setup({})
    require("telescope").load_extension("fzf") -- swaps in the faster C-based sorter
  end,
}
