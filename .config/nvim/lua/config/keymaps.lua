local settings = require("settings")
local Util = require("lazyvim.util")
local map = vim.keymap.set
local nomap = vim.keymap.del

local function nmap(key, action, desc)
  map("n", key, action, { desc = desc })
end
local safeNoMap = function(key)
  pcall(vim.keymap.del, "n", key)
end
--disabled
safeNoMap("<leader>cF")
safeNoMap("<leader>cm")
safeNoMap("<leader>bl")
safeNoMap("<leader>br")
safeNoMap("<C-W>")
safeNoMap("<C-W><Space>")
safeNoMap("<C-W>d")
safeNoMap("<C-W><C-D>")
--mini-files
-- ── unbind ────────────────────────────────────────────────────
map({ "n", "v" }, "<leader>nd", "<cmd> NoiceDismiss <CR>", { desc = "Noice - Dismiss Notifications" })
--lsp
map("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Line Diagnostics" })

--bufferline
map("n", "<leader>ul", function()
  if vim.o.showtabline == 2 then
    vim.o.showtabline = 0
  else
    vim.o.showtabline = 2
  end
end, { desc = "toggle tabline" })

-- harpoon
nmap("<Leader>ke", function()
  require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
end, "harpoon menu")
nmap("<Leader>ka", function()
  require("harpoon"):list():add()
end, "harpoon add file")
nmap("<C-Q>", function()
  require("harpoon"):list():select(1)
end, "Harpoon file 1")
nmap("<C-W>", function()
  require("harpoon"):list():select(2)
end, "Harpoon file 2")
nmap("<C-A>", function()
  require("harpoon"):list():select(3)
end, "Harpoon file 3")
nmap("<C-S>", function()
  require("harpoon"):list():select(4)
end, "Harpoon file 4")
-- hop
nmap("<leader>h", function()
  require("hop").hint_words({ direction = 2, jump_on_sole_occurrence = true })
end, "Hop Forward")
nmap("<leader>H", function()
  require("hop").hint_words({ direction = 1, jump_on_sole_occurrence = true })
end, "Hop Backwards")

-- split
nmap("|", function()
  vim.cmd("vsplit")
  require("telescope").extensions.smart_open.smart_open({ cwd_only = true, filename_first = true })
end, "vsplit")
nmap("-", "<cmd>split<cr>", "vsplit")
-- ── smart splits ──────────────────────────────────────────────
if Util.has("smart-splits.nvim") then
  local splits = require("smart-splits")
  map("n", "<C-h>", function()
    splits.move_cursor_left()
  end, { desc = "SmartSplits - Focus Left" })
  map("n", "<C-j>", function()
    splits.move_cursor_down()
  end, { desc = "SmartSplits - Focus Down" })
  map("n", "<C-k>", function()
    splits.move_cursor_up()
  end, { desc = "SmartSplits - Focus Up" })
  map("n", "<C-l>", function()
    splits.move_cursor_right()
  end, { desc = "SmartSplits - Focus Right" })

  map("n", "<A-left>", function()
    splits.resize_left()
  end, { desc = "SmartSplits - Resize Left" })
  map("n", "<A-down>", function()
    splits.resize_down()
  end, { desc = "SmartSplits - Resize Down" })
  map("n", "<A-up>", function()
    splits.resize_up()
  end, { desc = "SmartSplits - Resize Up" })
  map("n", "<A-right>", function()
    splits.resize_right()
  end, { desc = "SmartSplits - Resize Right" })

  map("n", "<A-h>", function()
    splits.resize_left()
  end, { desc = "SmartSplits - Resize Left" })
  map("n", "<A-j>", function()
    splits.resize_down()
  end, { desc = "SmartSplits - Resize Down" })
  map("n", "<A-k>", function()
    splits.resize_up()
  end, { desc = "SmartSplits - Resize Up" })
  map("n", "<A-l>", function()
    splits.resize_right()
  end, { desc = "SmartSplits - Resize Right" })

  map("n", "<leader><leader>h", function()
    splits.swap_buf_left()
  end, { desc = "SmartSplits - Swap Buffer Left" })
  map("n", "<leader><leader>j", function()
    splits.swap_buf_down()
  end, { desc = "SmartSplits - Swap Buffer Down" })
  map("n", "<leader><leader>k", function()
    splits.swap_buf_up()
  end, { desc = "SmartSplits - Swap Buffer Up" })
  map("n", "<leader><leader>l", function()
    splits.swap_buf_right()
  end, { desc = "SmartSplits - Swap Buffer Right" })
end

-- ── lazygit ───────────────────────────────────────────────────
map({ "n", "v" }, "<leader>lg", function()
  LazyVim.lazygit({ cwd = LazyVim.root.git() })
end, { desc = "Lazygit (Root Dir)" })
-- ── lazy ──────────────────────────────────────────────────────
-- ── lazy extras ───────────────────────────────────────────────

--telescope
nmap("<Leader>sz", "<Cmd>Telescope zoxide list<CR>", "telescope zoxide")
map("n", "<leader>f", function()
  if settings.fild_finder == "smart_open" then
    require("telescope").extensions.smart_open.smart_open({ cwd_only = true, filename_first = true })
  else
    require("telescope").extensions.frecency.frecency({ workspace = "CWD" })
  end
end, { desc = "find files" })

-- ── floating terminal ─────────────────────────────────────────
local lazyterm = function()
  LazyVim.terminal(nil, { cwd = LazyVim.root() })
end

-- ── Terminal Mappings ─────────────────────────────────────────
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
map("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to Left Window" })
map("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to Lower Window" })
map("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to Upper Window" })
map("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to Right Window" })
map("t", "<M-i>", "<cmd>close<cr>", { desc = "Hide Terminal" })

-- ── Toggle Context ────────────────────────────────────────────
map("n", "<leader>ux", "<CMD>TSContextToggle<CR>", { desc = "Toggle Context" })
map("n", "<leader>ug", "<CMD>Gitsigns toggle_signs<CR>", { desc = "Toggle Git Signs" })

-- Move Lines
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

-- -- buffers
map("n", "<leader>bd", LazyVim.ui.bufremove, { desc = "Delete Buffer" })
-- -- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })
--
-- -- Clear search, diff update and redraw
-- -- taken from runtime/lua/_editor.lua
map(
  "n",
  "<leader>ur",
  "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
  { desc = "Redraw / Clear hlsearch / Diff Update" }
)

map("v", "<", "<gv")
map("v", ">", ">gv")
--
-- -- commenting
map("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
map("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })
--
--
-- -- diagnostic
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function() end
end
map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
--
-- -- stylua: ignore start
--
-- -- toggle options
map("n", "<leader>us", function()
  LazyVim.toggle("spell")
end, { desc = "Toggle Spelling" })
if vim.lsp.buf.inlay_hint or vim.lsp.inlay_hint then
  map("n", "<leader>uh", function()
    LazyVim.toggle.inlay_hints()
  end, { desc = "Toggle Inlay Hints" })
end
map("n", "<leader>ut", "<cmd>TailwindFoldToggle<cr>", { desc = "Toggle Tailwind Fold" })
map("n", "<leader>ui", vim.show_pos, {
  desc = "Inspect Pos",
})
map("n", "<leader>uI", "<cmd>InspectTree<cr>", { desc = "Inspect Tree" })
map("n", "<Leader>m", "<cmd>TSJJoin<cr>") --
map("n", "<Leader>M", "<cmd>TSJSplit<cr>") --
--
--
--
--
