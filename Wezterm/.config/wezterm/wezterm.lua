local colors = require('lua/rose-pine').colors()
local window_frame = require('lua/rose-pine').window_frame()
local wezterm = require('wezterm')
return {
  font_size = 12.0,
  -- colors = colors,
  window_frame = {
      active_titlebar_bg = '#000000',
  }, -- needed only if using fancy tab bar
  color_scheme = "Catppuccin Mocha",
  warn_about_missing_glyphs=false,
  hide_tab_bar_if_only_one_tab = true,
 -- window_background_opacity = 0.50,

}
