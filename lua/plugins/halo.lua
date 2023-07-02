return {
  {
    "ggandor/leap.nvim",
    lazy = true,
    keys = { "E", "R", "W", "dE", "dR", "yE", "yR", "cE", "cR" },
    config = function()
      require("leap").opts.highlight_unlabeled_phase_one_targets = true
      -- leap.add_default_mappings()
      vim.keymap.set({ "x", "o", "n" }, "E", "<Plug>(leap-backward-to)")
      vim.keymap.set({ "x", "o", "n" }, "R", "<Plug>(leap-forward-to)")
      vim.keymap.set({ "x", "o", "n" }, "W", "<Plug>(leap-from-window)")
    end,
  },
  {
    "ggandor/flit.nvim",
    lazy = true,
    keys = { "f", "F", "t", "T" },
    dependencies = { "ggandor/leap.nvim" },
    config = function()
      require("flit").setup({
        keys = { f = "f", F = "F", t = "t", T = "T" },
        labeled_modes = "v",
        multiline = true,
        opts = {},
      })
    end,
  },
  {
    "ethanholz/nvim-lastplace",
    lazy = true,
    event = { "User FileOpened" },
    config = function()
      require("nvim-lastplace").setup({
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = {
          "gitcommit",
          "gitrebase",
          "svn",
        },
        lastplace_open_folds = true,
      })
    end,
  },
  {
    "folke/persistence.nvim",
    -- Restore last session of current dir
    lazy = true,
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    config = function()
      require("persistence").setup({
        dir = vim.fn.expand(vim.fn.stdpath("config") .. "/session/"),
        options = { "buffers", "curdir", "tabpages", "winsize" },
        pre_save = nil,
      })
    end,
  },
  {
    "max397574/better-escape.nvim",
    lazy = true,
    event = { "InsertEnter" },
    config = function()
      require("better_escape").setup({
        mapping = { "jk", "jl" },
        timeout = 200,
        clear_empty_lines = false,
        keys = "<Esc>",
      })
    end,
  },
  {
    "chentoast/marks.nvim",
    lazy = true,
    event = { "User FileOpened" },
    config = function()
      require("marks").setup({
        default_mappings = true,
        -- builtin_marks = { ".", "<", ">", "^" },
        cyclic = true,
        force_write_shada = false,
        refresh_interval = 250,
        sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
        excluded_filetypes = {
          "qf",
          "NvimTree",
          "toggleterm",
          "TelescopePrompt",
          "alpha",
          "netrw",
        },
        bookmark_0 = {
          sign = "",
          virt_text = "hello world",
          annotate = false,
        },
        mappings = {},
      })
    end,
  },
  {
    "zbirenbaum/neodim",
    lazy = true,
    event = "LspAttach",
    config = function()
      require("neodim").setup({
        alpha = 0.75,
        blend_color = "#000000",
        update_in_insert = {
          enable = true,
          delay = 100,
        },
        hide = {
          virtual_text = true,
          signs = false,
          underline = false,
        },
      })
    end,
  },
}
