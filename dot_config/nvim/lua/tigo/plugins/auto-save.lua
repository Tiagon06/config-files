return {
  "Pocco81/auto-save.nvim",
  opts = {
    -- Default configuration (you don't need this if you want defaults)
    enabled = false,
    execution_message = {
      message = function() return "" end,  -- Disable message
      dim = 0.18,
      cleaning_interval = 1250,
    },
    trigger_events = {"InsertLeave"}, -- Save on typing and leaving insert mode
    condition = function(buf)
      local fn = vim.fn
      local utils = require("auto-save.utils.data")

      if fn.getbufvar(buf, "&modifiable") == 1 and
         utils.not_in(fn.getbufvar(buf, "&filetype"), {"TelescopePrompt", "alpha", "dashboard"}) then
        return true -- met condition(s), can save
      end
      return false  -- can't save
    end,
  },
  -- Optional: Set up keymaps
  config = function(_, opts)
    require("auto-save").setup(opts)
    -- Toggle auto-save (optional)
    vim.keymap.set("n", "<leader>as", "<cmd>ASToggle<CR>", { desc = "Toggle Auto Save" })
  end
}
