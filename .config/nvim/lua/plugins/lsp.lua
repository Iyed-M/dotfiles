return {
  "neovim/nvim-lspconfig",
  opts = function()
    -- change prefix from <leader>c to <leader>l
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    for i, keybinding in ipairs(keys) do
      local prefix = string.sub(keybinding[1], 1, 9)
      keys[i][1] = string.gsub(keybinding[1], "<leader>c", "<leader>l")
    end
  end,
}
