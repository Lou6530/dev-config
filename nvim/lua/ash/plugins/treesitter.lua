return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
  enabled = true,
	config = function () 
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "html", "go", "python", "typescript", "tsx" },
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end
}
