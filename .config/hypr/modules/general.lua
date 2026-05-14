-- ~/.config/hypr/modules/general.lua

hl.config({
    general = {
        layout    = "dwindle",
        gaps_in   = 5,
        gaps_out  = 10,
        border_size = 2,
        ["col.active_border"]   = "rgb(ebdbb2)",
        ["col.inactive_border"] = "rgb(272727)",
    },
    dwindle = {
        preserve_split = true,
        force_split    = 2,
    },
    misc = {
        disable_hyprland_logo    = true,
        disable_splash_rendering = true,
        force_default_wallpaper  = 0,
    },
})
