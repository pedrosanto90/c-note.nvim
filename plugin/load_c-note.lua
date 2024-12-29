vim.api.nvim_create_user_command("CreateNote", function()
  require("c-note").create_note()
end, {})
