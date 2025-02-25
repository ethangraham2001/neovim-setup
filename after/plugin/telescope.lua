local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {}) 	-- search files with telescope
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>gg', builtin.git_files, {}) 	-- search git files
vim.keymap.set('n', '<leader>oo', builtin.oldfiles, {}) 	-- search git files

vim.keymap.set('n', '<leader>ps', function() 
	builtin.grep_string({ search = vim.fn.input("Grep > ")});
end)
