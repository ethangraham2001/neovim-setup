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

vim.cmd[[
  augroup SpaceDuckOverrides
    autocmd!
    autocmd ColorScheme spaceduck highlight Comment guifg=#8888AA gui=italic
  augroup END
]]

-- default colorscheme
vim.cmd('colorscheme tokyonight-night');

function ColorScheme(scheme_name)
    vim.cmd('colorscheme ' .. scheme_name)
end

function Darkify()
    vim.cmd([[
    highlight Normal guibg=#000000 ctermbg=0
    highlight NormalNC guibg=#000000 ctermbg=0
    highlight LineNr guibg=#000000 ctermbg=0
    highlight SignColumn guibg=#000000 ctermbg=0
    highlight VertSplit guibg=#000000 ctermbg=0
    ]])
end

local color_scheme_names = {'spaceduck', 'newpaper', 'carbonfox', 'monokai-pro'}
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

function AOS()
	vim.cmd('colorscheme monokai-pro-classic')
	Darkify()
	vim.cmd('set expandtab')
end
