-- ~/.config/hypr/modules/env.lua

-- Wayland session identity
hl.env("XDG_SESSION_TYPE",    "wayland")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")

-- NVIDIA Wayland (GBM path)
hl.env("GBM_BACKEND",              "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")

-- Cursor size
hl.env("XCURSOR_SIZE", "24")
