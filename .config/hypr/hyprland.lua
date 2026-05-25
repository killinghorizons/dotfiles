-- Variables
local terminal = "foot"
local fileManager = "nautilus"
local browser = "google-chrome-unstable"
local rofi_cmd = "rofi -show drun"
local mainMod = "ALT"
local home = os.getenv("HOME")

-- Autostart
hl.on("hyprland.start", function()
  hl.exec_cmd("hyprsunset")
  hl.exec_cmd("waybar")
  hl.exec_cmd("swaybg -i ~/.config/hypr/walls/arch.png")
  hl.exec_cmd("systemctl --user start hyprpolkitagent")
end)

-- Monitor
-- hl.monitor({ output = "", mode = "preferred", position = "auto", scale = "auto" })
hl.monitor({ output = "eDP-1", mode = "1920x1080@144", position = "0x0", scale = 1, vrr = true })

-- Environment
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("WLR_NO_HARDWARE_CURSORS", "1")

-- Core
hl.config({
  general = {
    gaps_in = 2,
    gaps_out = 0,
    border_size = 2,
    resize_on_border = true,
    col = {
      active_border = { colors = { "rgb(135,206,235)" } },
    },
    allow_tearing = false,
    layout = "dwindle",
  },

  animations = {
    enabled = false,
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
    repeat_rate = 50,
    repeat_delay = 300,
    touchpad = {
      natural_scroll = true,
    },
  },

  dwindle = {
    force_split = 2,
    preserve_split = true,
  },
})

-- Animations
hl.curve("easeOut", { type = "bezier", points = { { 0.2, 1 }, { 0.2, 1 } } })
-- animation = windows, 1, 5, easeOut
hl.animation({ leaf = "windows", enabled = true, speed = 3, bezier = "easeOut" })
-- animation = windowsIn, 1, 5, default, popin
hl.animation({ leaf = "windowsIn", enabled = true, speed = 3, bezier = "default", style = "popin" })
-- animation = workspaces, 1, 6, default
hl.animation({ leaf = "workspaces", enabled = true, speed = 3, bezier = "default" })

-- Binds
-- Programs
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(rofi_cmd))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd("~/.config/rofi/scripts/powermenu.sh"))
-- Layouts
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
-- Windows
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ mode = 0 }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = 1 }))
hl.bind(mainMod .. " + C", hl.dsp.window.center())
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
-- Reload / Quit
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("hyprctl reload"))
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd("hyprshutdown"))

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
--

-- Window rules
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

hl.window_rule({ name = "modal-open", match = { title = "^(Open)$" }, float = true })
hl.window_rule({ name = "modal-choose-files", match = { title = "^(Choose Files)$" }, float = true })
hl.window_rule({ name = "modal-save-as", match = { title = "^(Save As)$" }, float = true })
hl.window_rule({ name = "modal-confirm-replace", match = { title = "^(Confirm to replace files)$" }, float = true })
hl.window_rule({ name = "modal-file-op-progress", match = { title = "^(File Operation Progress)$" }, float = true })
