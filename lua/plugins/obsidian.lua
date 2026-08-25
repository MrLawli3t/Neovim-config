return {
	"obsidian-nvim/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown", -- only activates for markdown files
	dependencies = {
		"nvim-lua/plenary.nvim", -- required: async/path utilities
	},
	opts = {
		legacy_commands = false,
		workspaces = {
			{
				name = "notes",
				path = "D:/Dokumenter/Notes", -- adjust to wherever you want your vault
			},
		},

		-- Reuse your existing pickers instead of obsidian's own
		picker = {
			name = "telescope.nvim",
		},

		-- Where new notes/templates go inside the vault
		notes_subdir = "notes",
		templates = {
			subdir = "templates",
			date_format = "%Y-%m-%d",
			time_format = "%H:%M",
		},

		daily_notes = {
			folder = "daily",
			date_format = "%Y-%m-%d",
		},

		-- Leave visual rendering to render-markdown.nvim, avoid double-rendering
		ui = { enable = false },
	},
}
