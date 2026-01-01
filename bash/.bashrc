# ==================================================================================
# .FILE
#   .bashrc
#
# .SYNOPSIS
#   Shell initialization script for interactive sessions.
#
# .DESCRIPTION
#   This script is executed whenever a new interactive shell session is started.
#   It sets up environment variables, command aliases, toolchains (e.g., SDKMAN),
#   and customizations to improve the user shell experience.
#
# .PARAMETER N/A
#   This file does not accept parameters; it's sourced automatically by the shell.
#
# .INPUTS
#   None
#
# .OUTPUTS
#   Environment settings, shell behavior configurations, and aliases.
#
# .NOTES
#   Version       : 1.1
#   Author        : @ZouariOmar <zouariomar20@gmail.com>
#   Created       : 2025-09-12
#   Change Log    : d911998
#
# .EXAMPLE
#   N/A — this file is sourced automatically by the shell.
# ==================================================================================

#Set bash header theme
POSH_THEME="blue-owl"
eval "$(oh-my-posh init bash --config /home/zouari_omar/.local/share/themes/${POSH_THEME}.omp.json)"

# Ignore duplicate commands in the history
HISTCONTROL=ignoredups

# Custom Alias for neofetch
alias neof='neofetch --config /home/zouari_omar/.config/neofetch/acenoster.conf'

# Navigation Aliases
alias ls="lsd"           # Use 'lsd' for a modern and colorful 'ls' alternative
alias la="ls -a"         # List all files including hidden ones
alias lla="ls -la"       # List all files including hidden ones with detailed information
alias lt="ls --tree"     # Display directory structure as a tree
alias l="ls -lh"         # List files with human-readable sizes using 'lsd'
alias ll="ls -la"        # List files with details (long format)
alias ..="cd ..;pwd"     # Go up one directory
alias ...="cd ../..;pwd" # Go up two directories
alias ~="cd ~;pwd"       # Go to home directory
alias fonts="fc-list"    # List all availble fonts
alias nnn="nnn -Ui"      # n³ with more details

# Git Aliases
# alias ga='git add'             # Add files to staging
# alias gaa='git add --all'      # Add all files to Git
# alias gc='git commit'          # Commit changes
# alias gca='git commit --amend' # Amend the last commit
# alias gc='git checkout'        # Checkout a branch or file
# alias gcb='git checkout -b'    # Create a new Git branch and move to the new branch at the same time
# alias gl='git log --oneline'   # Show the log as a single line
# alias gs='git status'          # Check the status of your git repo
# alias gd='git diff'            # View the difference
alias lg='lazygit' # Open `lazygit`

# System Management Aliases
alias wmi="whoami"                                       # Display the current username
alias c="clear"                                          # Clear the terminal screen
alias h="history"                                        # Show command history
alias mkd="mkdir -pv"                                    # Make a directory and all parent directories with verbosity and go into it
alias df="df -h"                                         # Show disk usage with human-readable units
alias top="htop"                                         # Use htop for a more interactive process monitor
alias hostname="cat /etc/hostname"                       # Show the hostname
alias wordlists='ll /usr/share/wordlists'                # Show your wordlists sets
alias cc="sudo sh -c 'echo 3 > /proc/sys/vm/drop_caches" # Drops all pagecache, dentries, and inodes from the RAM
alias kp='keepassxc-cli'                                 # Shortcut for `keepassxc-cli`

# Arch Aliases
alias pacu="sudo pacman -Syu"                  # Updating package database and upgrading system
alias pacc="sudo pacman -Sc"                   # Clearing unused pacman cache
alias paccc="sudo pacman -Rns $(pacman -Qtdq)" # Remove unused pacman packages
alias pacls="pacman -Qs"                       # List all installed pacman packages
alias paci="sudo pacman -Sy"                   # Install pacman package
alias pacrm="sudo pacman -Rns"                 # Remove a specific pacman package
alias yayu="yay -Syu"                          # Update all installed packages using yay
alias yayc="yay -Sc"                           # Clean up unnecessary package files using yay
alias yaycc="yay -Rns $(yay -Qtdq)"            # Remove unused yay packages
alias yayls="yay -Qs"                          # List all installed AUR packages
alias paci="yay -Sy"                           # Install AUR package
alias yayrm="sudo yay -Rns"                    # Remove a specific yay package

# Network Aliases
alias prvip="ip a | grep inet | grep -v inet6 | awk '{print $2}' | cut -d/ -f1" # Get Private IP Address
alias pubip="curl -s ifconfig.me"                                               # Get Public IP Address
alias shark='sudo tshark --color'                                               # WireShark CLI with colors | Add -l for line-buffered (live monitoring mode)

# Docker Aliases
# alias dps="docker ps"          # List running containers
# alias dimages="docker images"  # List Docker images
# alias dbuild="docker build -t" # Build a Docker image
# alias dstop="docker stop"      # Stop a running container

# Editor(s) Aliases
alias v='vim'
alias nv='nvim'

# C, C++ & Python Aliases
alias g++='g++ -std=c++23 -Wall -Wextra -Wpedantic -O2'
alias gcc='gcc -std=c17 -Wall -Wextra -Wpedantic -O2'
alias jlab='jupyter-lab'

# Show latest `$1` Arch Linux news before upgrading
pacnews() {
  if [ "$#" -ne 1 ]; then
    echo "Usage: pacnews <latest_news_number>"
    return 1
  fi

  echo "🔔 Latest Arch Linux news:"
  curl -s https://archlinux.org/news/ |
    grep -Eo 'href="/news/[^"]+"' |
    cut -d'"' -f2 |
    head -n "$1" |
    sed 's|^|https://archlinux.org|'

  echo -e ".\n.\n.\n."
  read -p "Do you want to continue with the system upgrade? [y/N] " answer
  if [[ "$answer" =~ ^[yY]$ ]]; then
    sudo pacman -Syu
  else
    echo "⏹️ Upgrade cancelled."
  fi
}

# Launch `nnn` as `n` and change to the last visited directory on exit
n() {
  export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
  nnn "$@"
  if [ -f "$NNN_TMPFILE" ]; then
    . "$NNN_TMPFILE"
    rm -f "$NNN_TMPFILE"
  fi
}

# Load VirtualBox modules
load_vb() {
  sudo modprobe vboxdrv
  sudo modprobe vboxnetflt
  sudo modprobe vboxnetadp
}

# Set Bash
BASH_HOME="$HOME/.bash"

# Set EDITOR
export EDITOR="nv"

# Set JAVA
export JAVA_HOME=/usr/lib/jvm/default
export PATH=$JAVA_HOME/bin:$PATH

# Set MAVEN
export M2_HOME="$HOME/.m2"

# Set PIO
# export PLATFORMIO_HOME="$HOME/.local/bin"
# export PATH=$PATH:$PLATFORMIO_HOME

# Set Android SDK home
# export ANDROID_HOME=$HOME/Android/Sdk
# export PATH=$PATH:/opt/android-studio/bin
# export PATH=$PATH:$ANDROID_HOME/emulator
# export PATH=$PATH:$ANDROID_HOME/platform-tools
# export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin

# Set Symfony
# export SYMFONY_HOME="$HOME/.symfony5"
# export PATH="$SYMFONY_HOME/bin:$PATH"

# Set SDKMAN (for JVM toolchains)
export SDKMAN_DIR="$HOME/.sdkman"
export PATH="$PATH:$HOME/.sdkman/candidates/java/current/bin"

# Set npm
NPM_GLOBAL_HOME="$HOME/.npm-global"
export PATH="$NPM_GLOBAL_HOME/bin:$PATH"

# Set NVM_DIR && load `nvm`
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Load custom colors
[[ -s $BASH_HOME/.bash_colors ]] && source "$BASH_HOME/.bash_colors"

# Enable bash completion features
[[ -s /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion

# Init sdkman
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

# Load nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# Load angular cli autocompletion
source <(ng completion script)
