local find_nearest_tsconfig = function()
  local tsconfig = vim.fn.findfile("tsconfig.json", ".;")

  if tsconfig ~= "" then
    return tsconfig
  end

  return nil
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "css",
        "html",
        "javascript",
        "tsx",
        "typescript",
        "vue",
      })
    end,
  },
  { "pmizio/typescript-tools.nvim" },
  {
    "neovim/nvim-lspconfig",
    optional = true,
    opts = {
      servers = {
        html = { filetypes = { "xhtml", "html" } },
        cssls = {
          provideFormatter = false,
          capabilities = {
            textDocument = {
              completion = {
                completionItem = {
                  snippetSupport = true,
                },
              },
            },
          },
          settings = {
            css = {
              validate = false,
            },
            less = {
              validate = false,
            },
            scss = {
              validate = false,
            },
          },
        },
        emmet_language_server = {
          filetypes = {
            "astro",
            "css",
            "eruby",
            "html",
            "xhtml",
            "htmldjango",
            "javascriptreact",
            "less",
            "sass",
            "scss",
            "svelte",
            "typescriptreact",
            "vue",
          },
          init_options = {
            showSuggestionsAsSnippets = true,
          },
        },
        -- tsserver = {
        --   filetypes = {
        --     "javascript",
        --     "javascript.jsx",
        --     "javascriptreact",
        --     "typescript",
        --     "typescript.tsx",
        --     "typescriptreact",
        --     "vue",
        --   },
        --   init_options = {
        --     preferences = {
        --       importModuleSpecifierPreference = "non-relative",
        --
        --       includeInlayEnumMemberValueHints = true,
        --       includeInlayFunctionLikeReturnTypeHints = false,
        --       includeInlayFunctionParameterTypeHints = false,
        --       includeInlayParameterNameHints = "all",
        --       includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        --       includeInlayPropertyDeclarationTypeHints = false,
        --       includeInlayVariableTypeHints = false,
        --     },
        --     plugins = {
        --       {
        --         name = "@vue/typescript-plugin",
        --         location = vim.fn.expand("$HOME/.bun/install/global/node_modules/@vue/typescript-plugin"),
        --         languages = { "javascript", "typescript", "vue" },
        --       },
        --     },
        --   },
        -- },
        ["typescript-tools"] = {
          filetypes = {
            "javascript",
            "javascript.jsx",
            "javascriptreact",
            "typescript",
            "typescript.tsx",
            "typescriptreact",
          },
          mason = false,
          keys = {
            {
              "<leader>lu",
              "<cmd>TSToolsRemoveUnusedImports<cr>",
              desc = "Remove Unused Imports",
            },
            {
              "<leader>li",
              "<cmd>TSToolsAddMissingImports<cr>",
              desc = "Add Missing Imports",
            },
            {
              "gd",
              "<cmd>TSToolsGoToSourceDefinition<cr>",
              desc = "Goto Source Definition",
            },
          },
          settings = {
            -- tsserver settings
            typescript = {
              format = {
                indentSize = vim.o.shiftwidth,
                convertTabsToSpaces = vim.o.expandtab,
                tabSize = vim.o.tabstop,
              },
            },
            javascript = {
              format = {
                indentSize = vim.o.shiftwidth,
                convertTabsToSpaces = vim.o.expandtab,
                tabSize = vim.o.tabstop,
              },
            },
            completions = {
              completeFunctionCalls = true,
            },

            -- typescript-tools settings
            -- tsserver_plugins = {
            --   -- FIXME: find a way to pass location and languages like in tsserver config
            --   "@vue/typescript-plugin",
            -- },
          },
        },
        -- volar = {
        --   filetypes = { "vue" },
        --   capabilities = {
        --     workspace = {
        --       didChangeWatchedFiles = {
        --         -- NOTE: `dynamicRegistration: true` reduces greatly the performance on nvim < 0.10.0
        --         dynamicRegistration = true,
        --       },
        --     },
        --   },
        -- },
        -- eslint = {
        --   settings = {
        --     run = "onSave",
        --   },
        -- },
      },
      setup = {
        -- NOTE: typescript-tools.nvim will not spawn a tsserver client, it will spawn typescript-tools client
        ["typescript-tools"] = function(_, opts)
          require("typescript-tools").setup(opts)
          return true
        end,
      },
    },
  },
  {
    "dmmulroy/tsc.nvim",
    enabled = false,
    cmd = { "TSC" },
    keys = {
      {
        "<leader>kc",
        "<cmd>TSC<cr>",
        desc = "Compile",
      },
    },
    config = function()
      require("tsc").setup({
        auto_open_qflist = true,
        spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
        auto_close_qflist = false,
        auto_focus_qflist = false,
        auto_start_watch_mode = false,
        enable_progress_notifications = true,
        hide_progress_notifications_from_history = true,
        pretty_errors = true,
        flags = {
          noEmit = true,
          project = function()
            return find_nearest_tsconfig()
          end,
          watch = false,
        },
        use_trouble_qflist = true,
        run_as_monorepo = false,
      })
    end,
  },
  {
    "jellydn/typecheck.nvim",
    enabled = true,
    dependencies = { "folke/trouble.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
    ft = { "javascript", "javascriptreact", "json", "jsonc", "typescript", "typescriptreact" },
    opts = {
      debug = true,
      mode = "trouble", -- "quickfix" | "trouble"
    },
    keys = {
      {
        "<leader>kc",
        "<cmd>Typecheck<cr>",
        desc = "Run Type Check",
      },
    },
  },

  {
    "stevearc/conform.nvim",
    optional = true,
    dependencies = {
      {
        "williamboman/mason.nvim",
        optional = true,
        opts = function(_, opts)
          opts.ensure_installed = opts.ensure_installed or {}
          vim.list_extend(opts.ensure_installed, { "prettierd", "biome" })
        end,
      },
    },
    opts = {
      formatters_by_ft = {
        ["javascript"] = { "biome" },
        ["javascriptreact"] = { "biome" },
        ["typescript"] = { "biome" },
        ["json"] = { "biome" },
        ["typescriptreact"] = { "biome" },
        ["vue"] = { "prettierd" },
        ["css"] = { "prettierd" },
        ["scss"] = { "prettierd" },
        ["less"] = { "prettierd" },
        ["html"] = { "prettierd" },
      },
    },
  },
}
