local Util = require("lazyvim.util")
local map = vim.keymap.set

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
safeNoMap("gD")
safeNoMap("<C-W><Space>")
safeNoMap("<C-W>d")
safeNoMap("<C-W><C-D>")
--mini-files
-- ── unbind ────────────────────────────────────────────────────
map({ "n", "v" }, "<leader>nd", "<cmd> NoiceDismiss <CR>", { desc = "Noice - Dismiss Notifications" })
--lsp
map("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map("n", "<leader>lk", "<cmd>LspRestart<CR>", { desc = "Line Diagnostics" })

-- harpoon
nmap("<leader>ke", function()
  require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
end, "harpoon menu")
nmap("<leader>ka", function()
  require("harpoon"):list():add()
end, "harpoon add file")
nmap("<leader>1", function()
  require("harpoon"):list():select(1)
end, "Harpoon file 1")
nmap("<leader>2", function()
  require("harpoon"):list():select(2)
end, "Harpoon file 2")
nmap("<leader>3", function()
  require("harpoon"):list():select(3)
end, "Harpoon file 3")
nmap("<leader>4", function()
  require("harpoon"):list():select(4)
end, "Harpoon file 4")

nmap("<leader>4", function()
  require("harpoon"):list():select(4)
end, "Harpoon file 4")
nmap("<leader>5", function()
  require("harpoon"):list():select(4)
end, "Harpoon file 5")
-- hop
nmap("<leader>h", function()
  require("hop").hint_words({ direction = 2, jump_on_sole_occurrence = true })
end, "Hop Forward")
nmap("<leader>H", function()
  require("hop").hint_words({ direction = 1, jump_on_sole_occurrence = true })
end, "Hop Backwards")
-- lsp

nmap("gG", function()
  local e = vim.cmd("vsplit")
  vim.lsp.buf.definition()
end, "vsplit")
nmap("J", function()
  local col = vim.fn.col(".")
  vim.cmd("normal! J")
  vim.fn.cursor(vim.fn.line("."), col)
end, "Join lines ")
nmap("<leader>uo", function()
  require("illuminate").toggle_visibility_buf()
end, "Toggle lsp highlights")
-- split
nmap("|", "<cmd>vsplit<cr>", "Split vertical")
nmap("<Leader>|", function()
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
  require("snacks").lazygit({ cwd = LazyVim.root.git() })
end, { desc = "Lazygit (Root Dir)" })
-- ── term ──────────────────────────────────────────────────────

--telescope
nmap("<Leader>sz", "<Cmd>Telescope zoxide list<CR>", "telescope zoxide")
map("n", "<leader>f", function()
    require("telescope").extensions.smart_open.smart_open({ cwd_only = true, filename_first = true })
end, { desc = "find files" })

-- ── floating terminal ─────────────────────────────────────────

-- Terminal Mappings
map("n", "<M-o>", function()
  Snacks.terminal.toggle(nil, { cwd = LazyVim.root(), win = { position = "right" } })
end, { desc = "Terminal (Root Dir)" })
map("n", "<M-i>", function()
  Snacks.terminal.open(nil, { cwd = LazyVim.root(), win = { position = "right" } })
end, { desc = "Terminal (Root Dir)" })
map("n", "<c-/>", function()
  Snacks.terminal(nil, { cwd = LazyVim.root() })
end, { desc = "Terminal (Root Dir)" })
map("n", "<c-_>", function()
  Snacks.terminal(nil, { cwd = LazyVim.root() })
end, { desc = "which_key_ignore" })
map("t", "<M-i>", "<cmd>close<cr>", { desc = "Hide Terminal" })
map("t", "<M-o>", "<cmd>close<cr>", { desc = "Hide Terminal" })
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
map("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to Left Window" })
map("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to Lower Window" })
map("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to Upper Window" })
map("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to Right Window" })
map("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
map("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })

-- ── Toggle Context ────────────────────────────────────────────
map("n", "<leader>ux", "<CMD>TSContextToggle<CR>", { desc = "Toggle Context" })
map("n", "<leader>ug", "<CMD>Gitsigns toggle_signs<CR>", { desc = "Toggle Git Signs" })

-- Move Lines
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

-- -- buffers
map("n", "<leader>bd", require("snacks.bufdelete").delete, { desc = "Delete Buffer" })
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
  return function()
    go({ severity = severity })
  end
end
map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
--
-- -- stylua: ignore start
--
-- -- toggle options
LazyVim.format.snacks_toggle():map("<leader>uf")
LazyVim.format.snacks_toggle(true):map("<leader>uF")
Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
Snacks.toggle.diagnostics():map("<leader>ud")
Snacks.toggle.line_number():map("<leader>ul")
Snacks.toggle
  .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
  :map("<leader>uc")
Snacks.toggle.treesitter():map("<leader>uT")
Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
if vim.lsp.inlay_hint then
  Snacks.toggle.inlay_hints():map("<leader>uh")
end
