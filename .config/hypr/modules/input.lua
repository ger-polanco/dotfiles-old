-- ~/.config/hypr/modules/input.lua

hl.config({
    input = {
        kb_layout    = "us",
        repeat_rate  = 40,
        repeat_delay = 240,
    },
})

-- Keyboard
hl.device({
    name         = "keychron-keychron-q1",
    kb_layout    = "us",
    repeat_rate  = 40,
    repeat_delay = 240,
})

-- Mouse
-- hl.device({
--     name         = "logitech-usb-receiver",
--     accel_profile = "flat",
--     sensitivity   = 0.0,
-- })
--
-- hl.device({
--     name         = "logitech-usb-receiver-keyboard-1",
--     accel_profile = "flat",
--     sensitivity   = 0.0,
-- })

hl.device({
    name         = "logitech-pro-x-1",
    accel_profile = "flat",
    sensitivity   = 0.0,
})
