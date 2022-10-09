local wezterm = require('wezterm')

return {
    font_size = 14.0,
    line_height = 1.1,
    font = wezterm.font_with_fallback {
  --      'CaskaydiaCove Nerd Font',
        'Fira Code',
        'JetBrains Mono',
    },
 --   harfbuzz_features = {"ss01" , "calt" },
    -- colors = colors,
    window_frame = {
        active_titlebar_bg = '#000000',
    }, -- needed only if using fancy tab bar
    color_scheme = "tokyonight",
    warn_about_missing_glyphs = false,
    hide_tab_bar_if_only_one_tab = true,
    window_background_opacity = 0.80,
}
