local map = vim.keymap.set

vim.g.mapleader = " "

map("n", "<leader>ee", vim.cmd.Ex)
map("n", "<leader>w", vim.cmd.w)
map("n", "<leader>cd", function ()
	local dir = vim.fn.expand("%:p:h")
	vim.cmd("cd " .. dir)
	vim.notify("Changed CWD to " .. dir)
end, { desc = "Change CWD to current file directory"}
)
