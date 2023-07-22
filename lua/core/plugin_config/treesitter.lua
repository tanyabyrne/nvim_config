require'nvim-treesitter.configs'.setup{
	-- list of parsers
	ensure_installed = { "c", "lua", "c_sharp", "vim", "javascript"},

	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
	},
}
