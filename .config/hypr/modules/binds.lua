-- Binds
-- Variables
local terminal = "foot"
local fileManager = "nautilus"
local mainMod = "ALT"
local home = os.getenv("HOME")

hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ mode = 0 }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = 1 }))
hl.bind(mainMod .. " + C", hl.dsp.window.center())
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd(home .. "/.config/hypr/scripts/exit-hypr.sh"))
-- hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd(home .. "/.config/rofi/scripts/powermenu.sh"))
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call sessionMenu toggle"))
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("hyprctl reload"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("rofi -show drun"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("google-chrome-stable --ozone-platform=wayland"))

-- Focus
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

-- Move window
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))

-- Workspaces (AZERTY)
local ws_keys = {
    { "ampersand", 1 },
    { "eacute", 2 },
    { "quotedbl", 3 },
    { "apostrophe", 4 },
    { "parenleft", 5 },
    { "minus", 6 },
    { "egrave", 7 },
    { "underscore", 8 },
    { "ccedilla", 9 },
    { "agrave", 10 },
}

for _, ws in ipairs(ws_keys) do
    hl.bind(mainMod .. " + " .. ws[1], hl.dsp.focus({ workspace = ws[2] }))
    hl.bind(mainMod .. " + SHIFT + " .. ws[1], hl.dsp.window.move({ workspace = ws[2] }))
end

-- Mouse
-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Volume & brightness
hl.bind(
    "XF86AudioLowerVolume",
    hl.dsp.exec_cmd(home .. "/.config/hypr/scripts/volume.sh --dec"),
    { locked = true, repeating = true }
)
hl.bind(
    "XF86AudioRaiseVolume",
    hl.dsp.exec_cmd(home .. "/.config/hypr/scripts/volume.sh --inc"),
    { locked = true, repeating = true }
)
hl.bind(
    "XF86AudioMute",
    hl.dsp.exec_cmd(home .. "/.config/hypr/scripts/volume.sh --toggle-mut"),
    { locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(home .. "/.config/hypr/scripts/backlight.sh --dec"), {
    locked = true,
    repeating = true,
})
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(home .. "/.config/hypr/scripts/backlight.sh --inc"), {
    locked = true,
    repeating = true,
})
hl.bind(mainMod .. " + SHIFT + DOWN", hl.dsp.exec_cmd(home .. "/.config/hypr/scripts/backlight.sh --dec"), {
    locked = true,
    repeating = true,
})
hl.bind(mainMod .. " + SHIFT + UP", hl.dsp.exec_cmd(home .. "/.config/hypr/scripts/backlight.sh --inc"), {
    locked = true,
    repeating = true,
})

-- Media
---- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

hl.bind("SUPER + Print", hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind("Print", hl.dsp.exec_cmd("hyprshot -m output"))

-- hl.bind("SUPER + Print", hl.dsp.exec_cmd('hyprshot -m window -o ~/Pictures/Screenshots'))
-- hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd('hyprshot -m region -o ~/Pictures/Screenshots'))
-- hl.bind("Print", hl.dsp.exec_cmd('hyprshot -m output -o ~/Pictures/Screenshots'))
