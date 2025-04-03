require("yaziline"):setup({
  color = "#a6e3a1", -- main theme color
  separator_style = "angly", -- "angly" | "curvy" | "liney" | "empty"
  separator_open = "",
  separator_close = "",
  separator_open_thin = "",
  separator_close_thin = "",
  separator_head = "",
  separator_tail = "",
  select_symbol = "",
  yank_symbol = "󰆐",
  filename_max_length = 24, -- truncate when filename > 24
  filename_truncate_length = 6, -- leave 6 chars on both sides
  filename_truncate_separator = "..." -- the separator of the truncated filename
})

local home = os.getenv("HOME") .. "/"
local bookmarks = {
    {
	tag = "Root",
	path = "/",
	key = "r"
    },
    {
	tag = "Home",
	path = home,
	key = "h"
    },
    {
	tag = "Local Config",
	path = home .. ".config/",
	key = "c"
    },
    {
	tag = "Global Config",
	path = "/etc/",
	key = "C"
    },
    {
	tag = "Pictures",
	path = home .. "Pictures/",
	key = "p"
    },
    {
	tag = "Wallpapers",
	path = home .. "Pictures/Wallpapers",
	key = "w"
    }
}

require("yamb"):setup {
  -- Optional, the path ending with path seperator represents folder.
  bookmarks = bookmarks,
  -- Optional, recieve notification everytime you jump.
  jump_notify = true,
  -- Optional, the cli of fzf.
  cli = "fzf",
  -- Optional, a string used for randomly generating keys, where the preceding characters have higher priority.
  keys = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",
  -- Optional, the path of bookmarks
  path = (os.getenv("HOME") .. "/.config/yazi/bookmark"),
}
