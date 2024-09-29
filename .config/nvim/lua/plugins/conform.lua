return {
  "stevearc/conform.nvim",
  ---@type conform.setupOpts
  opts = function()
    local opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        fish = { "fish_indent" },
        sh = { "shfmt" },
        typescript = { "biome" },
        typescriptreact = { "biome" },
        css = { "prettierd" },
      },
      -- formatters = {
      --   biome = {
      --     args = { "format --use-tabs=tab" },
      --   },

      -- # Example of using dprint only when a dprint.json file is present
      -- dprint = {
      --   condition = function(ctx)
      --     return vim.fs.find({ "dprint.json" }, { path = ctx.filename, upward = true })[1]
      --   end,
      -- },
      --
      -- # Example of using shfmt with extra args
      -- shfmt = {
      --   prepend_args = { "-i", "2", "-ci" },
      -- },
    }
    return opts
  end,
  config = M.setup,
}
