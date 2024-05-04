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

local color_scheme_names = {'gruvbox', 'spaceduck', 'newpaper', 'monokai-pro'}
local curr_scheme_idx = 1

function NextColorScheme()
    curr_scheme_idx = curr_scheme_idx + 1
    if curr_scheme_idx > #color_scheme_names then 
        curr_scheme_idx = 1
    end

    local nextScheme = color_scheme_names[curr_scheme_idx]
    ColorScheme(nextScheme)
end
vim.keymap.set("n", "<leader>nc", ":lua NextColorScheme()<cr>")

TransparentBackground(true)
