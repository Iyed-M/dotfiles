return {
  {
    "folke/persistence.nvim",
    enabled = false,
  },
  {
    "natecraddock/workspaces.nvim",
    event = "VeryLazy",
    dependencies = {
      {
        "Shatur/neovim-session-manager",
        event = "VeryLazy",
        config = function()
          local Path = require("plenary.path")
          local config = require("session_manager.config")
          require("session_manager").setup({
            sessions_dir = Path:new(vim.fn.stdpath("data"), "session_manager"), -- The directory where the session files will be saved.
            autoload_mode = config.AutoloadMode.Disabled, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
            autosave_last_session = true, -- Automatically save last session on exit and on session switch.
            autosave_ignore_not_normal = true, -- Plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
            autosave_ignore_dirs = {}, -- A list of directories where the session will not be autosaved.
            autosave_ignore_filetypes = { -- All buffers of these file types will be closed before the session is saved.
              "gitcommit",
              "gitrebase",
            },
            autosave_ignore_buftypes = {}, -- All buffers of these bufer types will be closed before the session is saved.
            autosave_only_in_session = false, -- Always autosaves session. If true, only autosaves after a session is active.
            max_path_length = 80, -- Shorten the display path if length exceeds this threshold. Use 0 if don't want to shorten the path at all.
          })
        end,
        keys = {
          {
            "<leader>qs",
            "<CMD>SessionManager load_current_dir_session<CR>",
            mode = { "n" },
            desc = "Session - Load cwd",
          },
          { "<leader>ql", "<CMD>SessionManager load_last_session<CR>", mode = { "n" }, desc = "Session - Load Last" },
          { "<leader>qp", "<CMD>SessionManager load_session<CR>", mode = { "n" }, desc = "Session - Pick" },
          { "<leader>qd", "<CMD>SessionManager delete_session<CR>", mode = { "n" }, desc = "Session - Delete" },
          { "<leader>qS", "<CMD>SessionManager save_current_session<CR>", mode = { "n" }, desc = "Session - Save" },
        },
      },
    },
    config = function()
      require("workspaces").setup({
        -- path to a file to store workspaces data in
        -- on a unix system this would be ~/.local/share/nvim/workspaces
        path = vim.fn.stdpath("data") .. "/workspaces",

        -- to change directory for nvim (:cd), or only for window (:lcd)
        -- deprecated, use cd_type instead
        -- global_cd = true,

        -- controls how the directory is changed. valid options are "global", "local", and "tab"
        --   "global" changes directory for the neovim process. same as the :cd command
        --   "local" changes directory for the current window. same as the :lcd command
        --   "tab" changes directory for the current tab. same as the :tcd command
        --
        -- if set, overrides the value of global_cd
        cd_type = "global",

        -- sort the list of workspaces by name after loading from the workspaces path.
        sort = true,

        -- sort by recent use rather than by name. requires sort to be true
        mru_sort = true,

        -- option to automatically activate workspace when opening neovim in a workspace directory
        auto_open = false,

        -- enable info-level notifications after adding or removing a workspace
        notify_info = true,

        -- lists of hooks to run after specific actions
        -- hooks can be a lua function or a vim command (string)
        -- lua hooks take a name, a path, and an optional state table
        -- if only one hook is needed, the list may be omitted
        hooks = {
          add = {},
          remove = {},
          rename = {},
          open_pre = {},
          open = function()
            require("session_manager").load_current_dir_session()
          end,
        },
      })
      local telescope = require("telescope")
      telescope.load_extension("workspaces")
    end,
    keys = {
      { "<leader>wk", "<CMD>Telescope workspaces<CR>", mode = { "n" }, desc = "Workspaces - List" },
    },
  },
}
