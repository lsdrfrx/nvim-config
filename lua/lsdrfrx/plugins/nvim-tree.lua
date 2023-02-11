local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
  return
end

-- recommended settings from nvim-tree documentation
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

nvimtree.setup({
  open_on_setup = true,
  renderer = {
    icons = {
      glyphs = {
        folder = {
          arrow_closed = ">",
          arrow_open = "v",
        },
      },
    },
  },
  view = {
    relativenumber = true,
  },
  actions = {
    open_file = {
      window_picker = {
        enable = false,
      },
    },
  },
})

vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
      vim.cmd "quit"
    end
  end
})
