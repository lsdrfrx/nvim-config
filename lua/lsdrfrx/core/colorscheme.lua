local colors = require("onenord.colors")


require('onenord').setup({
  theme = "dark",

  styles = {
    comments = "italic",
    keywords = "italic",
    functions = "italic",
  },

  disable = {
    background = true,
  },

  custom_highlights = {
    NvimTreeOpenedFile = {
      fg = colors.diff_add,
      style = "bold",
    },
    BufferLineFill = {
      bg = 'none',
    },
  },
})


