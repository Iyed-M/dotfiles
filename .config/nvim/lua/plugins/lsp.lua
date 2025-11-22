return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    local keys = opts.servers["*"].keys
    for i, keybinding in ipairs(keys) do
      keys[i][1] = string.gsub(keybinding[1], "<leader>c", "<leader>l")
    end
    return opts
  end,
}
