return {
	"nvim-treesitter/nvim-treesitter",
	opts = function(_, opts)
		opts = {
			ensure_installed = { "c", "cpp", "java", "lua", "rust", "markdown", },
  	  	  	auto_install = true,
  	  	  	highlight = {
    			enable = true,
    		}
		};
		return opts;
	end,
}
