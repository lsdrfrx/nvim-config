status, as = pcall(require, "auto-save")
if not status then
  return
end

as.setup({
  trigger_events = {"InsertLeave", "FocusLost"},
})

