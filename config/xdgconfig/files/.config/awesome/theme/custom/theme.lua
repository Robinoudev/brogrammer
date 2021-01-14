local awful = require("awful")
local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
-- local xrdb = xresources.get_current_theme()
local gears = require("gears")
local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()
-- local helpers = require("helpers")

-- Inherit default theme

local theme = dofile(themes_path .. "default/theme.lua")

theme.font = "JetBrainsMono Nerd Font 10"
theme.useless_gap   = dpi(5)

return theme
