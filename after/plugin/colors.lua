function TransparentBackground(should_be_transparent)
	-- color = color or 'gruvbox'
	-- vim.cmd.colorscheme(color)

    if should_be_transparent then
        vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
        vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
    end
end

require('gruvbox').setup({
    contrast = "hard",
})
vim.cmd('colorscheme gruvbox');

function ColorScheme(scheme_name)
    vim.cmd('colorscheme ' .. scheme_name)
end

TransparentBackground(true)
