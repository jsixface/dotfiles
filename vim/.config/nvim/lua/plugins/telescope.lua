return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim", },
    config = function()
      local actions = require("telescope.actions")
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<C-p>", builtin.find_files, {})
      vim.keymap.set("n", "<C-o>", builtin.buffers, {})
      vim.keymap.set("n", "<leader>ff", builtin.live_grep, {})
      vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, {})

      require("telescope").setup({
          defaults = {
              file_ignore_patterns = { "node_modules", ".git/" },
              mappings = {
                  i = {
                      ["<esc>"] = actions.close,
                  },
              },
          },
          extensions = {
              ["ui-select"] = {
              require("telescope.themes").get_dropdown { }
            }
          }
        })
      require("telescope").load_extension("ui-select")
    end,
  },
}
