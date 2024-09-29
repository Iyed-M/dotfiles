---@type LazySpec
return {
  "folke/trouble.nvim",
  cmd = { "Trouble" },
  lazy = true,
  keys = {
    { "<leader>xx", false },
    { "<leader>xX", false },
    { "<leader>cs", false },
    { "<leader>cS", false },
    { "<leader>xL", false },
    { "<leader>xQ", false },
    { "<leader>it", false },

    { "<leader>it", "<cmd>Trouble symbols toggle<cr>", desc = "Symbols (Trouble)" },
    { "<leader>il", "<cmd>Trouble lsp toggle<cr>", desc = "LSP references/definitions/... (Trouble)" },
    { "<leader>iq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
    { "<leader>iD", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
    { "<leader>id", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
    { "<leader>is", "<cmd>Trouble symbols toggle<cr>", desc = "Symbols (Trouble)" },
    { "<leader>iL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
  },
}
