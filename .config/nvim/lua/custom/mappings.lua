


vim.keymap.set("v", "<Tab>", ">gv", { desc = "Indent right" })
vim.keymap.set("v", "<S-Tab>", "<gv", { desc = "Indent left" })


local M = {}

M.v = {
  ["<Tab>"] = { ">gv", "Indent right and keep selection" },
  ["<S-Tab>"] = { "<gv", "Indent left and keep selection" },
}

return M
