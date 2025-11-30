vim.keymap.set("n", "<leader>d", function()
  require("snacks").dashboard.open()
end, { desc = "Open Snacks Dashboard" })
