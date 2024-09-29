require "nvchad.mappings"

local map = vim.keymap.set
---@param key string
---@param desc string
---@param action string|function
local nmap = function(key, action, desc)
  vim.keymap.set("n", key, action, { desc = desc })
end
local function safeNoMap(key, mode)
  if mode == nil then
    mode = "n"
  end
  local ok = pcall(vim.keymap.del, mode, key)
  if not ok then
    vim.print("failed to delete keymap key=" .. key .. " mode=" .. mode)
  end
end

nmap("<leader>/", "<cmd>Telescope live_grep<cr>", "Grep (Root Dir)")
nmap("<leader>:", "<cmd>Telescope command_history<cr>", "Command History")

nmap("<leader>sD", "<cmd>Telescope diagnostics<cr>", "Workspace Diagnostics")
nmap("<leader>sR", "<cmd>Telescope resume<cr>", "Resume")
nmap("<leader>sS", function()
  require("telescope.builtin").lsp_dynamic_workspace_symbols {
    symbols = require("lazyvim.config").get_kind_filter(),
  }
end, "Goto Symbol (Workspace)")
nmap("<leader>sb", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", "Buffers")
nmap("<leader>sw", "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Seach in Buffer")
nmap("<leader>sa", function()
  require("telescope.builtin").find_files {
    prompt_title = "Config Files",
    cwd = vim.fn.stdpath "config",
    follow = true,
  }
end, "Find Config File") --
nmap("<leader>sh", "<cmd>Telescope help_tags<cr>", "Help Pages")
nmap("<leader>sl", "<cmd>Telescope resume<cr>", "Resume")
nmap("<leader>so", "<cmd>Telescope vim_options<cr>", "Options")
nmap("<leader>sk", "<cmd>Telescope keymaps<cr>", "Key Maps")
nmap("<leader>ss", function()
  require("telescope.builtin").lsp_document_symbols { symbols = require("lazyvim.config").get_kind_filter() }
end, "Goto Symbol")

safeNoMap "<C-W>d"
safeNoMap "<C-W><C-D>"

--- buffline
nmap("<Leader>o", function()
  require("oil").open_float()
end, "Open folder in Oil (float)")

nmap("<Leader>O", function()
  require("oil").open_float(vim.fn.getcwd())
end, "Open folder in Oil (float)")

nmap("L", function()
  require("nvchad.tabufline").next()
end, "buffer goto next")

nmap("H", function()
  require("nvchad.tabufline").prev()
end, "buffer goto prev")

nmap("<leader>bd", function()
  require("nvchad.tabufline").close_buffer()
end, "buffer close")

nmap("<leader>bo", function()
  require("nvchad.tabufline").closeAllBufs(false)
end, "buffer close")

map("i", "<C-i>", function()
  vim.print "hi"
end)
nmap("<Esc>", "<cmd>noh<CR>", "General Clear highlights")
nmap("<leader>e", "<cmd>NvimTreeToggle<CR>", "nvimtree toggle window")
nmap("<leader>f", function()
  require("telescope").extensions.smart_open.smart_open { cwd_only = true, filename_first = true }
end, "vsplit")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
--

-- local Util = require("lazyvim.util")
-- if Util.has("smart-splits.nvim") then
--   local splits = require("smart-splits")
--   map("n", "<C-h>", function()
--     splits.move_cursor_left()
--   end, { desc = "SmartSplits - Focus Left" })
--   map("n", "<C-j>", function()
--     splits.move_cursor_down()
--   end, { desc = "SmartSplits - Focus Down" })
--   map("n", "<C-k>", function()
--     splits.move_cursor_up()
--   end, { desc = "SmartSplits - Focus Up" })
--   map("n", "<C-l>", function()
--     splits.move_cursor_right()
--   end, { desc = "SmartSplits - Focus Right" })
--
--   map("n", "<A-left>", function()
--     splits.resize_left()
--   end, { desc = "SmartSplits - Resize Left" })
--   map("n", "<A-down>", function()
--     splits.resize_down()
--   end, { desc = "SmartSplits - Resize Down" })
--   map("n", "<A-up>", function()
--     splits.resize_up()
--   end, { desc = "SmartSplits - Resize Up" })
--   map("n", "<A-right>", function()
--     splits.resize_right()
--   end, { desc = "SmartSplits - Resize Right" })
--
--   map("n", "<A-h>", function()
--     splits.resize_left()
--   end, { desc = "SmartSplits - Resize Left" })
--   map("n", "<A-j>", function()
--     splits.resize_down()
--   end, { desc = "SmartSplits - Resize Down" })
--   map("n", "<A-k>", function()
--     splits.resize_up()
--   end, { desc = "SmartSplits - Resize Up" })
--   map("n", "<A-l>", function()
--     splits.resize_right()
--   end, { desc = "SmartSplits - Resize Right" })
--
--   map("n", "<leader><leader>h", function()
--     splits.swap_buf_left()
--   end, { desc = "SmartSplits - Swap Buffer Left" })
--   map("n", "<leader><leader>j", function()
--     splits.swap_buf_down()
--   end, { desc = "SmartSplits - Swap Buffer Down" })
--   map("n", "<leader><leader>k", function()
--     splits.swap_buf_up()
--   end, { desc = "SmartSplits - Swap Buffer Up" })
--   map("n", "<leader><leader>l", function()
--     splits.swap_buf_right()
--   end, { desc = "SmartSplits - Swap Buffer Right" })
-- end
--
-- -- Move Lines
-- del("n", "<A-j>")
-- del("n", "<A-k>")
-- del("i", "<A-j>")
-- del("i", "<A-k>")
-- map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
-- map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })
--
-- -- stylua: ignore start
--
-- -- lazy
-- -- map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })
-- del("n", "<leader>l")
-- map("n", "<leader>lz", "<cmd>Lazy<cr>", { desc = "Lazy" })
-- map("n", "<leader>ll", function() LazyVim.news.changelog() end, { desc = "LazyVim Changelog" })
-- map("n", "<leader>lx", "<cmd>LazyExtras<CR>", { desc = "LazyVim Changelog" })
--
-- -- new file
-- -- map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })
-- del("n", "<leader>fn")
--
-- del("n", "<leader>xl")
-- del("n", "<leader>xq")
--
-- -- lazygit
-- map("n", "<leader>gg", function() LazyVim.lazygit({ cwd = LazyVim.root.git() }) end, { desc = "Lazygit (Root Dir)" })
-- map("n", "<leader>gG", function() LazyVim.lazygit() end, { desc = "Lazygit (cwd)" })
-- map("n", "<leader>gb", LazyVim.lazygit.blame_line, { desc = "Git Blame Line" })
-- map("n", "<leader>gB", LazyVim.lazygit.browse, { desc = "Git Browse" })
-- map("n", "<leader>lg", function() LazyVim.lazygit({ cwd = LazyVim.root.git() }) end, { desc = "Lazygit (Root Dir)" })
--
-- map("n", "<leader>gf", function()
--   local git_path = vim.api.nvim_buf_get_name(0)
--   LazyVim.lazygit({ args = { "-f", vim.trim(git_path) } })
-- end, { desc = "Lazygit Current File History" })
--
-- map("n", "<leader>gl", function()
--   LazyVim.lazygit({ args = { "log" }, cwd = LazyVim.root.git() })
-- end, { desc = "Lazygit Log" })
-- map("n", "<leader>gL", function()
--   LazyVim.lazygit({ args = { "log" } })
-- end, { desc = "Lazygit Log (cwd)" })
--
-- -- quit
-- -- map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })
-- del("n", "<leader>qq")
--
-- -- highlights under cursor
-- map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
-- map("n", "<leader>uI", "<cmd>InspectTree<cr>", { desc = "Inspect Tree" })
--
-- -- floating terminal
-- local lazyterm = function() LazyVim.terminal(nil, { cwd = LazyVim.root() }) end
-- del("n", "<leader>ft")
-- del("n", "<leader>fT")
-- map("n", "<c-/>", lazyterm, { desc = "Terminal (Root Dir)" })
-- map("n", "<c-_>", lazyterm, { desc = "which_key_ignore" })
-- map("n", "<A-i>", function() LazyVim.terminal() end, { desc = "Terminal (cwd)" })
--
-- -- Terminal Mappings
-- map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
-- map("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to Left Window" })
-- map("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to Lower Window" })
-- map("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to Upper Window" })
-- map("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to Right Window" })
-- map("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
-- map("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })
-- map("t", "<A-i>", "<cmd>close<cr>", { desc = "which_key_ignore" })
--
-- -- windows
-- map("n", "<leader>ww", "<C-W>p", { desc = "Other Window", remap = true })
-- map("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })
-- map("n", "<leader>w-", "<C-W>s", { desc = "Split Window Below", remap = true })
-- map("n", "<leader>w|", "<C-W>v", { desc = "Split Window Right", remap = true })
-- map("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
-- map("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })
-- map("n", "<leader>wm", function() LazyVim.toggle.maximize() end, { desc = "Maximize Toggle" })
--
-- -- tabs
-- map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
-- map("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })
-- map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
-- map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
-- map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
-- map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
-- map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
--
-- -- format
-- map({ "n", "v" }, "<leader>lf", function()
--   LazyVim.format({ force = true })
-- end, { desc = "Format" })
