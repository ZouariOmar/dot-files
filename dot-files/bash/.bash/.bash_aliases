# ==================================================================================
# .FILE
#   .bash_aliases
#
# .SYNOPSIS
#   Shell customization script for defining command aliases.
#
# .DESCRIPTION
#   This script is sourced during the initialization of an interactive shell session.
#   It defines shortcuts and command aliases for git, navigation, system management,
#   package management (Arch/Arch-based), networking, editors, and programming languages.
#   The purpose is to speed up repetitive tasks and improve the shell experience.
#
# .PARAMETER N/A
#   This file does not accept parameters; it is sourced automatically by the shell.
#
# .INPUTS
#   None
#
# .OUTPUTS
#   Bash aliases available in the interactive shell session.
#
# .NOTES
#   Version       : 1.0
#   Author        : @ZouariOmar <zouariomar20@gmail.com>
#   Created       : 2026-03-13
#   Change Log    : Initial version
#
# .EXAMPLE
#   $ lg        # opens lazygit
#   $ ..        # go up one directory
#   $ pacu      # update Arch system
# ==================================================================================

# ==================================================================================
# Git aliases
# ==================================================================================
# See https://github.com/ZouariOmar/dot-files/blob/ba66e63e66659133b5a73090e918925d86e716d9/bash/.bashrc
alias lg='lazygit' # Open `lazygit`

# ==================================================================================
# Docker aliases
# ==================================================================================
# See https://github.com/ZouariOmar/dot-files/blob/ba66e63e66659133b5a73090e918925d86e716d9/bash/.bashrc

# ==================================================================================
# Navigation aliases
# ==================================================================================
alias ls='lsd'           # Use 'lsd' for a modern and colorful 'ls' alternative
alias la='ls -a'         # List all files including hidden ones
alias lla='ls -la'       # List all files including hidden ones with detailed information
alias lt='ls --tree'     # Display directory structure as a tree
alias l='ls -lh'         # List files with human-readable sizes using 'lsd'
alias ll='ls -la'        # List files with details (long format)
alias ..='cd ..;pwd'     # Go up one directory
alias ...='cd ../..;pwd' # Go up two directories
alias ~='cd ~;pwd'       # Go to home directory
alias fonts='fc-list'    # List all availble fonts
alias nnn='nnn -Ui'      # n³ with more details
alias ofe='xdg-open .'   # Open File Explorer in current directory

# ==================================================================================
# System Management aliases
# ==================================================================================
alias wmi='whoami'                                                              # Display the current username
alias c='clear'                                                                 # Clear the terminal screen
alias h='history'                                                               # Show command history
alias mkd='mkdir -pv'                                                           # Make a directory and all parent directories with verbosity and go into it
alias df='df -h'                                                                # Show disk usage with human-readable units
alias top='htop'                                                                # Use htop for a more interactive process monitor
alias hostname='cat /etc/hostname'                                              # Show the hostname
alias wordlists='ll /usr/share/wordlists'                                       # Show your wordlists sets
alias cc="sudo sh -c 'echo 3 > /proc/sys/vm/drop_caches'"                       # Drops all pagecache, dentries, and inodes from the RAM
alias kp='keepassxc-cli'                                                        # Shortcut for `keepassxc-cli`
alias xc='xclip -selection clipboard'                                           # Copy the content into the clipboard (ensures it goes to the standard Ctrl+C/Ctrl+V clipboard)
alias neo='neofetch --config /home/zouari_omar/.config/neofetch/acenoster.conf' # Custom Alias for neofetch

# ==================================================================================
# Arch / AUR Package Management aliases
# ==================================================================================
alias pacu='sudo pacman -Syu'  # Updating package database and upgrading system
alias pacc='sudo pacman -Sc'   # Clearing unused pacman cache
alias pacls='pacman -Qs'       # List all installed pacman packages
alias paci='sudo pacman -S'    # Install pacman package
alias pacrm='sudo pacman -Rns' # Remove a specific pacman package
alias yayu='yay -Syu'          # Update all installed packages using yay
alias yayc='yay -Sc'           # Clean up unnecessary package files using yay
alias yayls='yay -Qs'          # List all installed AUR packages
alias yayi='yay -S'            # Install AUR package
alias yayrm='sudo yay -Rns'    # Remove a specific yay package

# ==================================================================================
# Network aliases
# ==================================================================================
alias pubip='curl -s ifconfig.me' # Get Public IP Address
alias shark='sudo tshark --color' # WireShark CLI with colors | Add -l for line-buffered (live monitoring mode)

# ==================================================================================
# Editor aliases
# ==================================================================================
alias v='vim'
alias nv='nvim'

# ==================================================================================
# Programming aliases
# ==================================================================================
alias g++='g++ -std=c++23 -Wall -Wextra -Wpedantic -O2'
alias gcc='gcc -std=c17 -Wall -Wextra -Wpedantic -O2'
alias jlab='jupyter-lab'

# ==================================================================================
# Other aliases
# ==================================================================================
alias dn='devnews'

# ==================================================================================
# End of .bash_aliases
# ==================================================================================
