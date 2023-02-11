local status, bufferline = pcall(require, "bufferline")
if not status then
  return
end

bufferline.setup({
  options = {
    mode = 'tabs',
    show_duplicate_prefix = false,
    show_close_icon = false,
    offsets = {
      {
        filetype = "NvimTree",
        text = "Project",
        highlight = "Directory",
        separator = true,
      },
    },
  },
})
