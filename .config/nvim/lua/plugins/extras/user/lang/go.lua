if true then return {} end
return {
  "olexsmir/gopher.nvim",
  ft = "go",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("gopher").setup({
      commands = {
        go = "go",
        gomodifytags = "gomodifytags",
        gotests = "gotests", -- also you can set custom command path
        impl = "impl",
        iferr = "iferr",
      },
    })
    vim.keymap.set("n", "<leader>le", "<cmd>:GoIfErr<CR>", { desc = "Go - If Err" })
  end,
  build = function()
    vim.cmd([[silent! GoInstallDeps]])
  end,
}
