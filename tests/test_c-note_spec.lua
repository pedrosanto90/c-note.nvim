-- tests/test_c-note.lua
-- local helpers = require('plenary.test_harness.helpers')
local eq = assert.are.same

describe('MyPlugin', function()
  it('should create a vertical split with notes.md', function()
    -- Save the initial window count
    local initial_win_count = #vim.api.nvim_list_wins()

    -- Call the function to create the split
    require('c-note')._create_note()

    -- Get the new window count
    local new_win_count = #vim.api.nvim_list_wins()

    -- Assert that a new window was created
    eq(new_win_count, initial_win_count + 1)

    -- Check that the file opened in the new window is notes.md
    local current_buf = vim.api.nvim_get_current_buf()
    local buf_name = vim.api.nvim_buf_get_name(current_buf)
    eq(buf_name:match("notes.md$"), "notes.md")

    -- Check the width of the new split
    local screen_width = vim.o.columns
    local expected_width = math.floor(screen_width * 0.3)
    local win = vim.api.nvim_get_current_win()
    local win_width = vim.api.nvim_win_get_width(win)
    eq(win_width, expected_width)
  end)
end)
