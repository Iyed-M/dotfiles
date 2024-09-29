if false then
  local l = require("overseer")
end
return {
  "stevearc/overseer.nvim",
  cmd = {
    "OverseerOpen",
    "OverseerClose",
    "OverseerToggle",
    "OverseerSaveBundle",
    "OverseerLoadBundle",
    "OverseerDeleteBundle",
    "OverseerRunCmd",
    "OverseerRun",
    "OverseerInfo",
    "OverseerBuild",
    "OverseerQuickAction",
    "OverseerTaskAction",
    "OverseerClearCache",
  },
  config = function(_, opts)
    require("overseer").setup({
      form = {
        win_opts = {
          winblend = 0,
          winhighlight = "NormalFloat:MyCustomHighlight",
        },
      },
      confirm = {
        win_opts = {
          winblend = 0,
          winhighlight = "NormalFloat:MyCustomHighlight",
        },
      },
      task_win = {
        win_opts = {
          winblend = 0,
          winhighlight = "NormalFloat:MyCustomHighlight",
        },
      },
      templates = {
        sk = {
          name = "Run shell script",
          builder = function(params)
            return {
              cmd = { params.script },
              cwd = vim.fn.getcwd(), -- set cwd to current directory
              strategy = "terminal", -- run in terminal
            }
          end,
          params = function()
            local scripts = vim.fn.glob(vim.fn.getcwd() .. "/*.sh", false, true)
            for i, script in ipairs(scripts) do
              scripts[i] = vim.fn.fnamemodify(script, ":t")
            end
            return {
              script = {
                type = "enum",
                desc = "Name of the shell script to run",
                choices = scripts,
              },
            }
          end,
        },
      },
    })
  end,
  keys = {
    { "<leader>rw", "<cmd>OverseerToggle<cr>", desc = "Task list" },
    { "<leader>rr", "<cmd>OverseerRun<cr>", desc = "Run task" },
    { "<leader>rq", "<cmd>OverseerQuickAction<cr>", desc = "Action recent task" },
    { "<leader>rt", "<cmd>OverseerTaskAction<cr>", desc = "Task action" },
    {
      "<leader>ro",
      function()
        local overseer = require("overseer")
        overseer.run_template({}, function(task)
          if task then
            overseer.run_action(task, "open float")
          end
        end)
      end,
      desc = "Task action",
    },
  },
}
