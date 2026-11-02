-- ~/.config/hypr/modules/keybinds.lua

local mod = "SUPER"

-- Applications
hl.bind(mod .. " + RETURN",          hl.dsp.exec_cmd(terminal))
hl.bind(mod .. " + SHIFT + RETURN", hl.dsp.exec_cmd("env NOTMUX=1 " .. terminal))
hl.bind(mod .. " + BACKSLASH", hl.dsp.exec_cmd(browser))
hl.bind(mod .. " + BACKSPACE",    hl.dsp.exec_cmd(browser)) -- for ferris sweep
-- hl.bind(mod .. " + M",         hl.dsp.exec_cmd(spotify))

hl.bind(mod .. " + Q", hl.dsp.window.close())

-- Move focus with mainMod + vi keys
hl.bind(mod .. " + H", hl.dsp.focus({ direction = "l" }))
hl.bind(mod .. " + L", hl.dsp.focus({ direction = "r" }))
hl.bind(mod .. " + K", hl.dsp.focus({ direction = "u" }))
hl.bind(mod .. " + J", hl.dsp.focus({ direction = "d" }))

-- Move focused window with mainMod + Shift + vi keys
hl.bind(mod .. " + SHIFT + H", hl.dsp.window.move({ direction = "l" }))
hl.bind(mod .. " + SHIFT + L", hl.dsp.window.move({ direction = "r" }))
hl.bind(mod .. " + SHIFT + K", hl.dsp.window.move({ direction = "u" }))
hl.bind(mod .. " + SHIFT + J", hl.dsp.window.move({ direction = "d" }))

-- Switch workspaces with mainMod + [0-9]
for i = 1, 9 do
    hl.bind(mod .. " + " .. i,         hl.dsp.focus({ workspace = i }))
    hl.bind(mod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i, follow = true }))
end
hl.bind(mod .. " + 0",         hl.dsp.focus({ workspace = 10 }))
hl.bind(mod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10, follow = true }))

-- Consume Super+w-p to prevent bleed into tmux window switching (Super+q is already bound)
for _, key in ipairs({ "W", "E", "R", "T", "Y", "U", "I", "O", "P" }) do
    hl.bind(mod .. " + " .. key, hl.dsp.exec_cmd("true"))
end

-- Volume
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true, locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { repeating = true, locked = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true })
