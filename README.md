# Nvim Config

## Cloning
Clone into `~/.config/nvim`. Or something else and make a soft-link, but the
directory must match. `packer.nvim` must be installed. Run `:PackerSync` to
install plugins.

## Changing colorscheme

```bash
:lua ColorScheme('theme-name')
```

Configured options are

- `'gruvbox'`
- `'dayfox'`
- `'carbonfox'`
- `'monokai-pro'`

Or using `<leader>nc` to cycle through colors round-robin.

Options available in `packer.lua`

## Activating Transparency

Background is opaque by default. Activate transparency using

```bash
:lua TransparentBackground(true)
```

