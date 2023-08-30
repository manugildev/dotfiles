return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-telescope/telescope-live-grep-args.nvim",
	},
	commit = "32e6792f865221dfaf2a3751fd3cfeac96557433",
	opts = function(_, opts)
		opts = {
			defaults = {
				-- vimgrep_arguments = {
				-- 	"rg",
				-- 	"-L",
				-- 	"--color=never",
				-- 	"--no-heading",
				-- 	"--with-filename",
				-- 	"--line-number",
				-- 	"--column",
				-- 	"--smart-case",
				-- },
				path_display = {
					shorten = 4,
				},
			},
			extensions = {
				live_grep_args = {
					auto_quoting = true,
					mappings = {
						i = {
							["<C-q>"] = require("telescope-live-grep-args.actions").quote_prompt(),
							["<C-i>"] = require("telescope-live-grep-args.actions").quote_prompt({ postfix = " --iglob " }),
						},
					},
				},
			}
		};
		return opts;
	end,
}
