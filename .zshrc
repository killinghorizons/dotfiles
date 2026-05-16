### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

# Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Snippets
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found
zinit snippet OMZP::git

# Load completions
autoload -U compinit && compinit
zinit cdreplay -q

# Emacs style kbd
#
bindkey -e
# bindkey "^p" history-search-backward
# bindkey "^n" history-search-forward

bindkey "^P" up-line-or-beginning-search
bindkey "^N" down-line-or-beginning-search

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ":completion:*" matcher-list "m:{a-z}={A-Za-z}"
zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}"
zstyle ":completion:*" menu no
zstyle ":fzf-tab:complete:cd:*" fzf-preview "ls --color $realpath"
zstyle ":fzf-tab:complete:__zoxide_z:*" fzf-preview "ls --color $realpath"

# Aliases
alias update="sudo dnf update"
alias del="sudo dnf remove"
alias autoremove="sudo dnf autoremove"
alias ls="ls --color"
# :)
alias sl="ls --color"

alias rmr="rm -r"
alias rmrf="rm -rf"
alias nuke="rm -rf *"

alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias nv=nvim
alias zconf="nvim ~/.zshrc"
alias nvconf="cd ~/.config/nvim && nvim"
alias gconf="nvim ~/.config/ghostty/config.ghostty"
alias hpconf="nvim ~/.config/hypr/hyprland.conf"
alias fconf="nvim ~/.config/foot/foot.ini"
alias py="python3"
alias gg="uv run python"

# C++ aliases
alias cmm="cmake --build build"
alias mkbuild="mkdir build && cd build"
alias cmakenr="cmake -G "Ninja" -DCMAKE_BUILD_TYPE=Release ."
alias cmakend="cmake -G "Ninja" -DCMAKE_BUILD_TYPE=Debug .."


grun() {
    local std="20"

    # Check if first argument is a number (C++ standard)
    if [[ "$1" =~ ^[0-9]+$ ]]; then
        std="$1"
        shift
    fi

    g++ -std="c++$std" "$@" -o prog && ./prog
}

nvo() {
  cd "$1" && nvim .
}

# Shell integrations
eval "$(fzf --zsh)"
# eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"

# Make sure this stuff is in the path.
export PATH="$HOME/.cargo/bin:$PATH" # cargo
export PATH="$HOME/.local/bin:$PATH" # Local scripts.

# Set up neovim as the default editor.
EDITOR="$(which nvim)"
export EDITOR
export VISUAL="$EDITOR"

export CMAKE_GENERATOR=Ninja
# export CC=clang
# export CXX=clang++

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
