local plugin = {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
}

function plugin.config()
	require("nvim-treesitter.configs").setup({
		ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
		sync_install = false,
		auto_install = true,
    highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
			disable = { "text" }, -- Wyłączenie podświetlania dla typu "Text"
		},
		indent = { enable = true },
	})
end

return plugin
