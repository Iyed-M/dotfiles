return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    cmd = "CopilotChat",
    opts = function()
      local user = vim.env.USER or "User"
      user = user:sub(1, 1):upper() .. user:sub(2)

      ---@type CopilotChat.config
      return M
    end,

    keys = {
      { "<c-s>", "<CR>", ft = "copilot-chat", desc = "Submit Prompt", remap = true },
      {
        "<leader>ac",
        function()
          require("CopilotChat").open()
        end,
        desc = "Toggle (CopilotChat)",
        mode = { "n", "v" },
      },
      {
        "<leader>ax",
        function()
          return require("CopilotChat").reset()
        end,
        desc = "Clear (CopilotChat)",
        mode = { "n", "v" },
      },
      {
        "<leader>aq",
        function()
          local input = vim.fn.input("Quick Chat: ")
          if input ~= "" then
            require("CopilotChat").ask(input)
          end
        end,
        desc = "Quick Chat (CopilotChat)",
        mode = { "n", "v" },
      },
    },
    config = function(_, opts)
      local chat = require("CopilotChat")
      ---@type CopilotChat.config
      local M = {
        debug = false, -- Enable debug logging
        proxy = nil, -- [protocol://]host[:port] Use this proxy
        allow_insecure = false, -- Allow insecure server connections

        model = "gpt-4o", -- GPT model to use, 'gpt-3.5-turbo', 'gpt-4', or 'gpt-4o'

        question_header = "- **User** ", -- Header to use for user questions
        answer_header = "- **Copilot** ", -- Header to use for AI answers
        error_header = " **Error** ", -- Header to use for errors
        separator = "───", -- Separator to use in chat

        show_folds = true, -- Shows folds for sections in chat
        auto_follow_cursor = false, -- Auto-follow cursor in chat
        auto_insert_mode = false, -- Automatically enter insert mode when opening window and if auto follow cursor is enabled on new prompt
        clear_chat_on_new_prompt = false, -- Clears chat on every new prompt
        highlight_selection = true, -- Highlight selection in the source buffer when in the chat window

        context = "buffers", -- Default context to use, 'buffers', 'buffer' or none (can be specified manually in prompt via @).
        history_path = vim.fn.stdpath("data") .. "/copilotchat_history", -- Default path to stored history
        callback = function() end, -- Callback to use when ask response is received

        -- default selection (visual or line)

        -- default prompts

        -- default window options
        -- default mappings
        mappings = {
          close = {
            normal = "q",
            insert = "<C-c>",
          },
          reset = {},
          submit_prompt = {
            normal = "<CR>",
            insert = "<C-s>",
          },
          accept_diff = {
            normal = "<C-y>",
            insert = "<C-y>",
          },
          yank_diff = {
            normal = "gy",
          },
          show_diff = {
            normal = "gd",
          },
          show_system_prompt = {
            normal = "gp",
          },
          show_user_selection = {
            normal = "gs",
          },
        },
      }

      require("CopilotChat.integrations.cmp").setup()

      chat.setup(M)
    end,
  },
}
