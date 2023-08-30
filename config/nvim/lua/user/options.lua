-- set vim options here (vim.<first_key>.<second_key> = value)
return {
	opt = {
		relativenumber = true,
		number = true,
		spell = false,
		signcolumn = "auto",
		wrap = false,
		tabstop = 4,
		softtabstop = 4,
		shiftwidth = 4,
		expandtab = false,
		colorcolumn = "80",
		smartindent = true,
		scrolloff = 8,
		termguicolors = true,
	},
	g = {
		mapleader = " ",           -- sets vim.g.mapleader
		autoformat_enabled = false, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
		cmp_enabled = true,        -- enable completion at start
		autopairs_enabled = true,  -- enable autopairs at start
		diagnostics_mode = 3,      -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
		icons_enabled = true,      -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
		ui_notifications_enabled = true, -- disable notifications when toggling UI elements
		resession_enabled = false, -- enable experimental resession.nvim session management (will be default in AstroNvim v4)
	},
}
