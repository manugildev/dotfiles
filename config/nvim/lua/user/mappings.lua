return {
	-- normal mode
	n = {
		["E"] = { "$", desc = "Start of line" },
		["B"] = { "^", desc = "End of line" },
		["<leader>fw"] = { function() require("telescope").extensions.live_grep_args.live_grep_args() end, desc = "Find words" },
  		["<leader>fW"] = {
    		function()
      			require("telescope").extensions.live_grep_args.live_grep_args {
      				vimgrep_arguments = {
      					"rg",
      					"--follow",
      					"--hidden",
      					"--no-ignore",
         				"--color=never",
         				"--no-heading",
         				"--with-filename",
         				"--line-number",
         				"--column",
         				"--smart-case",
     				},
          		}
    		end,
    		desc = "Find words in all files",
  		},
	},

	-- visual mode
	v = {
		["E"] = { "$", desc = "Start of line" },
		["B"] = { "^", desc = "End of line" },
	},
}
