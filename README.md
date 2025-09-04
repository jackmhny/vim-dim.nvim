# Dim for Neovim

**A Neovim Lua port of [jeffkreeftmeijer/vim-dim](https://github.com/jeffkreeftmeijer/vim-dim)**

**Dim** (/dɪm/; a contraction of **Default IMproved**) is a Neovim colorscheme written in Lua, forked from the original Vim colorscheme with improvements:


* It only uses [ANSI colors], so you can assign colors in your terminal emulator yourself
* Syntax highlighting is consistent on light and dark backgrounds
* Native Lua implementation for better performance in Neovim

Dim comes with Grim: a monochrome version that limits syntax coloring to grayscales.

This is a complete Lua rewrite of the original [vim-dim](https://github.com/jeffkreeftmeijer/vim-dim) colorscheme by Jeff Kreeftmeijer, optimized for Neovim.

[ANSI colors]: https://en.wikipedia.org/wiki/ANSI_escape_code#Colors

## Requirements

- Neovim 0.5.0 or later

## Installation

### Using [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  'jackmhny/vim-dim.nvim',
  config = function()
    vim.cmd('colorscheme dim')
  end
}
```

##  Usage

After installing, set your colorscheme to dim or grim:

```lua
-- In your init.lua
vim.cmd('colorscheme dim')
-- or
vim.cmd('colorscheme grim')
```

