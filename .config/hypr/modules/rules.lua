-- ~/.config/hypr/modules/rules.lua

-- hl.window_rule({ match = { class = "firefox-developer-edition" }, workspace = 2 })
-- hl.window_rule({ match = { class = "discord" }, workspace = 3 })

hl.window_rule({
    match          = { class = ".*" },
    suppress_event = "maximize",
})
