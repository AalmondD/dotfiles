-- ~/.config/nvim/lua/custom/init.lua

vim.g.loaded_python3_provider = nil
vim.g.python3_host_prog = vim.fn.expand("~/.nvim-venv/bin/python3")

require("custom.mappings")  -- Carga custom/mappings.lua




