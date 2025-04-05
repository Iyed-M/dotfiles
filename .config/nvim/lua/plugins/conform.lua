return {
  "stevearc/conform.nvim",
  opts = function(_, opts)
    for _, ft in ipairs({ "javascript", "typescript", "typescriptreact", "javascriptreact" }) do
      opts.formatters_by_ft[ft] = { "biome" }
    end
    opts.formatters_by_ft.biome = {
      require_cwd = true,
    }
  end,
}
