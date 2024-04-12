local wezterm = require 'wezterm'
local config = {}
local act = wezterm.action

config.default_domain = "WSL:Ubuntu"

config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Medium", italic = false, stretch = "Normal" })
-- config.line_height = 1.10
-- config.cell_width = 1.07

-- config.font =
-- 	wezterm.font("DankMono Nerd Font", { weight = "Regular", stretch = "Normal", style = "Normal", italic = false }) -- /Library/Fonts/DankMonoNerdFont-Regular.ttf, CoreText
-- config.font =
-- 	wezterm.font("JetBrainsMonoNL Nerd Font Mono", { weight = "Regular", stretch = "Normal", style = "Normal" }) -- /Users/krshrimali/Library/Fonts/NerdFonts/JetBrains Mono NL SemiBold Nerd Font Complete Mono.ttf, CoreText
-- config.font = wezterm.font("DankMono Nerd Font", {weight="Regular", stretch="Normal", style="Normal"}) -- /Library/Fonts/DankMonoNerdFont-Regular.ttf, CoreText
-- config.font = wezterm.font("Iosevka", { weight = "Medium", italic = false, stretch = "Normal" })
config.font_size = 11.0

config.scrollback_lines = 10000
config.exit_behavior = "Close"
config.keys = mykeys
config.default_cursor_style = "BlinkingUnderline"
config.default_domain = "WSL:Ubuntu"
-- config.color_scheme = scheme_for_appearance(get_appearance())


-- The filled in variant of the < symbol
local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider

-- The filled in variant of the > symbol
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider

-- config.tab_bar_style = {
--   new_tab_left = wezterm.format {
--     { Background = { Color = '#0b0022' } },
--     { Foreground = { Color = '#2b2042' } },
--     { Text = SOLID_LEFT_ARROW },
--   },
--   new_tab_right = wezterm.format {
--     { Background = { Color = '#0b0022' } },
--     { Foreground = { Color = '#2b2042' } },
--     { Text = SOLID_RIGHT_ARROW },
--   },
--   new_tab_hover_left = wezterm.format {
--     { Background = { Color = '#0b0022' } },
--     { Foreground = { Color = '#1b1032' } },
--     { Text = SOLID_LEFT_ARROW },
--   },
--   new_tab_hover_right = wezterm.format {
--     { Background = { Color = '#0b0022' } },
--     { Foreground = { Color = '#1b1032' } },
--     { Text = SOLID_RIGHT_ARROW },
--   },
-- }

-- config.color_scheme = scheme_for_appearance(get_appearance())
config.hide_tab_bar_if_only_one_tab = true
config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = false

config.window_background_opacity = 1.0
config.macos_window_background_blur = 100

-- config.color_scheme = "Catppuccin Mocha"
-- config.color_scheme = 'Gruvbox Dark (Gogh)'
-- config.color_scheme = 'Gruvbox dark, medium (base16)'

-- config.color_scheme = 'Catppuccin Latte'
-- config.color_scheme = "Gruvbox Material (Gogh)"
-- config.color_scheme = "Dark+"

config.colors = {
  -- The default text color
  foreground = "#f8f8f2",
  -- The default background color
  background = "#212121",

  -- Overrides the cell background color when the current cell is occupied by the
  -- cursor and the cursor style is set to Block
  cursor_bg = "#ECEFF4",
  -- Overrides the text color when the current cell is occupied by the cursor
  cursor_fg = "#0E1415",
  -- Specifies the border color of the cursor when the cursor style is set to Block,
  -- or the color of the vertical or horizontal bar when the cursor style is set to
  -- Bar or Underline.
  cursor_border = "#f8f8f2",

  -- the foreground color of selected text
  selection_fg = "none",
  -- the background color of selected text
  selection_bg = "rgba(68,71,90,0.5)",

  -- The color of the scrollbar "thumb"; the portion that represents the current viewport
  scrollbar_thumb = "#44475a",

  -- The color of the split lines between panes
  split = "#6272a4",

  ansi = {"#21222C", "#FF5555", "#50FA7B", "#F1FA8C", "#BD93F9", "#FF79C6", "#8BE9FD", "#BBBBBB"},
  brights = {"#545454", "#FF6E6E", "#69FF94", "#FFCB6B", "#D6ACFF", "#FF92DF", "#A4FFFF", "#FFFFFF"},

  -- Since: nightly builds only
  -- When the IME, a dead key or a leader key are being processed and are effectively
  -- holding input pending the result of input composition, change the cursor
  -- to this color to give a visual cue about the compose state.
  -- compose_cursor = "#FFB86C",

  tab_bar = {
    -- The color of the strip that goes along the top of the window
    -- (does not apply when fancy tab bar is in use)
    background = "#282a36",

    -- The active tab is the one that has focus in the window
    active_tab = {
      -- The color of the background area for the tab
      bg_color = "#bd93f9",
      -- The color of the text for the tab
      fg_color = "#282a36",

      -- Specify whether you want "Half", "Normal" or "Bold" intensity for the
      -- label shown for this tab.
      -- The default is "Normal"
      intensity = "Normal",

      -- Specify whether you want "None", "Single" or "Double" underline for
      -- label shown for this tab.
      -- The default is "None"
      underline = "None",

      -- Specify whether you want the text to be italic (true) or not (false)
      -- for this tab.  The default is false.
      italic = false,

      -- Specify whether you want the text to be rendered with strikethrough (true)
      -- or not for this tab.  The default is false.
      strikethrough = false
    },

    -- Inactive tabs are the tabs that do not have focus
    inactive_tab = {
      bg_color = "#282a36",
      fg_color = "#f8f8f2"

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `inactive_tab`.
    },

    -- You can configure some alternate styling when the mouse pointer
    -- moves over inactive tabs
    inactive_tab_hover = {
      bg_color = "#6272a4",
      fg_color = "#f8f8f2",
      italic = true

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `inactive_tab_hover`.
    },

    -- The new tab button that let you create new tabs
    new_tab = {
      bg_color = "#282a36",
      fg_color = "#f8f8f2"

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `new_tab`.
    },

    -- You can configure some alternate styling when the mouse pointer
    -- moves over the new tab button
    new_tab_hover = {
      bg_color = "#ff79c6",
      fg_color = "#f8f8f2",
      italic = true

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `new_tab_hover`.
    }
  }
}

return config
