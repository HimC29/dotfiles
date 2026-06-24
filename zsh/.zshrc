# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    archlinux
    colored-man-pages
    sudo
    web-search
    copyfile
    copybuffer
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# ALIASES

# ---------------------------------------------------------------------
# 1. Navigation & Modern CLI Replacements
# ---------------------------------------------------------------------
alias ls='eza --icons' 
alias ll='eza -la --icons'
alias lt='eza --tree --icons'
alias cat="bat"
alias c="clear"
alias x="exit"

# ---------------------------------------------------------------------
# 2. System Shortcuts & Global Modifiers
# ---------------------------------------------------------------------
alias h="history -10"
alias src="source ~/.zshrc"
alias -g G="| grep"

# ---------------------------------------------------------------------
# 3. Development & Network Tools
# ---------------------------------------------------------------------
alias gundo="git reset --soft HEAD~1"
alias priv-ip="ip addr show | grep 'inet 192.168.100' | awk '{print \$2}' | cut -d/ -f1"

# ---------------------------------------------------------------------
# 4. Arch Package Management & Mirrors
# ---------------------------------------------------------------------
alias pac="sudo pacman"
alias update="yay -Syu"
alias check-updates="yay -Qu"
alias grub-up="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias sysclean="sudo pacman -Qdtq | xargs -r sudo pacman -Rns --no-confirm 2>/dev/null; sudo paccache -rk1"
alias update-mirrors="sudo reflector --country Singapore,Taiwan,Japan,Malaysia --latest 20 --protocol https --sort rate --save /etc/pacman.d/mirrorlist"

# ---------------------------------------------------------------------
# 5. Service & VM Management
# ---------------------------------------------------------------------
alias sys="sudo systemctl"
alias enable-bt="rfkill unblock bluetooth && sudo systemctl enable --now bluetooth"
alias disable-bt="sudo systemctl disable --now bluetooth && rfkill block bluetooth"
alias enable-vm="sudo systemctl enable docker libvirtd"
alias disable-vm="sudo systemctl disable docker libvirtd"
alias start-vm="sudo systemctl start docker libvirtd"
alias stop-vm="sudo systemctl stop docker libvirtd"

# ---------------------------------------------------------------------
# 6. Diagnostics, Hardware & Power Monitoring
# ---------------------------------------------------------------------
alias temps='watch sensors'
alias power-use="sudo powerstat -d 0"
alias print-battery-limit="\cat /sys/class/power_supply/BAT0/charge_control_end_threshold | sed '\$ s/\$/%/'"
alias fan-rpm='cat /sys/class/hwmon/hwmon*/fan1_input 2>/dev/null || cat /sys/devices/platform/asus-nb-wmi/hwmon/hwmon*/fan1_input'

# ---------------------------------------------------------------------
# 7. ASUS Thermal Profiles 
# ---------------------------------------------------------------------
alias fan-max='echo 0 | sudo tee /sys/class/hwmon/hwmon*/pwm1_enable > /dev/null'
alias fan-auto='echo 2 | sudo tee /sys/class/hwmon/hwmon*/pwm1_enable > /dev/null'
alias fan-hw-auto='echo 2 | sudo tee /sys/class/hwmon/hwmon*/pwm1_enable > /dev/null'

set-gpu() {
    if [[ -z "$1" ]]; then
        echo "Usage: gpu [int|ext|hybrid]"
        return 1
    fi

    case "$1" in
        int)
            sudo systemctl mask nvidia-suspend.service nvidia-resume.service nvidia-hibernate.service
            sudo envycontrol -s integrated
            ;;
        ext)
            sudo systemctl unmask nvidia-suspend.service nvidia-resume.service nvidia-hibernate.service
            sudo envycontrol -s nvidia
            ;;
        hybrid)
            sudo systemctl unmask nvidia-suspend.service nvidia-resume.service nvidia-hibernate.service
            sudo envycontrol -s hybrid
            ;;
        *)
            echo "Invalid mode: $1 (Use int, ext, or hybrid)"
            return 1
            ;;
    esac
}

ql() {
    if [[ -z "$1" ]]; then
        echo "Usage: ql <file_or_dir>"
        return 1
    fi

    if [[ -d "$1" ]]; then
        eza --icons "$1"
    elif [[ -f "$1" ]]; then
        bat --color=always "$1" | less -RF
    else
        echo "$1 does not exist."
        return 1
    fi
    return 0
}

trash() {
    if [[ -z "$1" ]]; then
        echo "Usage: trash <file_or_dir>"
        return 1
    fi

    if [[ -e "$1" ]]; then
        kioclient5 move "$1" trash:/
    else
        echo "$1 does not exist."
        return 1
    fi
    return 0
}

check-update() {
    local updates=$(checkupdates)

    if [[ -n "$updates" ]]; then
        local updateCount=$(wc -l <<< "$updates")
        echo "$updateCount updates available:"
        echo
        echo "$updates" | less
    else
        echo "System is up to date." 
    fi
}

path() {
    local currentPath=$(pwd)
    echo "$currentPath"
    wl-copy "$currentPath"
}

caps-led() {
    if [[ -z "$1" ]]; then
    echo "Usage: on / off"
        return 1
    fi

    case "$1" in
        on)
            echo 1 | sudo tee /sys/class/leds/input4::capslock/brightness > /dev/null
            ;;
        off)   
            echo 0 | sudo tee /sys/class/leds/input4::capslock/brightness > /dev/null
            ;;
        blink)
            local time="$2"
            if ! sleep "$time" >/dev/null 2>&1; then 
                echo "invalid blink duration, defaulting to 1 sec"
                time=1
            fi
            echo 1 | sudo tee /sys/class/leds/input4::capslock/brightness > /dev/null
            sleep "$time"
            echo 0 | sudo tee /sys/class/leds/input4::capslock/brightness > /dev/null
            ;;
    esac
}

# Created by `pipx` on 2026-03-22 15:12:44
export PATH="$PATH:/home/himc29/.local/bin"
export LIBVIRT_DEFAULT_URI="qemu:///system"

#source /usr/share/zsh/plugins/zsh-you-should-use/you-should-use.plugin.zsh
export YSU_MESSAGE_POSITION="after"
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh



# Added by Antigravity CLI installer
export PATH="/home/himc29/.local/bin:$PATH"
