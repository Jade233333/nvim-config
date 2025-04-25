if true then
  return {}
end

return {
  -- The plugin location on GitHub
  "vimwiki/vimwiki",
  -- The event that triggers the plugin
  event = "BufEnter *.md",
  -- The keys that trigger the plugin
  keys = {
    "<leader>ww",
    "<leader>wt",
    { "<leader>c<space>", "<plug>VimwikiToggleListItem", desc = "toggle checkbox" },
  },
  -- The configuration for the plugin
  init = function()
    vim.g.vimwiki_list = {
      {
        -- Here will be the path for your wiki
        path = "~/jadeswiki/",
        -- The syntax for the wiki
        syntax = "markdown",
        ext = "md",
      },
    }
    vim.g.vimwiki_global_ext = 0
  end,
}
