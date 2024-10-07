return {
	-- You can also add new plugins here as well:
	-- Add plugins, the lazy syntax
	-- vim tmux navigator plugin
	{
		"christoomey/vim-tmux-navigator",
		lazy = false
	},
	{
		"lukas-reineke/headlines.nvim",
		lazy = false,
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = true,
	}
	-- "andweeb/presence.nvim",
	-- {
	--   "ray-x/lsp_signature.nvim",
	--   event = "BufRead",
	--   config = function()
	--     require("lsp_signature").setup()
	--   end,
	-- },
}
