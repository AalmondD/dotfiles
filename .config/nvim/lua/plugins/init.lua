return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
  {
    "lervag/vimtex",
    lazy = false,
    init = function()
      vim.g.vimtex_view_method = "skim" --
      vim.g.vimtex_compiler_method = "latexmk" --compilador
      vim.g.tex_conceal = 'abdmg' --no sé
      vim.opt.conceallevel= 2 --muestra en la terminal caracteres unicode de preview
      vim.g.vimtex_quickfix_mode = 1 -- Solo muestra logs de errores, no warnings
      vim.g.vimtex_quickfix_autoclose = 1 --cerrar logfile
      vim.g.vimtex_quickfix_open_on_warning = 0
      vim.g.vimtex_main_files = {"main.tex"}  -- 
    end
  },

  {
  "L3MON4D3/LuaSnip",
  version = "v2.*",
  build = "make install_jsregexp",
  dependencies = {
    "honza/vim-snippets",
    "rafamadriz/friendly-snippets", 
  },
  config = function()
    require("luasnip.loaders.from_snipmate").lazy_load({
      paths = { "~/.config/nvim/lua/custom/snippets" }
    })
    require("luasnip.loaders.from_vscode").lazy_load()
  end,
  },

  -- {
  --   "garbas/vim-snipmate",
  --   dependencies = {
  --     "honza/vim-snippets",  -- Colección estándar de snippets
  --     "rafamadriz/friendly-snippets",  -- Más snippets (opcional)
  --   },
  --   config = function()
  --     -- Ruta personalizada para tus snippets (opcional)
  --     vim.g.snipMate = { snippet_dirs = { "~/.config/nvim/lua/custom/snippets/tex.snippets" } }
  --   end,
  -- },

  {
    "akinsho/toggleterm.nvim",
    opts = {
      -- puedes personalizar el estilo de la terminal si quieres
    },
    config = function(_, opts)
      require("toggleterm").setup(opts)

      local Terminal = require("toggleterm.terminal").Terminal

      local latex_term = Terminal:new({
        cmd = "latexmk -pdf -interaction=nonstopmode " .. vim.fn.expand("%"),
        close_on_exit = false,
        direction = "float",
        hidden = true,
      })

      -- Comando personalizado en Neovim para compilar
     vim.api.nvim_create_user_command("LatexCompile", function()
        latex_term:toggle()
      end, {})
    end,
  },
  {
    "nickjvandyke/opencode.nvim",
    version = "*", -- Latest stable release
    lazy =false,
    config = function()
      ---@type opencode.Opts
      vim.g.opencode_opts = {
        -- Your configuration, if any; goto definition on the type or field for details
      }

      vim.o.autoread = true -- Required for `vim.g.opencode_opts.events.reload`

      -- Recommended/example keymaps
      vim.keymap.set({ "n", "x" }, "<leader>oa", function() require("opencode").ask("@this: ") end, { desc = "Ask OpenCode…" })
      vim.keymap.set({ "n", "x" }, "<leader>os", function() require("opencode").select() end,       { desc = "Select OpenCode…" })

      vim.keymap.set({ "n", "x" }, "go",  function() return require("opencode").operator("@this ") end,        { desc = "Append range to OpenCode", expr = true })
      vim.keymap.set("n",          "goo", function() return require("opencode").operator("@this ") .. "_" end, { desc = "Append line to OpenCode", expr = true })

      vim.keymap.set("n", "<S-C-u>", function() require("opencode").command("session.half.page.up") end,   { desc = "Scroll OpenCode up" })
      vim.keymap.set("n", "<S-C-d>", function() require("opencode").command("session.half.page.down") end, { desc = "Scroll OpenCode down" })
    end,
  },
   {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
},
}
