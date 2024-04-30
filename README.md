# Nvim Config

## Cloning
Clone into `~/.config/nvim`. Or something else and make a soft-link, but the
directory must match. `packer.nvim` must be installed

## Changing colorscheme

```bash
$ lua ColorScheme('theme-name')
```

Options available in `packer.lua`

## Activating Transparency

If background is opaque, you can activate transparency with 

```bash
$ lua TransparentBackground(true)
```

