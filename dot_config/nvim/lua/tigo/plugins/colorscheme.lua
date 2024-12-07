return {
  "folke/tokyonight.nvim",
  priority = 1000,
  config = function()
    local transparent = false -- set to true if you would like to enable transparency

    local bg = "#011628"
    local bg_dark = "#011423"
    local bg_highlight = "#143652"
    local bg_search = "#0A64AC"
    local bg_visual = "#275378"
    local fg = "#CBE0F0"
    local fg_dark = "#B4D0E9"
    local fg_gutter = "#627E97"
    local border = "#547998"

    require("tokyonight").setup({
      style = "night",
      transparent = transparent,
      styles = {
        sidebars = transparent and "transparent" or "dark",
        floats = transparent and "transparent" or "dark",
      },
      on_colors = function(colors)
        colors.red = "#FF0000"
        colors.green = "#32CD30"
        colors.blue = "#5294E3"
        colors.bg = bg
        colors.bg_dark = transparent and colors.none or bg_dark
        colors.bg_float = bg_highlight
        colors.bg_highlight = bg_highlight
        colors.bg_popup = bg_dark
        colors.bg_search = bg_search
        colors.bg_sidebar = transparent and colors.none or bg_dark
        colors.bg_statusline = transparent and colors.none or bg_dark
        colors.bg_visual = bg_visual
        colors.border = border
        colors.fg = fg
        colors.fg_dark = fg_dark
        colors.fg_gutter = fg_gutter
        colors.fg_sidebar = fg_dark
      end,
      on_highlights = function(hl, c)
        -- Apply custom highlights
        hl.Boolean = { fg = c.red }
        hl.Operator = { fg = c.orange }
        hl.Keyword = { fg = c.red }
        hl.LineNr = { fg = c.blue }
        hl.Type = { fg = c.orange }
        hl.Conditional = { fg = c.orange }
        hl.Repeat = { fg = c.orange }
        hl.Label = { fg = c.orange }
        hl.ColorColumn = { fg = c.dark5 }
        hl.Comment = { fg = c.comment, italic = true }
      end,
    })

    vim.cmd("colorscheme tokyonight")
  end,
}

