return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    auto_close = true,
    modes = {
      diagnostics = {
        focus = false,
        groups = {
          { "filename", format = "{file_icon} {basename:Title} {count}" },
        },
        filter = {
          function(item)
            return item.filename:find(vim.fn.getcwd(), 1, true)
          end,
        },
      },
      diagnostics_filtered = {
        mode = "diagnostics",
        filter = {
          severity = vim.diagnostic.severity.ERROR,
        },
      },
      diagnostics_buffer = {
        mode = "diagnostics",
        filter = {
          buf = 0,
        },
        groups = {},
      },
      diagnostics_filtered_buffer = {
        mode = "diagnostics_filtered",
        filter = {
          buf = 0,
        },
        groups = {},
      },
    }
  },
  config = function(_, opts)
    local trouble = require("trouble")
    trouble.setup(opts)

    local function get_errors(bufnr)
      local diagnostics = bufnr and vim.diagnostic.get(bufnr) or vim.diagnostic.get()
      if #diagnostics == 0 then return false end
      for _, diagnostic in ipairs(diagnostics) do
        if diagnostic.severity == vim.diagnostic.severity.ERROR then
          return vim.diagnostic.severity.ERROR
        end
      end
      return true
    end

    local function toggle_diagnostics_smart()
      local mode = "diagnostics"
      local errors = get_errors()
      local errors_buffer = get_errors(0)

      if errors == vim.diagnostic.severity.ERROR then
        mode = mode .. "_filtered"
        if errors_buffer == vim.diagnostic.severity.ERROR then
          mode = mode .. "_buffer"
        end
      elseif errors_buffer then
        mode = mode .. "_buffer"
      end

      if trouble.is_open(mode) then
        trouble.close(mode)
        return
      end
      trouble.close()
      trouble.open(mode)
    end

    local function toggle_diagnostics_dumb()
      if trouble.is_open("diagnostics") then
        trouble.close("diagnostics")
        return
      end
      trouble.close()
      trouble.open("diagnostics")
    end

    vim.keymap.set("n", "<leader>dq", toggle_diagnostics_smart)
    vim.keymap.set("n", "<leader>da", toggle_diagnostics_dumb)
    vim.keymap.set("n", "<leader>dn", function()
      trouble.next()
      trouble.jump_only()
    end)
    vim.keymap.set("n", "<leader>dp", function()
      trouble.prev()
      trouble.jump_only()
    end)
  end
}
