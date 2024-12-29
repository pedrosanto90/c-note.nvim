local M = {}

local create_note = function()
  -- create a vertical split to open a new file in the split
  vim.cmd("vsplit")
  local win = vim.api.nvim_get_current_win()

  vim.cmd("edit notes.md")

  local buf = vim.api.nvim_get_current_buf()
  vim.api.nvim_win_set_buf(win, buf)

  local screen_width = vim.api.nvim_get_option("columns")
  local split_width = math.floor(screen_width * 0.3)
  vim.api.nvim_win_set_config(win, { width = split_width })
end

M.create_note = create_note

-- default keymap
vim.api.nvim_set_keymap('n', '<space>cn', '<cmd>lua require("c-note").create_note()<CR>',
  { noremap = true, silent = true })
-- M.create_split()

print "c-note"

return M
