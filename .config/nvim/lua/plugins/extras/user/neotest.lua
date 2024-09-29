if true then
  return {}
end
return {
  {
    "nvim-neotest/neotest",
    dependencies = { "nvim-neotest/nvim-nio", "nvim-neotest/neotest-jest" },
    opts = {
      -- Can be a list of adapters like what neotest expects,
      -- or a list of adapter names,
      -- or a table of adapter names, mapped to adapter configs.
      -- The adapter will then be automatically loaded with the config.
      adapters = {
        ---@type
        ["neotest-jest"] = {
          jestCommand = "bun test",
          discovery = {
            enabled = false,
          },
        },
      },
      -- Example for loading neotest-golang with a custom config
      -- adapters = {
      --   ["neotest-golang"] = {
      --     go_test_args = { "-v", "-race", "-count=1", "-timeout=60s" },
      --     dap_go_enabled = true,
      --   },
      -- },
      status = { virtual_text = true },
      output = { open_on_run = true },
      quickfix = {
        open = function()
          if LazyVim.has("trouble.nvim") then
            require("trouble").open({ mode = "quickfix", focus = false })
          else
            vim.cmd("copen")
          end
        end,
      },
    },
    config = function(_, opts)
      local neotest_ns = vim.api.nvim_create_namespace("neotest")
      vim.diagnostic.config({
        virtual_text = {
          format = function(diagnostic)
            -- Replace newline and tab characters with space for more compact diagnostics
            local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
            return message
          end,
        },
      }, neotest_ns)

      if LazyVim.has("trouble.nvim") then
        opts.consumers = opts.consumers or {}
        -- Refresh and auto close trouble after running tests
        ---@type neotest.Consumer
        opts.consumers.trouble = function(client)
          client.listeners.results = function(adapter_id, results, partial)
            if partial then
              return
            end
            local tree = assert(client:get_position(nil, { adapter = adapter_id }))

            local failed = 0
            for pos_id, result in pairs(results) do
              if result.status == "failed" and tree:get_key(pos_id) then
                failed = failed + 1
              end
            end
            vim.schedule(function()
              local trouble = require("trouble")
              if trouble.is_open() then
                trouble.refresh()
                if failed == 0 then
                  trouble.close()
                end
              end
            end)
            return {}
          end
        end
      end

      if opts.adapters then
        local adapters = {}
        for name, config in pairs(opts.adapters or {}) do
          if type(name) == "number" then
            if type(config) == "string" then
              config = require(config)
            end
            adapters[#adapters + 1] = config
          elseif config ~= false then
            local adapter = require(name)
            if type(config) == "table" and not vim.tbl_isempty(config) then
              local meta = getmetatable(adapter)
              if adapter.setup then
                adapter.setup(config)
              elseif adapter.adapter then
                adapter.adapter(config)
                adapter = adapter.adapter
              elseif meta and meta.__call then
                adapter(config)
              else
                error("Adapter " .. name .. " does not support setup")
              end
            end
            adapters[#adapters + 1] = adapter
          end
        end
        opts.adapters = adapters
      end

      require("neotest").setup(opts)
    end,
  -- stylua: ignore
  keys = {
    {"<leader>t", "", desc = "+test"},
    { "<leader>tt", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run File" },
    { "<leader>tT", function() require("neotest").run.run(vim.uv.cwd()) end, desc = "Run All Test Files" },
    { "<leader>tr", function() require("neotest").run.run() end, desc = "Run Nearest" },
    { "<leader>tl", function() require("neotest").run.run_last() end, desc = "Run Last" },
    { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Toggle Summary" },
    { "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end, desc = "Show Output" },
    { "<leader>tO", function() require("neotest").output_panel.toggle() end, desc = "Toggle Output Panel" },
    { "<leader>tS", function() require("neotest").run.stop() end, desc = "Stop" },
    { "<leader>tw", function() require("neotest").watch.toggle(vim.fn.expand("%")) end, desc = "Toggle Watch" },
  },
  },
  -- {
  --   "mfussenegger/nvim-dap",
  --   optional = true,
  --   dependencies = {
  --     {
  --       "williamboman/mason.nvim",
  --       opts = function(_, opts)
  --         opts.ensure_installed = opts.ensure_installed or {}
  --         table.insert(opts.ensure_installed, "js-debug-adapter")
  --       end,
  --     },
  --   },
  --   opts = function()
  --     local dap = require("dap")
  --     if not dap.adapters["pwa-node"] then
  --       require("dap").adapters["pwa-node"] = {
  --         type = "server",
  --         host = "localhost",
  --         port = "${port}",
  --         executable = {
  --           command = "node",
  --           -- 💀 Make sure to update this path to point to your installation
  --           args = {
  --             LazyVim.get_pkg_path("js-debug-adapter", "/js-debug/src/dapDebugServer.js"),
  --             "${port}",
  --           },
  --         },
  --       }
  --     end
  --     --   if not dap.adapters["node"] then
  --     --     dap.adapters["node"] = function(cb, config)
  --     --       if config.type == "node" then
  --     --         config.type = "pwa-node"
  --     --       end
  --     --       local nativeAdapter = dap.adapters["pwa-node"]
  --     --       if type(nativeAdapter) == "function" then
  --     --         nativeAdapter(cb, config)
  --     --       else
  --     --         cb(nativeAdapter)
  --     --       end
  --     --     end
  --     --   end
  --     --
  --     --   -- local js_filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" }
  --     --   --
  --     --   -- local vscode = require("dap.ext.vscode")
  --     --   -- vscode.type_to_filetypes["node"] = js_filetypes
  --     --   -- vscode.type_to_filetypes["pwa-node"] = js_filetypes
  --     --   --
  --     --   -- for _, language in ipairs(js_filetypes) do
  --     --   --   if not dap.configurations[language] then
  --     --   --     dap.configurations[language] = {
  --     --   --       {
  --     --   --         type = "pwa-node",
  --     --   --         request = "launch",
  --     --   --         name = "Launch file",
  --     --   --         program = "${file}",
  --     --   --         cwd = "${workspaceFolder}",
  --     --   --       },
  --     --   --       {
  --     --   --         type = "pwa-node",
  --     --   --         request = "attach",
  --     --   --         name = "Attach",
  --     --   --         processId = require("dap.utils").pick_process,
  --     --   --         cwd = "${workspaceFolder}",
  --     --   --       },
  --     --   --     }
  --     --   --   end
  --     --   -- end
  --   end,
  -- },
}
