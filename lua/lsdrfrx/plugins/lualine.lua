local status, lualine = pcall(require, "lualine")
if not status then
  return
end

local onenord = require('lualine.themes.onenord')
onenord.normal.b.bg = nil
onenord.normal.c.bg = nil

lualine.setup({
  options = {
    theme = onenord
  }
})
