return {
	"Bluekossa/windows-terminal-bg.nvim",
	config = function()
		local wtbg = require("wt-bg")
		wtbg:setup({
			terminal_conf = "C:/Users/siver/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json",
			bg_path = "D:/Skrivebord/Neovim Wallpapers/",
			windows_bg_path = "D:/Skrivebord/Neovim Wallpapers/",
		})
	end
}
