# Format man pages
set -U fish_greeting
set -gx MANROFFOPT "-c"
set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"

# Set settings for https://github.com/franciscolourenco/done
set -U __done_min_cmd_duration 10000
set -U __done_notification_urgency_level low

# Fuzzy finder integration.
fzf --fish | source

# Apply .profile: use this to put fish compatible .profile stuff in
if test -f ~/.fish_profile
  source ~/.fish_profile
end

# Add ~/.local/bin to PATH
fish_add_path ~/.local/bin

## Useful aliases
alias ls="lsd"
alias ll="lsd -l"
alias lla="lsd -lah"

# Common use
abbr -a nv nvim
abbr -a nvo --set-cursor "cd % && nvim"
abbr -a nvp nvim +Man!

abbr -a rmr rm -r
abbr -a rmrf rm -rf

abbr -a fixpacman sudo rm /var/lib/pacman/db.lck
abbr -a untar tar -zxvf
abbr -a wget wget -c
abbr -a grep grep --color=auto
abbr -a hw hwinfo --short
abbr -a update sudo pacman -Syu
abbr -a mirror sudo cachyos-rate-mirrors
abbr -a jctl journalctl -p 3 -xb

abbr -a ninjac ninja -C build/
abbr -a cmakeb cmake --build build

fnm env --use-on-cd | source
