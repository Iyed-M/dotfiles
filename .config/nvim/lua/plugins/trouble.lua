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

    { "<leader>tt", "<cmd>Trouble symbols toggle<cr>", desc = "Symbols (Trouble)" },
    { "<leader>tl", "<cmd>Trouble lsp toggle<cr>", desc = "LSP references/definitions/... (Trouble)" },
    { "<leader>tq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
    { "<leader>tD", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
    { "<leader>td", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
    { "<leader>ts", "<cmd>Trouble symbols toggle<cr>", desc = "Symbols (Trouble)" },
    { "<leader>tL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
  },
}
