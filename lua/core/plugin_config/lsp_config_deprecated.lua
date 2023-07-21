require("mason").setup()
require("mason-lspconfig").setup({
		ensure_installed = { "lua_ls", "csharp_ls" }
})

local telescope = require('telescope')

--local on_attach = function(client, bufnr)
--	local bufopts = { noremap=true, silent=true, buffer=bufnr }
--	vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
--	vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
	--vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
	--vim.keymap.set('n', '<leader>gg', vim.lsp.buf.implementation, bufopts)
--	vim.keymap.set('n', '<leader>gr', telescope.builtin.lsp_refrences, bufopts)
--	vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)

--end

local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup {
--	on_attach = on_attach
}

lspconfig.csharp_ls.setup {
--	on_attach = on_attach
}
