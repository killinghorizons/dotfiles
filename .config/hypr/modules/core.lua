-- Config
hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 5,
        border_size = 2,
        resize_on_border = true,
        col = {
            active_border = { colors = { "rgb(135,206,235)" } },
        },
        allow_tearing = false,
        layout = "scrolling",
    },

    animations = {
        enabled = true,
    },

    ecosystem = {
        no_update_news = true,
        no_donation_nag = true,
    },

    decoration = {
        rounding = 0,
        rounding_power = 0,
        blur = { enabled = false },
    },

    cursor = {
        no_hardware_cursors = false,
    },

    scrolling = {
        fullscreen_on_one_column = true,
        column_width = 0.5,
        direction = "right",
    },

    misc = {
        disable_hyprland_logo = true,
        mouse_move_enables_dpms = true,
        key_press_enables_dpms = true,
        vrr = 1,
    },

    xwayland = {
        force_zero_scaling = true,
    },

    input = {
        kb_layout = "fr",
        follow_mouse = 1,
        sensitivity = 0,
        accel_profile = "flat",
        touchpad = {
            natural_scroll = true,
        },
    },

    -- dwindle = {
    --     force_split = 1,
    --     preserve_split = true,
    -- },
})

-- Define your custom curve (replaces: bezier = easeOut, 0.2, 1, 0.2, 1)
hl.curve("easeOut", { type = "bezier", points = { { 0.2, 1 }, { 0.2, 1 } } })

-- animation = windows, 1, 5, easeOut
hl.animation({ leaf = "windows", enabled = true, speed = 5, bezier = "easeOut" })

-- animation = windowsIn, 1, 5, default, popin
hl.animation({ leaf = "windowsIn", enabled = true, speed = 5, bezier = "default", style = "popin" })

-- animation = workspaces, 1, 6, default
hl.animation({ leaf = "workspaces", enabled = true, speed = 6, bezier = "default" })
