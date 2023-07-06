vim.cmd.packadd('packer.nvim')

return require("packer").startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    -- Telescope
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.1",
        requires = { { "nvim-lua/plenary.nvim" } },
        extensions = {
            fzf = {
                fuzzy = true,                   -- false will only do exact matching
                override_generic_sorter = true, -- override the generic sorter
                override_file_sorter = true,    -- override the file sorter
                case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
            }
        }
    })

    -- ColorScheme
    --    use({
    --        'rose-pine/neovim',
    --        as = 'rose-pine',
    --        config = function()
    --            require('rose-pine').setup({ disable_italics = true })
    --            vim.cmd('colorscheme rose-pine')
    --        end
    --    })
    --
    --    use({
    --      "loctvl842/monokai-pro.nvim",
    --      config = function()
    --        require("monokai-pro").setup({
    --            transparent_background = true,
    --            filter = 'machine',
    --        })
    --        vim.cmd([[colorscheme monokai-pro]])
    --      end
    --    })
    --

    use({ "folke/tokyonight.nvim" })

    --use({ 'manugildev/vim-material-monokai', as = 'material-monokai' })
    --vim.cmd('colorscheme material-monokai')

    -- TreeSitter
    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
    use("mbbill/undotree")
    use("tpope/vim-fugitive")
    use("theprimeagen/harpoon")
    -- use({ 'nvim-treesitter/playground' })
    use({
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        requires = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },
            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },

            -- Snippets
            { "L3MON4D3/LuaSnip" },
        },
    })

    if packer_bootstrap then
        require('packer').sync()
    end
end)
