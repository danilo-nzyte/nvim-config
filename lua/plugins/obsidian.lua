return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = false,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "Dro",
				path = "/Users/danilodrobac/Library/Mobile Documents/iCloud~md~obsidian/Documents/Dro",
			},
		},
		notes_subdir = "fleeting-notes",

		-- Optional, customize how names/IDs for new notes are created.
		note_id_func = function(title)
			-- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
			-- In this case a note with the title 'My new note' will be given an ID that looks
			-- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
			local suffix = ""
			if title ~= nil then
				-- If title is given, transform it into valid file name.
				suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
			else
				-- If title is nil, just add 4 random uppercase letters to the suffix.
				for _ = 1, 4 do
					suffix = suffix .. string.char(math.random(65, 90))
				end
			end
			return tostring(os.time()) .. "-" .. suffix
		end,

		-- Optional, customize the default name or prefix when pasting images via `:ObsidianPasteImg`.
		image_name_func = function()
			-- Prefix image names with timestamp.
			return string.format("%s-", os.time())
		end,

		templates = {
			subdir = "templates",
			date_format = "%Y-%m-%d",
			time_format = "%H:%M",
			-- A map for custom variables, the key should be the variable and the value a function
			substitutions = {},
		},

		-- Optional, determines how certain commands open notes. The valid options are:
		-- 1. "current" (the default) - to always open in the current window
		-- 2. "vsplit" - to open in a vertical split if there's not already a vertical split
		-- 3. "hsplit" - to open in a horizontal split if there's not already a horizontal split
		open_notes_in = "vsplit",
	},
}
