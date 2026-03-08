return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- Load before other plugins
    config = function()
      -- Function to make background transparent
      function ColorMyPencils(color)
        -- color = color or "catppuccin"
        -- vim.cmd.colorscheme(color)
        vim.cmd.colorscheme("onehalfdark")
        vim.opt.termguicolors = true

        -- Make UI transparent
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
        vim.api.nvim_set_hl(0, "MsgArea", { bg = "none" })
        vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
        vim.api.nvim_set_hl(0, "FoldColumn", { bg = "none" })
        vim.api.nvim_set_hl(0, "VertSplit", { bg = "none" })

        
        -- cmp popup fix
        vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })
        vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#3b4261" })
        vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "none" })
        vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#555555" })
        vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
      end

      -- Catppuccin setup
      require("catppuccin").setup({
        flavour = "mocha", -- 🌙 dark mode
        transparent_background = true, -- also make plugin backgrounds transparent
        background = {
          light = "latte",
          dark = "mocha",
        },
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          telescope = true,
          notify = true,
          mini = {
            enabled = true,
            indentscope_color = "",
          },
        },
      })

      -- Apply the colorscheme
      vim.cmd.colorscheme("onehalfdark")

      -- Apply transparency
      ColorMyPencils()
    end,
  },
}
