local status_ok, multicursor = pcall(require, "multicursor")
if not status_ok then
  return
end

local settings = {}

multicursor.setup(settings)
