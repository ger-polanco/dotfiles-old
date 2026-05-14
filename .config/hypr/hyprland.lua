-- ~/.config/hypr/hyprland.lua

local dir = os.getenv("HOME") .. "/.config/hypr/modules/"

dofile(dir .. "monitors.lua")
dofile(dir .. "apps.lua")
dofile(dir .. "autostart.lua")
dofile(dir .. "env.lua")
dofile(dir .. "general.lua")
dofile(dir .. "decorations.lua")
dofile(dir .. "animations.lua")
dofile(dir .. "input.lua")
dofile(dir .. "keybinds.lua")
dofile(dir .. "rules.lua")
