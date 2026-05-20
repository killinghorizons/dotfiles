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

set -gx LS_COLORS (vivid generate ansi)

## Useful aliases
# Replace ls with eza
# alias ls='eza -al --color=always --group-directories-first --icons' # preferred listing alias la='eza -a --color=always --group-directories-first --icons'  # all files and dirs
# alias ll='eza -l --color=always --group-directories-first --icons'  # long format
# alias lt='eza -aT --color=always --group-directories-first --icons' # tree listing
# alias l.="eza -a | grep -e '^\.'"                                     # show only dotfiles

# Common use
abbr -a nv nvim
abbr -a nvo --set-cursor "cd % && nvim"
abbr -a nvp nvim +Man!

abbr -a fixpacman sudo rm /var/lib/pacman/db.lck
abbr -a untar tar -zxvf
abbr -a wget wget -c
abbr -a grep grep --color=auto
abbr -a hw hwinfo --short
abbr -a update sudo pacman -Syu
# Get fastest mirrors
abbr -a mirror sudo cachyos-rate-mirrors
# Cleanup orphaned packages
# Get the error messages from journalctl
abbr -a jctl journalctl -p 3 -xb

fnm env --use-on-cd | source
