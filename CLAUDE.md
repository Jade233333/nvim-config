# CLAUDE.md

Guidance for Claude Code (claude.ai/code) in this repo.

## Architecture

Neovim config in Lua. Entry: `init.lua` → `lua/jade/init.lua`, loads modules in order:

1. `lua/jade/set.lua` — vim options (tabs, search, clipboard, UI)
2. `lua/jade/remap.lua` — leader key (`<Space>`) + core keymaps; load before plugins
3. `lua/jade/lazynvim.lua` — bootstraps lazy.nvim, loads all `lua/plugins/*.lua`
4. `lua/jade/lsp.lua` — enables LSP via `vim.lsp.enable()` (lua_ls, bashls, pyright, marksman, clangd, tinymist, yaml)
5. `lua/jade/lazypush.lua` — defines `:LP` command (wraps `lazypush` shell tool)
6. `lua/jade/colorscheme.lua` — gruvbox colorscheme
7. `lua/jade/filetype.lua` — wrap for typst/markdown
8. `lua/jade/localopen.lua` — `<leader><CR>` opens file via macOS `open`
9. `lua/jade/ji.lua` — journal keymaps: `<leader>jl` (daily log), `<leader>jt` (todo), `<leader>jm` (mirror); files in `~/ji/`
10. `lua/jade/format.lua` — `<leader>m` triggers LSP format
12. `lua/jade/diagnostics.lua` — `<leader>dd` float diagnostics, `<leader>df` code actions
13. `lua/jade/refresh.lua` — `<leader>r` reloads file (`:e<CR>`)

## Plugins (`lua/plugins/`)

Each file returns lazy.nvim plugin spec. Key plugins:

- **99.lua** (`ThePrimeagen/99`) — AI agent plugin using `opencode/claude-sonnet-4-5`; `<leader>99` (visual) triggers, `<leader>90` cancels; reads `AGENT.md` from project root
- **telescope.lua** — `<leader>f` find files, `<leader>g` live grep
- **harpoon.lua** — `<leader>a` add, `<leader>h` menu, `<leader>1-4` select, `<leader>p/n` prev/next
- **blink.lua** — completion (blink.cmp with LSP, path, snippets, buffer sources)
- **treesitter.lua** — highlights for markdown, lua, python, c, typst, latex, bash; treesitter folding
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
| `<leader>jl/jt/jm` | Journal/log/mirror |

## Adding New Functionality

- New keymaps/autocommands not tied to plugin → new `lua/jade/*.lua`, `require()` in `lua/jade/init.lua`
- New plugins → `lua/plugins/<name>.lua` returning lazy.nvim spec; auto-discovered
- LSP servers → enable in `lua/jade/lsp.lua` via `vim.lsp.enable()`, install via Mason (`:MasonInstall <server>`)
- 99 AI plugin reads `AGENT.md` walking up from current file to project root