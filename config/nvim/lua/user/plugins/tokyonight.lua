return {
    "folke/tokyonight.nvim",
    opts = function(_, opts)
        opts = {
            style = "night",
            transparent = true,
            styles = {
                sidebards = "transparent",
                floats = "transparent"
            },
            on_colors = function (colors)
                colors.border = "grey"
            end,
        }
        return opts;
    end
}
