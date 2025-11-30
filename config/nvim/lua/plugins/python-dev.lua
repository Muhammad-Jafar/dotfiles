return {
  -- add ruff
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- for linter and formatter
        ruff = {
          init_options = {
            settings = {
              organizeImports = true,
              fixAll = true,
            },
          },
        },
        -- for typeChecking
        pyright = {
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "basic", -- options: off, basic, strict
                autoImportCompletions = true,
              },
            },
          },
        },
        -- jedi_language_server to support NumPy style, Google style, Sphinx style python docs format
        jedi_language_server = {
          init_options = {
            diagnostics = false,
          },
        },

      },

    },
  },

  -- format on save with ruff format
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "ruff_format" },
      },
    },
  },

  -- generate docs
  {
    "danymat/neogen",
    ft = "python",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      local neogen = require("neogen")
      neogen.setup({
        snippet_engine = "luasnip",
        languages = {
          python = {
            template = {
              annotation_convention = "google",
            },
          },
        },
      })
    end,
    keys = {
      {
        "<leader>cd",
        function()
          require("neogen").generate()
        end,
        desc = "Generate Docstring (Neogen)",
        ft = "python",
      },
    },
  },


}
