-- Window rules
local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name = "fix-xwayland-drags",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },

    no_focus = true,
})

hl.window_rule({ match = { class = "nwg-look" }, float = true, size = { 800, 500 } })
hl.window_rule({ match = { class = "xdg-desktop-portal-gtk" }, center = true, float = true, size = { 900, 600 } })
hl.window_rule({ match = { class = "discord" }, workspace = "4 silent" })

hl.window_rule({ name = "file-roller-float", match = { class = "^(file-roller)$" }, float = true })
hl.window_rule({ name = "file-roller-center", match = { class = "^(file-roller)$" }, center = true })

hl.window_rule({ name = "modal-open", match = { title = "^(Open)$" }, float = true })
hl.window_rule({ name = "modal-choose-files", match = { title = "^(Choose Files)$" }, float = true })
hl.window_rule({ name = "modal-save-as", match = { title = "^(Save As)$" }, float = true })
hl.window_rule({ name = "modal-confirm-replace", match = { title = "^(Confirm to replace files)$" }, float = true })
hl.window_rule({ name = "modal-file-op-progress", match = { title = "^(File Operation Progress)$" }, float = true })
hl.window_rule({
    name = "chrome-open-files",
    match = { class = "^(google-chrome)$", title = "^(Open Files)$" },
    float = true,
})
hl.window_rule({
    name = "chrome-open-file",
    match = { class = "^(google-chrome)$", title = "^(Open File)$" },
    float = true,
})
