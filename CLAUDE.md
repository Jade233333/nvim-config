# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Architecture

This is a Neovim configuration written in Lua. Entry point is `init.lua` → `lua/jade/init.lua`, which loads modules in order:

1. `lua/jade/set.lua` — vim options (tabs, search, clipboard, UI)
2. `lua/jade/remap.lua` — leader key (`<Space>`) and core keymaps; must load before plugins
3. `lua/jade/lazynvim.lua` — bootstraps and initializes lazy.nvim, loading all `lua/plugins/*.lua`
4. `lua/jade/lsp.lua` — enables LSP servers via `vim.lsp.enable()` (lua_ls, bashls, pyright, marksman, clangd, tinymist, yaml)
5. `lua/jade/lazypush.lua` — defines `:LP` user command (wraps `lazypush` shell tool)
6. `lua/jade/colorscheme.lua` — sets gruvbox colorscheme
7. `lua/jade/filetype.lua` — enables wrap for typst/markdown filetypes
8. `lua/jade/localopen.lua` — `<leader><CR>` opens current file with macOS `open`
9. `lua/jade/jia.lua` — journal keymaps: `<leader>jl` (daily log), `<leader>jt` (todo), `<leader>jr` (日记/riji); files stored in `~/jia/`
10. `lua/jade/format.lua` — `<leader>m` triggers LSP format
12. `lua/jade/diagnostics.lua` — `<leader>dd` float diagnostics, `<leader>df` code actions
13. `lua/jade/refresh.lua` — `<leader>r` reloads current file (`:e<CR>`)

## Plugins (`lua/plugins/`)

Each file returns a lazy.nvim plugin spec. Key plugins:

- **99.lua** (`ThePrimeagen/99`) — AI agent plugin using `opencode/claude-sonnet-4-5`; `<leader>99` (visual) triggers it, `<leader>90` cancels; reads `AGENT.md` files from project root
- **telescope.lua** — `<leader>f` find files, `<leader>g` live grep
- **harpoon.lua** — `<leader>a` add, `<leader>h` menu, `<leader>1-4` select, `<leader>p/n` prev/next
- **blink.lua** — completion (blink.cmp with LSP, path, snippets, buffer sources)
- **treesitter.lua** — highlights for markdown, lua, python, c, typst, latex, bash; treesitter-based folding
- **outline.lua** — `<leader>o` toggles symbol outline
- **mason.lua** — LSP/tool installer UI
- **fugitive.lua** — Git integration (`:G` commands)
- **render-markdown.lua**, **autopairs.lua**, **undotree.lua**, **catppuccin.lua**, **gruvbox.lua**, **riscv.lua** — minor plugins

## Key Keymaps Summary

| Key | Action |
|-----|--------|
| `<leader>l` | Open netrw (file explorer) |
| `<leader>f` | Telescope find files |
| `<leader>g` | Telescope live grep |
| `<leader>h` | Harpoon menu |
| `<leader>a` | Harpoon add file |
| `<leader>o` | Toggle outline |
| `<leader>m` | LSP format |
| `<leader>dd` | Show diagnostics float |
| `<leader>df` | Code action |
| `<leader>r` | Reload file |
| `<leader>99` | 99 AI visual action |
| `<leader>jl/jt/jr` | Journal/log/riji |

## Adding New Functionality

- New keymaps/autocommands that don't belong to a plugin go in a new `lua/jade/*.lua` file and get `require()`d in `lua/jade/init.lua`
- New plugins go in `lua/plugins/<name>.lua` returning a lazy.nvim spec table; they are auto-discovered
- LSP servers are enabled in `lua/jade/lsp.lua` via `vim.lsp.enable()` and installed via Mason (`:MasonInstall <server>`)
- The 99 AI plugin reads `AGENT.md` files walking up from the current file to project root
