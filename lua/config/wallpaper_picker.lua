local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local wtbg = require("wt-bg")

local bg_path = "C:/Users/siver/Desktop/Wallpapers"

local function pick_wallpaper()
  -- 1. FINDER: list files in the wallpaper directory
  local files = vim.fn.readdir(bg_path)

  -- filter to just image files, and strip the extension since
  -- wtbg:set_background() expects a name without one
  local entries = {}
  for _, f in ipairs(files) do
    local name = f:match("(.+)%.jpg$") or f:match("(.+)%.png$")
    if name then table.insert(entries, name) end
  end

  pickers.new({}, {
    prompt_title = "Wallpapers",

    -- FINDER: turn our plain list of strings into Telescope entries
    finder = finders.new_table({
      results = entries,
    }),

    -- SORTER: fuzzy-match as you type (this is Telescope's default generic sorter)
    sorter = conf.generic_sorter({}),

    -- ACTIONS: what happens on <CR>
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)
        wtbg:set_background(selection[1]) -- selection[1] is the entry string
      end)
      return true
    end,
  }):find()
end

return { pick_wallpaper = pick_wallpaper }
