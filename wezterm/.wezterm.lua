local wezterm = require 'wezterm'
local config = wezterm.config_builder()

wezterm.on('format-window-title', function()
  return 'Koimeow :3'
end)

config.color_scheme = 'Catppuccin Macchiato'
config.font = wezterm.font 'JetBrains Mono'
config.hide_tab_bar_if_only_one_tab = true

config.default_domain = 'WSL:Arch'

config.window_frame = {
  active_titlebar_bg = '24273a',
  font = wezterm.font { family = 'JetBrains Mono'},
  font_size = 10.0,
}

config.colors = {
  tab_bar = {
    background = '24273a',

    active_tab = {
      bg_color = '1f1d2c',
      fg_color = 'cad3f5',
    },

    new_tab = {
      bg_color = '181926',
      fg_color = 'cad3f5',
    }
  }
}

config.window_padding = {
  left = 2,
  right = 2,
  top = 2,
  bottom = 0,
}

return config
