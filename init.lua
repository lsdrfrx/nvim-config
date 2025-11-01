vim.g.mapleader = " "
vim.g.maplocalleader = ","

if vim.g.neovide then
	vim.cmd([[ set guifont=MesloLGMDZ\ Nerd\ Font\ Mono:h12 ]])
	vim.g.neovide_input_macos_option_key_is_meta = "only_left"
	vim.g.neovide_floating_shadow = false
end

require("plugin-setup")
require("core.options")
require("core.autocommands")
require("core.keymaps")
require("core.highlights")
