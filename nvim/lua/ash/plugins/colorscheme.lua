function ColorTheBg(color)
	color = color or "nightfly"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
	vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
end

return  {
	"bluz71/vim-nightfly-colors",
	priority = 1000,
	-- lazy = true,
  -- enabled = true,
	config = function()
		ColorTheBg()
	end,
}
