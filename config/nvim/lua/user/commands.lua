-- Overwrite [Q]uit and [W]rite commands 
vim.api.nvim_create_user_command("Q", "q", { name = "Quit", nargs = "*" })
vim.api.nvim_create_user_command("W", "w", { name = "Save", nargs = "*" })
