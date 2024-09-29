return {
  "amitds1997/remote-nvim.nvim",
  version = "*", -- Pin to GitHub releases
  dependencies = {
    "nvim-lua/plenary.nvim", -- For standard functions
    "MunifTanjim/nui.nvim", -- To build the plugin UI
    "nvim-telescope/telescope.nvim", -- For picking b/w different remote methods
  },
  config = require("remote-nvim").setup({
    -- Remote configuration
    remote = {
      -- List of directories that should be copied over
      copy_dirs = {
        -- What to copy to remote's Neovim config directory
        config = {
          base = vim.fn.stdpath("config"), -- Path from where data has to be copied
          dirs = "*", -- Directories that should be copied over. "*" means all directories. To specify a subset, use a list like {"lazy", "mason"} where "lazy", "mason" are subdirectories
          -- under path specified in `base`.
          compression = {
            enabled = false, -- Should compression be enabled or not
            additional_opts = {}, -- Any additional options that should be used for compression. Any argument that is passed to `tar` (for compression) can be passed here as separate elements.
          },
        },
        -- What to copy to remote's Neovim data directory
        data = {
          base = vim.fn.stdpath("data"),
          dirs = {},
          compression = {
            enabled = true,
          },
        },
        -- What to copy to remote's Neovim cache directory
        cache = {
          base = vim.fn.stdpath("cache"),
          dirs = {},
          compression = {
            enabled = true,
          },
        },
        -- What to copy to remote's Neovim state directory
        state = {
          base = vim.fn.stdpath("state"),
          dirs = {},
          compression = {
            enabled = true,
          },
        },
      },
    },

    -- You can supply your own callback that should be called to create the local client. This is the default implementation.
    -- Two arguments are passed to the callback:
    -- port: Local port at which the remote server is available
    -- workspace_config: Workspace configuration for the host. For all the properties available, see https://github.com/amitds1997/remote-nvim.nvim/blob/main/lua/remote-nvim/providers/provider.lua#L4
    -- A sample implementation using WezTerm tab is at: https://github.com/amitds1997/remote-nvim.nvim/wiki/Configuration-recipes
    client_callback = function(port, _)
      require("remote-nvim.ui").float_term(("nvim --server localhost:%s --remote-ui"):format(port), function(exit_code)
        if exit_code ~= 0 then
          vim.notify(("Local client failed with exit code %s"):format(exit_code), vim.log.levels.ERROR)
        end
      end)
    end,
  }),
}
